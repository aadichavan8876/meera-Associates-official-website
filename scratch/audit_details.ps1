# Deep audit of Hero Section, Company Details Table, Financials, and FAQs
$scrips = @("ppfas", "frickindia", "sundayproptech", "carrier", "cial", "motilaloswalhf", "nayaraenergy")

foreach ($s in $scrips) {
    $p = $s
    if ($s -eq "frickindia") { $p = "frick" }
    if ($s -eq "sundayproptech") { $p = "sunday" }
    if ($s -eq "motilaloswalhf") { $p = "mohf" }
    if ($s -eq "nayaraenergy") { $p = "nayara" }

    $html = Get-Content "scripts/$s/$s.html" -Raw -Encoding UTF8
    $cssFile = "scripts/$s/$p.css"
    if (-not (Test-Path $cssFile)) {
        $cssFile = "scripts/$s/$s.css"
    }
    $css = Get-Content $cssFile -Raw -Encoding UTF8

    Write-Host "=================== $s (Prefix: $p) ==================="
    # 1. Hero check
    $hasHero = $html.Contains("$p-hero") -and $css.Contains(".$p-hero")
    $hasCopyBtn = $html.Contains('id="copy-isin-btn"')
    $hasStrip = $html.Contains("$p-metrics-strip") -and $css.Contains(".$p-metrics-strip")
    Write-Host "Hero Check: Hero=$hasHero, CopyBtn=$hasCopyBtn, Strip=$hasStrip"

    # 2. Table classes check
    $tableClassesInHtml = [regex]::Matches($html, 'class="([^"]*(?:table|spec|td)[^"]*)"') | ForEach-Object { $_.Groups[1].Value } | Select-Object -Unique
    $missingTableCss = @()
    foreach ($tc in $tableClassesInHtml) {
        $first = ($tc -split '\s+')[0]
        if (-not $css.Contains(".$first")) {
            $missingTableCss += $first
        }
    }
    Write-Host "Table Classes in HTML: $($tableClassesInHtml -join ', ')"
    if ($missingTableCss.Count -gt 0) {
        Write-Host "  MISSING Table CSS: $($missingTableCss -join ', ')" -ForegroundColor Red
    } else {
        Write-Host "  All Table Classes styled in CSS" -ForegroundColor Green
    }

    # 3. Financials Check
    $hasFinancials = $html.Contains("Audited Financial Performance") -or $html.Contains("Financial Performance")
    if ($hasFinancials) {
        $hasCanvas = $html.Contains("<canvas id=""$p-fin-canvas""")
        $hasKpiCards = $html.Contains("fin-kpi-summary-grid")
        $hasTablesInFin = ($html -match '(?s)(?:id="[^"]*fin-graph-container".*?<table|<table.*?id="[^"]*fin-graph-container")')
        Write-Host "Financials: Present=$hasFinancials, Canvas=$hasCanvas, KPIs=$hasKpiCards, IllegalTablesFound=$hasTablesInFin"
    } else {
        Write-Host "Financials: None required/present for this scrip"
    }

    # 4. FAQ check
    $faqClassesInHtml = [regex]::Matches($html, 'class="([^"]*faq[^"]*)"') | ForEach-Object { $_.Groups[1].Value } | Select-Object -Unique
    $missingFaqCss = @()
    foreach ($fc in $faqClassesInHtml) {
        $first = ($fc -split '\s+')[0]
        if (-not $css.Contains(".$first")) {
            $missingFaqCss += $first
        }
    }
    Write-Host "FAQ Classes in HTML: $($faqClassesInHtml -join ', ')"
    if ($missingFaqCss.Count -gt 0) {
        Write-Host "  MISSING FAQ CSS: $($missingFaqCss -join ', ')" -ForegroundColor Red
    } else {
        Write-Host "  All FAQ Classes styled in CSS" -ForegroundColor Green
    }
}
