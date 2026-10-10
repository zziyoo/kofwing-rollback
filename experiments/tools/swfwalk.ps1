# Independent SWF tag-stream walker. Does NOT use JPEXS.
# Walks the uncompressed tag stream and verifies it terminates on a valid
# End tag (code 0) without running off the end of the declared file length.
# Usage: swfwalk.ps1 <uncompressedSwf> <outCsv> <outSummary>
param(
  [Parameter(Mandatory=$true)][string]$Swf,
  [Parameter(Mandatory=$true)][string]$OutCsv,
  [Parameter(Mandatory=$true)][string]$OutSummary
)
$ErrorActionPreference = 'Stop'

$fs = [System.IO.File]::OpenRead($Swf)
$br = New-Object System.IO.BinaryReader($fs)
try {
  $sig = [System.Text.Encoding]::ASCII.GetString($br.ReadBytes(3))
  if ($sig -ne 'FWS') { throw "expected FWS (uncompressed) but got '$sig'" }
  $null = $br.ReadByte()                 # version
  $declared = $br.ReadUInt32()

  # RECT
  $b0 = $br.ReadByte()
  $nbits = ($b0 -shr 3) -band 0x1f
  $rectBytes = [int][Math]::Ceiling((5 + (4 * $nbits)) / 8.0)
  $null = $br.ReadBytes($rectBytes - 1)
  $framerate  = $br.ReadUInt16() / 256.0
  $frameCount = $br.ReadUInt16()

  $counts = @{}
  $order  = New-Object System.Collections.Generic.List[int]
  $n = 0
  $endSeen = $false
  $overrun = $false
  $tagOrder = New-Object System.Collections.Generic.List[int]

  while ($true) {
    if ($fs.Position + 2 -gt $declared) { $overrun = $true; break }
    $hdr = $br.ReadUInt16()
    $code = $hdr -shr 6
    $len  = $hdr -band 0x3f
    if ($len -eq 0x3f) { $len = $br.ReadUInt32() }
    [void]$tagOrder.Add($code)
    $n++
    if ($counts.ContainsKey($code)) { $counts[$code]++ } else { $counts[$code] = 1; [void]$order.Add($code) }
    if ($code -eq 0) { $endSeen = $true; break }   # End tag
    $null = $br.ReadBytes($len)
  }

  $md5 = [System.Security.Cryptography.MD5]::Create()
  $hash = [BitConverter]::ToString($md5.ComputeHash([Text.Encoding]::UTF8.GetBytes(($tagOrder -join ',')))).Replace('-','')

  $sb = New-Object System.Text.StringBuilder
  [void]$sb.AppendLine("file`t$Swf")
  [void]$sb.AppendLine("declaredLength`t$declared")
  [void]$sb.AppendLine("actualLength`t$($fs.Length)")
  [void]$sb.AppendLine("framerate`t$framerate")
  [void]$sb.AppendLine("frameCount`t$frameCount")
  [void]$sb.AppendLine("tagsWalked`t$n")
  [void]$sb.AppendLine("endTagReached`t$endSeen")
  [void]$sb.AppendLine("ranPastDeclaredLength`t$overrun")
  [void]$sb.AppendLine("stopOffset`t$($fs.Position)")
  [void]$sb.AppendLine("bytesAfterEndTag`t$($declared - $fs.Position)")
  [void]$sb.AppendLine("tagCodeSequenceMD5`t$hash")
  [void]$sb.AppendLine("distinctTagCodes`t$($counts.Count)")
  [IO.File]::WriteAllText($OutSummary, $sb.ToString(), (New-Object Text.UTF8Encoding($false)))

  $csv = New-Object System.Text.StringBuilder
  [void]$csv.AppendLine("tagCode,count")
  foreach ($c in ($order | Sort-Object)) { [void]$csv.AppendLine("$c,$($counts[$c])") }
  [IO.File]::WriteAllText($OutCsv, $csv.ToString(), (New-Object Text.UTF8Encoding($false)))

  Get-Content $OutSummary
} finally { $br.Dispose(); $fs.Dispose() }