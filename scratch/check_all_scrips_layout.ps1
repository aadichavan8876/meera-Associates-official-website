# Check layout classes across ALL scrips in scripts/
$scrips = Get-ChildItem scripts -Directory

$report = @()
foreach ($d in $scrips) {
    $name = $d.Name
    $htmlFiles = Get-ChildItem "scripts/$name" -Filter "*.html"
    if ($htmlFiles.Count -eq 0) { continue }
    $htmlFile = $htmlFiles[0].FullName
    $cssFiles = Get-ChildItem "scripts/$name" -Filter "*.css"
    if ($cssFiles.Count -eq 0) { continue }
    $cssFile = $cssFiles[0].FullName

    $html = Get-Content $htmlFile -Raw -Encoding UTF8
    $css = Get-Content $cssFile -Raw -Encoding UTF8

    # Check which grid class is used in HTML
    $gridMatch = [regex]::Match($html, 'class="([a-zA-Z0-9_-]+(?:grid|container|wrap|viewport))"')
    $mainGridInHtml = [regex]::Match($html, 'class="([^"]*(?:main-grid|content-grid|grid)[^"]*)"').Value
    
    # Check if CSS has the corresponding grid
    $hasGridCss = $false
    if ($mainGridInHtml -match 'class="([^"]+)"') {
        $classes = $matches[1] -split '\s+'
        foreach ($c in $classes) {
            if ($css.Contains(".$c")) {
                $hasGridCss = $true
                break
            }
        }
    }

    $report += [PSCustomObject]@{
        Scrip = $name
        HtmlGrid = $mainGridInHtml
        GridStyledInCss = $hasGridCss
    }
}

$report | Format-Table -AutoSize
