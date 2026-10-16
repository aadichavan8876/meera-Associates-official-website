$scripList = @("nerl", "nayaraenergy", "oyo", "hdfcsecurities", "motilaloswalhf")
foreach ($s in $scripList) {
    $html = Get-ChildItem -Path scripts\$s -Filter *.html
    $content = Get-Content $html.FullName -Raw -Encoding UTF8
    Write-Host "=== $s ==="
    $heroMatch = [regex]::Match($content, '(?s)<section class="[^"]*hero[^"]*">.*?</section>')
    if ($heroMatch.Success) {
        $lines = $heroMatch.Value -split "`r?`n"
        $lines | Select-Object -First 35 | ForEach-Object { $_ }
    }
}
