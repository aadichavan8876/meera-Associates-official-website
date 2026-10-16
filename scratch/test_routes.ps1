$js = Get-Content "unlisted-shares.js" -Raw -Encoding UTF8
$matches = [regex]::Matches($js, "'([^']+)'\s*:\s*'([^']+\.html)'")
$missing = @()
$found = 0
foreach ($m in $matches) {
    $key = $m.Groups[1].Value
    $path = $m.Groups[2].Value
    if (Test-Path $path) {
        $found++
    } else {
        $missing += "Key: $key -> Path: $path"
    }
}
Write-Host "Total mapped routes tested: $($matches.Count)"
Write-Host "Total valid target files found: $found"
if ($missing.Count -gt 0) {
    Write-Host "MISSING FILES:" -ForegroundColor Red
    $missing | ForEach-Object { Write-Host $_ -ForegroundColor Red }
} else {
    Write-Host "ALL MAPPED ROUTES POINT TO VALID FILES!" -ForegroundColor Green
}
