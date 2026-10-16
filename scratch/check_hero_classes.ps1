$scripList = @("nerl", "nayaraenergy", "oyo", "hdfcsecurities", "motilaloswalhf")
foreach ($s in $scripList) {
    $css = Get-ChildItem -Path scripts\$s -Filter *.css
    Write-Host "=== $s ==="
    Select-String -Path $css.FullName -Pattern 'company-title|hero-title|company-desc|hero-subtitle|badge-strip|hero-badge' | ForEach-Object { $_.Line.Trim() }
}
