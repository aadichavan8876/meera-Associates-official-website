$scripList = @("nayaraenergy", "oyo", "hdfcsecurities", "motilaloswalhf")
foreach ($s in $scripList) {
    $css = Get-ChildItem -Path scripts\$s -Filter *.css
    Write-Host "=== $s ==="
    Select-String -Path $css.FullName -Pattern 'metric-card|metric-label|metric-value|metric-sub' | Select-Object -First 4 | ForEach-Object { $_.Line.Trim() }
}
