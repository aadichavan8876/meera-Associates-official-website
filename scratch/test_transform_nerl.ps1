$care = Get-Content 'scripts/carehealth/carehealth.html' -Raw -Encoding UTF8
$header = [regex]::Match($care, '(?s)<header class="navbar" id="main-header">.*?</header>').Value
$footer = [regex]::Match($care, '(?s)<footer class="footer">.*?</footer>').Value

$nerl = Get-Content 'scripts/nerl/nerl.html' -Raw -Encoding UTF8

# 1. Header
$nerl = [regex]::Replace($nerl, '(?s)<header class="navbar" id="main-header">.*?</header>', $header)

# 2. Hero Badge
$badgeHtml = '<div class="nerl-hero-badge">' + "`n" + '                    <span class="pulse-dot"></span>' + "`n" + '                    🌾 Commodity Repository &amp; Agritech FinTech' + "`n" + '                </div>'
$nerl = [regex]::Replace($nerl, '(?s)<div class="nerl-hero-badge-strip">.*?</div>\s*</div>', $badgeHtml)

# 3. Hero Title & Subtitle
$nerl = [regex]::Replace($nerl, '(?s)<div class="nerl-hero-title-wrap">\s*<h1 class="nerl-company-title">(.*?)</h1>\s*<span class="nerl-scrip-name">.*?</span>\s*</div>', '<h1 class="nerl-hero-title">$1</h1>')
$nerl = $nerl.Replace('class="nerl-company-desc"', 'class="nerl-hero-subtitle"')

# 4. Metric cards
$nerl = $nerl.Replace('class="metric-card"', 'class="nerl-metric-card"')
$nerl = $nerl.Replace('class="metric-lbl"', 'class="nerl-metric-label"')
$nerl = $nerl.Replace('class="metric-val"', 'class="nerl-metric-value"')
$nerl = $nerl.Replace('class="metric-sub"', 'class="nerl-metric-sub"')

# 5. Remove main-container
$nerl = $nerl.Replace('<div class="nerl-main-container">', '')
$nerl = [regex]::Replace($nerl, '(?s)(</div>\s*)</div>\s*(</main>)', '$1$2')

# 6. Breadcrumb standard link
$nerl = $nerl.Replace('Unlisted Directory</a>', 'Unlisted Shares</a>')

# 7. Footer
$nerl = [regex]::Replace($nerl, '(?s)<footer class="footer">.*?</footer>', $footer)

# Save
$utf8NoBom = New-Object System.Text.UTF8Encoding $false
[System.IO.File]::WriteAllText((Resolve-Path 'scripts/nerl/nerl.html'), $nerl, $utf8NoBom)
Write-Host "Transformed nerl.html successfully."
