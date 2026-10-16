$files = Get-ChildItem -Path "scripts" -Recurse -Filter "*.html"
foreach ($f in $files) {
    $content = Get-Content $f.FullName -Raw
    $hasFin = $content -match "Financial (Performance|Highlights|Summary|Overview|Growth)" -or $content -match "Key Financial Metrics"
    if ($hasFin) {
        Write-Output "$($f.FullName.Replace('d:\meera Associates official website\', '')) : has financial section"
    }
}
