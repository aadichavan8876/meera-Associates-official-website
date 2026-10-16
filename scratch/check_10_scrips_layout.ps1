# Comprehensive Layout Audit for the 10 recent scrips
$scrips = @(
    @{ name = "nerl"; prefix = "nerl" },
    @{ name = "nayaraenergy"; prefix = "nayara" },
    @{ name = "oyo"; prefix = "oyo" },
    @{ name = "hdfcsecurities"; prefix = "hdfcsec" },
    @{ name = "motilaloswalhf"; prefix = "mohf" },
    @{ name = "ppfas"; prefix = "ppfas" },
    @{ name = "frickindia"; prefix = "frick" },
    @{ name = "sundayproptech"; prefix = "sunday" },
    @{ name = "carrier"; prefix = "carrier" },
    @{ name = "cial"; prefix = "cial" }
)

$results = @()
foreach ($s in $scrips) {
    $dir = $s.name
    $p = $s.prefix
    $htmlFile = "scripts/$dir/$dir.html"
    $cssFile = "scripts/$dir/$dir.css"
    if (-not (Test-Path $cssFile)) {
        $cssFile = "scripts/$dir/$p.css"
    }

    $html = Get-Content $htmlFile -Raw -Encoding UTF8
    $css = Get-Content $cssFile -Raw -Encoding UTF8

    # Check main grid
    $hasMainGridInHtml = $html.Contains("$p-main-grid")
    $hasMainGridInCss = $css.Contains(".$p-main-grid")

    # Check content column
    $hasContentColInHtml = $html.Contains("$p-content-col")
    $hasContentColInCss = $css.Contains(".$p-content-col")

    # Check sidebar
    $hasSidebarColInHtml = $html.Contains("$p-sidebar-col")
    $hasSidebarColInCss = $css.Contains(".$p-sidebar-col")
    $hasSidebarInCss = $css.Contains(".$p-sidebar")

    # Check moats
    $hasMoatsGridInHtml = $html.Contains("moats-grid")
    $hasMoatsGridInCss = $css.Contains(".moats-grid")

    # Check compliance & peers in sidebar
    $hasComplianceInHtml = $html.Contains("sidebar-compliance-card")
    $hasComplianceInCss = $css.Contains(".sidebar-compliance-card")

    $results += [PSCustomObject]@{
        Scrip = $dir
        MainGridMatch = ($hasMainGridInHtml -and $hasMainGridInCss)
        ContentColMatch = ($hasContentColInHtml -and $hasContentColInCss)
        SidebarColMatch = ($hasSidebarColInHtml -and ($hasSidebarColInCss -or $hasSidebarInCss))
        MoatsStyled = ($hasMoatsGridInHtml -eq $hasMoatsGridInCss)
        ComplianceStyled = ($hasComplianceInHtml -eq $hasComplianceInCss)
    }
}

$results | Format-Table -AutoSize
