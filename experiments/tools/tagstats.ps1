# Tag histogram extractor for JPEXS -dumpSWF output.
# Usage: tagstats.ps1 <dumpFile> <outCsv> <outSummary>
param(
  [Parameter(Mandatory=$true)][string]$Dump,
  [Parameter(Mandatory=$true)][string]$OutCsv,
  [Parameter(Mandatory=$true)][string]$OutSummary
)
$ErrorActionPreference = 'Stop'

$rx = [regex]'^[0-9a-f]+:\s+(\d+)\.\s+(.*?)\s+tagId=\s*(\d+)\s+len=\s*(\d+)'

$counts = @{}
$order  = New-Object System.Collections.Generic.List[string]
$total  = 0
$first  = $null
$last   = $null
$lastOffset = $null
$endSeen = $false
$seq = New-Object System.Collections.Generic.List[string]

$reader = [System.IO.StreamReader]::new($Dump, [System.Text.Encoding]::UTF8, $true, 1048576)
try {
  while ($null -ne ($line = $reader.ReadLine())) {
    $m = $rx.Match($line)
    if (-not $m.Success) { continue }
    $idx    = [int]$m.Groups[1].Value
    $rawName = $m.Groups[2].Value.Trim()
    # strip per-instance detail like "(chid: 1)" / "(dpt: 7)" so the histogram
    # groups by tag TYPE instead of one bucket per character id
    $name   = ($rawName -replace '\s*\(.*\)\s*$', '').Trim()
    $tagId  = $m.Groups[3].Value
    $key    = "$tagId`t$name"
    if ($counts.ContainsKey($key)) { $counts[$key] += 1 } else { $counts[$key] = 1; [void]$order.Add($key) }
    $total++
    [void]$seq.Add("$idx`t$tagId`t$name")
    if ($null -eq $first) { $first = "$idx`t$name" }
    $last = "$idx`t$name"
    $lastOffset = ($line -split ':')[0]
    if ($tagId -eq '0') { $endSeen = $true }
  }
} finally { $reader.Dispose() }

# ordered per-tag sequence fingerprint (detects reordering)
$md5 = [System.Security.Cryptography.MD5]::Create()
$joined = ($seq -join "`n")
$hash = [BitConverter]::ToString($md5.ComputeHash([Text.Encoding]::UTF8.GetBytes($joined))).Replace('-','')

$sb = New-Object System.Text.StringBuilder
[void]$sb.AppendLine("dumpFile`t$Dump")
[void]$sb.AppendLine("totalTags`t$total")
[void]$sb.AppendLine("firstTag`t$first")
[void]$sb.AppendLine("lastTag`t$last")
[void]$sb.AppendLine("lastOffsetHex`t$lastOffset")
[void]$sb.AppendLine("endTagPresent`t$endSeen")
[void]$sb.AppendLine("tagSequenceMD5`t$hash")
[void]$sb.AppendLine("distinctTagTypes`t$($counts.Count)")
[IO.File]::WriteAllText($OutSummary, $sb.ToString(), (New-Object Text.UTF8Encoding($false)))

$csv = New-Object System.Text.StringBuilder
[void]$csv.AppendLine("tagId,tagName,count")
foreach ($k in ($order | Sort-Object { [int]($_ -split "`t")[0] })) {
  $parts = $k -split "`t"
  [void]$csv.AppendLine(("{0},{1},{2}" -f $parts[0], $parts[1], $counts[$k]))
}
[IO.File]::WriteAllText($OutCsv, $csv.ToString(), (New-Object Text.UTF8Encoding($false)))

Get-Content $OutSummary