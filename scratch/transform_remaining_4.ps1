$care = Get-Content 'scripts/carehealth/carehealth.html' -Raw -Encoding UTF8
$header = [regex]::Match($care, '(?s)<header class="navbar" id="main-header">.*?</header>').Value
$footer = [regex]::Match($care, '(?s)<footer class="footer">.*?</footer>').Value

$configs = @(
    @{
        Name = 'nayaraenergy'
        Prefix = 'nayara'
        BadgeHtml = '<div class="nayara-hero-badge">' + "`n" + '                    <span class="pulse-dot"></span>' + "`n" + '                    &#9981; Downstream Refining &amp; Fuel Retail' + "`n" + '                </div>'
        Card1Find = '<span class="metric-lbl">DEPOSITORY ISIN</span>'
        Card1Repl = '<span class="nayara-metric-label">&#128203; DEPOSITORY ISIN</span>'
        Card2Find = '<span class="metric-lbl">REFINERY CAPACITY</span>'
        Card2Repl = '<span class="nayara-metric-label">&#9981; REFINERY CAPACITY</span>'
        Card3Find = '<span class="metric-lbl">NATIONAL SHARE</span>'
        Card3Repl = '<span class="nayara-metric-label">&#127978; NATIONAL SHARE</span>'
        Card4Find = '<span class="metric-lbl">DELIVERY MECHANISM</span>'
        Card4Repl = '<span class="nayara-metric-label">&#128230; DELIVERY MECHANISM</span>'
        IsinValFind = '<div class="metric-val">INE011A01019</div>'
        IsinValRepl = '<div class="nayara-metric-value" style="font-size: 1.15rem; font-family: monospace; color: #38bdf8;">INE011A01019</div>'
    },
    @{
        Name = 'oyo'
        Prefix = 'oyo'
        BadgeHtml = '<div class="oyo-hero-badge">' + "`n" + '                    <span class="pulse-dot"></span>' + "`n" + '                    &#127976; Global Travel Tech &amp; Hospitality Platform' + "`n" + '                </div>'
        Card1Find = '<span class="metric-lbl">DEPOSITORY ISIN</span>'
        Card1Repl = '<span class="oyo-metric-label">&#128203; DEPOSITORY ISIN</span>'
        Card2Find = '<span class="metric-lbl">GLOBAL SCALE</span>'
        Card2Repl = '<span class="oyo-metric-label">&#127757; GLOBAL SCALE</span>'
        Card3Find = '<span class="metric-lbl">STOREFRONTS</span>'
        Card3Repl = '<span class="oyo-metric-label">&#127976; STOREFRONTS</span>'
        Card4Find = '<span class="metric-lbl">PROMOTER LEADERSHIP</span>'
        Card4Repl = '<span class="oyo-metric-label">&#128081; PROMOTER LEADERSHIP</span>'
        IsinValFind = '<div class="metric-val">INE561T01021</div>'
        IsinValRepl = '<div class="oyo-metric-value" style="font-size: 1.15rem; font-family: monospace; color: #38bdf8;">INE561T01021</div>'
    },
    @{
        Name = 'hdfcsecurities'
        Prefix = 'hdfcsec'
        BadgeHtml = '<div class="hdfcsec-hero-badge">' + "`n" + '                    <span class="pulse-dot"></span>' + "`n" + '                    &#128200; Stock Broking &amp; Wealth Distribution' + "`n" + '                </div>'
        Card1Find = '<span class="metric-lbl">DEPOSITORY ISIN</span>'
        Card1Repl = '<span class="hdfcsec-metric-label">&#128203; DEPOSITORY ISIN</span>'
        Card2Find = '<span class="metric-lbl">PARENTAGE</span>'
        Card2Repl = '<span class="hdfcsec-metric-label">&#127963;&#65039; PARENTAGE</span>'
        Card3Find = '<span class="metric-lbl">CLIENTELE BASE</span>'
        Card3Repl = '<span class="hdfcsec-metric-label">&#128101; CLIENTELE BASE</span>'
        Card4Find = '<span class="metric-lbl">BRANCH NETWORK</span>'
        Card4Repl = '<span class="hdfcsec-metric-label">&#127970; BRANCH NETWORK</span>'
        IsinValFind = '<div class="metric-val">INE700G01014</div>'
        IsinValRepl = '<div class="hdfcsec-metric-value" style="font-size: 1.15rem; font-family: monospace; color: #38bdf8;">INE700G01014</div>'
    },
    @{
        Name = 'motilaloswalhf'
        Prefix = 'mohf'
        BadgeHtml = '<div class="mohf-hero-badge">' + "`n" + '                    <span class="pulse-dot"></span>' + "`n" + '                    &#127968; Housing Finance &amp; Mortgage Lending' + "`n" + '                </div>'
        Card1Find = '<span class="metric-lbl">DEPOSITORY ISIN</span>'
        Card1Repl = '<span class="mohf-metric-label">&#128203; DEPOSITORY ISIN</span>'
        Card2Find = '<span class="metric-lbl">CORE PARENT</span>'
        Card2Repl = '<span class="mohf-metric-label">&#127963;&#65039; CORE PARENT</span>'
        Card3Find = '<span class="metric-lbl">AUM BOOK</span>'
        Card3Repl = '<span class="mohf-metric-label">&#128176; AUM BOOK</span>'
        Card4Find = '<span class="metric-lbl">GEOGRAPHIC REACH</span>'
        Card4Repl = '<span class="mohf-metric-label">&#128205; GEOGRAPHIC REACH</span>'
        IsinValFind = '<div class="metric-val">INE658R01011</div>'
        IsinValRepl = '<div class="mohf-metric-value" style="font-size: 1.15rem; font-family: monospace; color: #38bdf8;">INE658R01011</div>'
    }
)

