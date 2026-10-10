# Independent SWF header reader (does not use JPEXS).
# NOTE on container layout:
#   FWS : sig(3) ver(1) FileLength(4) RECT  framerate(2) frameCount(2) body...
#   CWS : sig(3) ver(1) FileLength(4) CompressedLength(4) zlib-body...      (no RECT in header)
#   ZWS : sig(3) ver(1) FileLength(4) CompressedLength(4) lzma-body...     (no RECT in header)
# For compressed containers the RECT/framerate/frameCount live INSIDE the
# compressed body and are not readable without decompressing first.
# Usage: swfheader.ps1 <swf> [<swf> ...]
param([Parameter(ValueFromRemainingArguments=$true)][string[]]$Paths)

function Read-SwfHeader($p) {
  $fs = [System.IO.File]::OpenRead($p)
  $br  = New-Object System.IO.BinaryReader($fs)
  try {
    $sig = [System.Text.Encoding]::ASCII.GetString($br.ReadBytes(3))
    $ver = $br.ReadByte()
    $declared = $br.ReadUInt32()
    $stored = $fs.Length

    $o = [ordered]@{
      File           = [System.IO.Path]::GetFileName($p)
      Signature      = $sig
      Version        = $ver
      DeclaredLength = $declared
      StoredLength   = $stored
      StoredMinusDecl= ($stored - $declared)
    }

    if ($sig -eq 'FWS') {
      # RECT: 5-bit Nbits then 4 values of Nbits  => 5 + 4*Nbits bits total
      $b0 = $br.ReadByte()
      $nbits = ($b0 -shr 3) -band 0x1f
      $rectBytes = [int][Math]::Ceiling((5 + (4 * $nbits)) / 8.0)
      $null = $br.ReadBytes($rectBytes - 1)   # b0 already consumed
      $framerate  = $br.ReadUInt16() / 256.0
      $frameCount = $br.ReadUInt16()
      $o['RECTNbits']  = $nbits
      $o['HeaderBytes']= $fs.Position
      $o['Framerate']  = $framerate
      $o['FrameCount'] = $frameCount
    } else {
      $compLen = $br.ReadUInt32()
      $o['CompressedLengthField'] = $compLen
      $o['HeaderBytes'] = $fs.Position
      $o['Note'] = 'RECT/framerate/frameCount are inside the compressed body; decompress first'
    }
    [pscustomobject]$o
  } finally { $br.Dispose(); $fs.Dispose() }
}

foreach ($p in $Paths) { Read-SwfHeader $p | Format-List }