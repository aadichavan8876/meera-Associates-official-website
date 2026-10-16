# Check layout classes between HTML and CSS for all 5 new scrips
$pages = @("ppfas", "frickindia", "sundayproptech", "carrier", "cial")

foreach ($p in $pages) {
    $prefix = $p
    if ($p -eq "frickindia") { $prefix = "frick" }
    if ($p -eq "sundayproptech") { $prefix = "sunday" }
    $cssFile = "scripts/$p/$($p).css"
    if (-not (Test-Path $cssFile)) {
        $cssFile = "scripts/$p/$($prefix).css"
    }
    $htmlFile = "scripts/$p/$($p).html"

    $css = Get-Content $cssFile -Raw -Encoding UTF8
    $html = Get-Content $htmlFile -Raw -Encoding UTF8

    Write-Host "=== $p (Prefix: $prefix) ==="
    Write-Host "CSS: $cssFile ($($css.Length) chars)"
    Write-Host "HTML: $htmlFile ($($html.Length) chars)"

    # Check key layout classes in CSS
    $classes = @(
        "$prefix-page-wrap",
        "$prefix-hero",
        "$prefix-hero-container",
        "$prefix-hero-badge",
        "$prefix-hero-title",
        "$prefix-hero-subtitle",
        "$prefix-metrics-strip",
        "$prefix-body-container",
        "$prefix-content-grid",
        "$prefix-main-col",
        "$prefix-card",
        "$prefix-card-header",
        "$prefix-card-title",
        "$prefix-card-tag",
        "$prefix-table-responsive",
        "$prefix-table",
        "$prefix-sidebar-col",
        "directors-grid",
        "director-card",
        "moats-grid",
        "moat-card",
        "subsections-tri-grid",
        "sub-feature-card",
        "sidebar-brand-card",
        "sidebar-logo-box",
        "sidebar-logo-img",
        "sidebar-trade-card",
        "sidebar-compliance-card",
        "sidebar-peers-card"
    )

    $missingInCss = @()
    $missingInHtml = @()

    foreach ($c in $classes) {
        if (-not $css.Contains(".$c")) { $missingInCss += $c }
        if (-not ($html.Contains("class=""$c""") -or $html.Contains("class=""$c ") -or $html.Contains(" $c""") -or $html.Contains(" $c "))) {
            $missingInHtml += $c
        }
    }

    if ($missingInCss.Count -gt 0) {
        Write-Host "  Missing in CSS: $($missingInCss -join ', ')" -ForegroundColor Red
    } else {
        Write-Host "  All $($classes.Count) classes exist in CSS." -ForegroundColor Green
    }

    if ($missingInHtml.Count -gt 0) {
        Write-Host "  Missing in HTML: $($missingInHtml -join ', ')" -ForegroundColor Yellow
    } else {
        Write-Host "  All $($classes.Count) classes exist in HTML." -ForegroundColor Green
    }
}