$utf8NoBom = New-Object System.Text.UTF8Encoding $false

foreach ($cfg in $configs) {
    $name = $cfg.Name
    $p = $cfg.Prefix
    $filePath = "scripts\$name\$name.html"
    $text = Get-Content $filePath -Raw -Encoding UTF8
    
    # 1. Header
    $text = [regex]::Replace($text, '(?s)<header class="navbar" id="main-header">.*?</header>', $header)
    
    # 2. Hero Badge
    $text = [regex]::Replace($text, "(?s)<div class=""$p-hero-badge-strip"">.*?</div>\s*</div>", $cfg.BadgeHtml)
    
    # 3. Hero Title & Subtitle
    $text = [regex]::Replace($text, "(?s)<div class=""$p-hero-title-wrap"">\s*<h1 class=""$p-company-title"">(.*?)</h1>\s*<span class=""$p-scrip-name"">.*?</span>\s*</div>", "<h1 class=""$p-hero-title"">`$1</h1>")
    $text = $text.Replace("class=""$p-company-desc""", "class=""$p-hero-subtitle""")
    
    # 4. Metric cards
    $text = $text.Replace('class="metric-card"', "class=""$p-metric-card""")
    $text = $text.Replace($cfg.Card1Find, $cfg.Card1Repl)
    $text = $text.Replace($cfg.Card2Find, $cfg.Card2Repl)
    $text = $text.Replace($cfg.Card3Find, $cfg.Card3Repl)
    $text = $text.Replace($cfg.Card4Find, $cfg.Card4Repl)
    $text = $text.Replace($cfg.IsinValFind, $cfg.IsinValRepl)
    $text = $text.Replace('class="metric-val"', "class=""$p-metric-value""")
    $text = $text.Replace('class="metric-sub"', "class=""$p-metric-sub""")
    
    # 5. Remove main-container
    $text = $text.Replace("<div class=""$p-main-container"">", '')
    $text = [regex]::Replace($text, '(?s)(</div>\s*)</div>\s*(</main>)', '$1$2')
    
    # 6. Breadcrumb standard link
    $text = $text.Replace('Unlisted Directory</a>', 'Unlisted Shares</a>')
    
    # 7. Footer
    $text = [regex]::Replace($text, '(?s)<footer class="footer">.*?</footer>', $footer)
    
    # Save back
    [System.IO.File]::WriteAllText((Resolve-Path $filePath), $text, $utf8NoBom)
    
    # Check balance
    $divOpen = ([regex]::Matches($text, '<div[\s>]')).Count
    $divClose = ([regex]::Matches($text, '</div>')).Count
    Write-Host "Processed $name : divOpen=$divOpen divClose=$divClose Diff=$($divOpen - $divClose)"
}
