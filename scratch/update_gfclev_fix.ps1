$gfclHtmlPath = 'scripts/gfclev/gfclev.html'
$html = [System.IO.File]::ReadAllText($gfclHtmlPath, [System.Text.Encoding]::UTF8)

# Check baseline div count
$origDivOpen = ([regex]::Matches($html, '<div[\s>]')).Count
$origDivClose = ([regex]::Matches($html, '</div>')).Count

# 1. Remove Card 4: Financial Growth & Strategic Highlights
$card4Start = $html.IndexOf('<!-- Card 4: Financial Growth & Strategic Highlights -->')
if ($card4Start -ge 0) {
    $card5Start = $html.IndexOf('<!-- Card 5: Annual Reports & Statutory Disclosures -->')
    if ($card5Start -ge 0) {
        $html = $html.Substring(0, $card4Start) + $html.Substring($card5Start)
        Write-Host "Removed Card 4 Financials from gfclev.html"
    } else {
        Write-Host "Card 5 start not found!"
    }
} else {
    Write-Host "Card 4 start not found!"
}

# Also ensure Card 5 is renamed to Card 4 and Card 6 to Card 5
$html = $html.Replace('<!-- Card 5: Annual Reports & Statutory Disclosures -->', '<!-- Card 4: Annual Reports & Statutory Disclosures -->')
$html = $html.Replace('<!-- Card 6: Frequently Asked Questions -->', '<!-- Card 5: Frequently Asked Questions -->')

$newDivOpen = ([regex]::Matches($html, '<div[\s>]')).Count
$newDivClose = ([regex]::Matches($html, '</div>')).Count
Write-Host "Div balance: $newDivOpen / $newDivClose ($($newDivOpen - $newDivClose))"

[System.IO.File]::WriteAllText($gfclHtmlPath, $html, [System.Text.Encoding]::UTF8)
Write-Host "Updated $gfclHtmlPath successfully!"

# 2. Add Sidebar Factsheet CSS to styles.css and gfclev.css
$sidebarCss = @"

/* ==========================================================================
   STANDARDIZED SIDEBAR FACTSHEET CARD STYLING
   ========================================================================== */
.sidebar-factsheet-card {
    background: #ffffff !important;
    border: 1px solid #e2e8f0 !important;
    border-radius: 16px !important;
    padding: 24px !important;
    box-shadow: 0 4px 20px -4px rgba(15, 23, 42, 0.06) !important;
    display: flex !important;
    flex-direction: column !important;
    gap: 12px !important;
}

.sidebar-scrip-badge {
    display: flex !important;
    align-items: center !important;
    gap: 16px !important;
    padding-bottom: 16px !important;
    border-bottom: 1px solid #f1f5f9 !important;
    margin-bottom: 6px !important;
}

.sidebar-scrip-logo {
    max-height: 52px !important;
    max-width: 130px !important;
    object-fit: contain !important;
    background: #f8fafc;
    padding: 6px 10px;
    border-radius: 8px;
    border: 1px solid #f1f5f9;
}

.sidebar-scrip-name {
    display: block !important;
    font-size: 1.05rem !important;
    font-weight: 800 !important;
    color: #0f172a !important;
    line-height: 1.25 !important;
}

.sidebar-scrip-isin {
    display: block !important;
    font-size: 0.8rem !important;
    font-family: monospace !important;
    color: #0284c7 !important;
    font-weight: 700 !important;
    margin-top: 3px !important;
}

.sidebar-fact-row {
    display: flex !important;
    justify-content: space-between !important;
    align-items: center !important;
    padding: 10px 0 !important;
    border-bottom: 1px solid #f8fafc !important;
    font-size: 0.88rem !important;
}

.sidebar-fact-row:last-of-type {
    border-bottom: none !important;
}

.sidebar-fact-label {
    color: #64748b !important;
    font-weight: 600 !important;
}

.sidebar-fact-val {
    color: #0f172a !important;
    font-weight: 700 !important;
    text-align: right !important;
}

.sidebar-copy-isin-btn {
    width: 100% !important;
    display: flex !important;
    align-items: center !important;
    justify-content: space-between !important;
    padding: 12px 16px !important;
    background: #f0fdf4 !important;
    border: 1.5px dashed #22c55e !important;
    border-radius: 10px !important;
    font-size: 0.88rem !important;
    font-family: monospace !important;
    font-weight: 700 !important;
    color: #15803d !important;
    cursor: pointer !important;
    transition: all 0.2s ease !important;
    margin-top: 8px !important;
    box-sizing: border-box !important;
}

.sidebar-copy-isin-btn:hover {
    background: #dcfce7 !important;
    border-color: #16a34a !important;
    box-shadow: 0 4px 12px rgba(34, 197, 94, 0.15) !important;
}

.sidebar-copy-isin-btn .copy-hint {
    font-size: 0.78rem !important;
    font-family: 'Plus Jakarta Sans', sans-serif !important;
    color: #16a34a !important;
    font-weight: 700 !important;
}
"@

# Append to styles.css
$stylesCss = [System.IO.File]::ReadAllText('styles.css', [System.Text.Encoding]::UTF8)
if (-not $stylesCss.Contains('.sidebar-factsheet-card')) {
    $stylesCss += "`n" + $sidebarCss
    [System.IO.File]::WriteAllText('styles.css', $stylesCss, [System.Text.Encoding]::UTF8)
    Write-Host "Appended sidebar CSS to styles.css"
}

# Append to gfclev.css
$gfclCss = [System.IO.File]::ReadAllText('scripts/gfclev/gfclev.css', [System.Text.Encoding]::UTF8)
if (-not $gfclCss.Contains('.sidebar-factsheet-card')) {
    $gfclCss += "`n" + $sidebarCss
    [System.IO.File]::WriteAllText('scripts/gfclev/gfclev.css', $gfclCss, [System.Text.Encoding]::UTF8)
    Write-Host "Appended sidebar CSS to scripts/gfclev/gfclev.css"
}
