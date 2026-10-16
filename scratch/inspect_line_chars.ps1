$c = Get-Content 'scripts/cosmicpv/cosmicpv.html' -Encoding UTF8
$l = $c[482]
Write-Host "Line 483 text: '$l'"
for ($i = 0; $i -lt $l.Length; $i++) {
    Write-Host ('[{0}] = {1} (U+{2:X4})' -f $i, $l[$i], [int]$l[$i])
}
