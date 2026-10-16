$ncdex = [System.IO.File]::ReadAllText('scripts/ncdex/ncdex.html', [System.Text.Encoding]::UTF8)
$gfclev = [System.IO.File]::ReadAllText('scripts/gfclev/gfclev.html', [System.Text.Encoding]::UTF8)

Write-Host "=== NCDEX Cards ==="
$m1 = [regex]::Matches($ncdex, '<!-- Card \d+: (.*?) -->')
foreach ($m in $m1) { Write-Host $m.Groups[1].Value }

Write-Host "`n=== GFCL EV Cards ==="
$m2 = [regex]::Matches($gfclev, '<!-- Card \d+: (.*?) -->')
foreach ($m in $m2) { Write-Host $m.Groups[1].Value }
