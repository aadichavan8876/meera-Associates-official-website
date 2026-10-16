$scrips = @('ppfas', 'cial', 'frickindia', 'herofincorp', 'csk', 'motilaloswalhf', 'goodluckdefence')
foreach ($s in $scrips) {
    $html = "scripts\$s\$s.html"
    $js = "scripts\$s\$s.js"
    $hContent = if (Test-Path $html) { Get-Content $html -Raw } else { "" }
    $jContent = if (Test-Path $js) { Get-Content $js -Raw } else { "" }
    $hasFinHtml = $hContent -match "fin-graph-container" -or $hContent -match "Financial Performance"
    $hasFinJs = $jContent -match "initFinancialChart"
    $hasChartDep = $hContent -match "chart.min.js"
    Write-Output "$s : finHtml=$hasFinHtml, finJs=$hasFinJs, chartDep=$hasChartDep"
}
