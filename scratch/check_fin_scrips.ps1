$files = Get-ChildItem -Path "scripts" -Recurse -Filter "*.html"
$finScrips = New-Object System.Collections.Generic.List[string]

foreach ($f in $files) {
    $scrip = $f.Directory.Name
    $content = [System.IO.File]::ReadAllText($f.FullName)
    if ($content -match 'Financial Performance' -or $content -match 'fin-kpi-grid' -or $content -match 'fin-chart-canvas-wrapper' -or $content -match 'chart\.js') {
        $finScrips.Add($scrip)
    }
}

Write-Output "Scrips with Financial sections ($($finScrips.Count)):"
$finScrips | ForEach-Object { Write-Output " - $_" }
