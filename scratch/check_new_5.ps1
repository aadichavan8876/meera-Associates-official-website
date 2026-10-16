$scrips = @(
    @{ name = "orbisfinancial"; prefix = "orbis" },
    @{ name = "herofincorp"; prefix = "herofincorp" },
    @{ name = "csk"; prefix = "csk" },
    @{ name = "goodluckdefence"; prefix = "goodluck" },
    @{ name = "kineco"; prefix = "kineco" }
)

$results = @()
foreach ($s in $scrips) {
    $dir = $s.name
    $p = $s.prefix
    $htmlFile = "scripts/$dir/$dir.html"
    $cssFile = "scripts/$dir/$dir.css"
    if (-not (Test-Path $cssFile)) { $cssFile = "scripts/$dir/$p.css" }
    $jsFile = "scripts/$dir/$dir.js"
    if (-not (Test-Path $jsFile)) { $jsFile = "scripts/$dir/$p.js" }

    $html = Get-Content $htmlFile -Raw -Encoding UTF8
    $css = Get-Content $cssFile -Raw -Encoding UTF8
    $js = Get-Content $jsFile -Raw -Encoding UTF8

    $results += [PSCustomObject]@{
        Scrip = $dir
        HtmlExists = (Test-Path $htmlFile)
        CssExists = (Test-Path $cssFile)
        JsExists = (Test-Path $jsFile)
        HeroStrip = $html.Contains("$p-metrics-strip")
        EstBlock1 = [bool]($html -match 'Established')
        FvBlock2 = [bool]($html -match 'Face Value')
        IsinBlock3 = [bool]($html -match 'ISIN Depository Code')
        SpecRows = ([regex]::Matches($html, '<tr\b')).Count
        CopyBtn = $html.Contains('id="copy-isin-btn"')
        FaqPresent = [bool]($html -match 'faq-item|faq-card')
        FaqJs = $js.Contains('initFaqAccordion')
    }
}
$results
