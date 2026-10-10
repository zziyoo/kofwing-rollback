# Compare two exported .as trees by relative path + SHA-256.
# Usage: compare_scripts.ps1 <baselineRoot> <candidateRoot> <outReport>
param(
  [Parameter(Mandatory=$true)][string]$A,
  [Parameter(Mandatory=$true)][string]$B,
  [Parameter(Mandatory=$true)][string]$OutReport
)
$ErrorActionPreference = 'Stop'

function Get-Map($root) {
  $map = @{}
  $base = (Resolve-Path $root).Path.TrimEnd('\')
  foreach ($f in [System.IO.Directory]::EnumerateFiles($base, '*.as', [System.IO.SearchOption]::AllDirectories)) {
    $rel = $f.Substring($base.Length).TrimStart('\')
    $map[$rel] = (Get-FileHash -LiteralPath $f -Algorithm SHA256).Hash
  }
  $map
}

$ma = Get-Map $A
$mb = Get-Map $B

$onlyA = @($ma.Keys | Where-Object { -not $mb.ContainsKey($_) })
$onlyB = @($mb.Keys | Where-Object { -not $ma.ContainsKey($_) })
$changed = New-Object System.Collections.Generic.List[string]
foreach ($k in $ma.Keys) {
  if ($mb.ContainsKey($k)) {
    if ($ma[$k] -ne $mb[$k]) { [void]$changed.Add($k) }
  }
}
$same = $ma.Count - $onlyA.Count - $changed.Count

$sb = New-Object System.Text.StringBuilder
[void]$sb.AppendLine("baselineRoot`t$A")
[void]$sb.AppendLine("candidateRoot`t$B")
[void]$sb.AppendLine("baselineFiles`t$($ma.Count)")
[void]$sb.AppendLine("candidateFiles`t$($mb.Count)")
[void]$sb.AppendLine("identical`t$same")
[void]$sb.AppendLine("changed`t$($changed.Count)")
[void]$sb.AppendLine("onlyInBaseline`t$($onlyA.Count)")
[void]$sb.AppendLine("onlyInCandidate`t$($onlyB.Count)")
[void]$sb.AppendLine('--- changed files ---')
foreach ($c in ($changed | Sort-Object)) { [void]$sb.AppendLine("CHANGED`t$c") }
foreach ($c in ($onlyA | Sort-Object | Select-Object -First 50)) { [void]$sb.AppendLine("ONLY_BASELINE`t$c") }
foreach ($c in ($onlyB | Sort-Object | Select-Object -First 50)) { [void]$sb.AppendLine("ONLY_CANDIDATE`t$c") }

[IO.File]::WriteAllText($OutReport, $sb.ToString(), (New-Object Text.UTF8Encoding($false)))
Get-Content $OutReport -TotalCount 40