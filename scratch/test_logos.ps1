$js = Get-Content "unlisted-shares.js" -Raw -Encoding UTF8
$matches = [regex]::Matches($js, "logo:\s*'([^']+)'")
$missing = @()
$found = 0
foreach ($m in $matches) {
    $path = $m.Groups[1].Value
    if (Test-Path $path) {
        $found++
    } else {
        $missing += "Logo: $path"
    }
}
Write-Host "Total company logos tested: $($matches.Count)"
Write-Host "Total existing logos found: $found"
if ($missing.Count -gt 0) {
    Write-Host "MISSING LOGOS:" -ForegroundColor Red
    $missing | ForEach-Object { Write-Host $_ -ForegroundColor Red }
} else {
    Write-Host "ALL COMPANY LOGOS EXIST ON DISK!" -ForegroundColor Green
}
