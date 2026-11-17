$footerSearchRegex = '(?s)<div class="footer-disclaimer-card">\s*<div class="footer-disclaimer-header">.*?</div>\s*<p>.*?</p>\s*</div>'

$newFooterCard = @'
<div class="footer-disclaimer-card">
                <div class="footer-disclaimer-header">
                    <span class="f-disc-badge">Regulatory Notice</span>
                    <strong>Important Investor Information</strong>
                </div>
                <p>
                    Meera Associates facilitates transactions strictly through compliant offline depository transfer mechanisms (NSDL / CDSL) between consenting parties. Every transaction is purely a private agreement between two consenting parties in compliance with applicable laws.
                </p>
                <p style="margin-top: 8px;">
                    Investments in Unlisted Securities and PRE-IPO shares carry illiquidity and heavy price volatility risk. Investor must Conduct their Own individual research before Investing.
                </p>
                <div class="footer-disclaimer-note">
                    As per SEBI regulations, unlisted shares cannot be traded online on any exchange portal, and this website is not a stock exchange, trading terminal, or broking platform.
                </div>
            </div>
'@

# Find all HTML files in project
$allHtml = Get-ChildItem -Path . -Recurse -Filter *.html | Where-Object { 
    $_.FullName -notmatch '\\\.git\\' -and 
    $_.FullName -notmatch '\\scratch\\' -and
    $_.Name -ne 'index.html' # index.html already updated
}

$updatedCount = 0
foreach ($file in $allHtml) {
    $content = [System.IO.File]::ReadAllText($file.FullName, [System.Text.Encoding]::UTF8)
    if ([regex]::IsMatch($content, $footerSearchRegex)) {
        $content = [regex]::Replace($content, $footerSearchRegex, $newFooterCard.Trim())
        [System.IO.File]::WriteAllText($file.FullName, $content, [System.Text.Encoding]::UTF8)
        $updatedCount++
    }
}
Write-Output "Updated footer disclaimer in $updatedCount HTML files."

# Also update unlisted-shares.html in-page disclaimer
$unlistedPath = "unlisted-shares.html"
$unlistedContent = [System.IO.File]::ReadAllText($unlistedPath, [System.Text.Encoding]::UTF8)
$unlistedPattern = '(?s)<div class="disclaimer-text-content">.*?</div>\s*</div>\s*</div>\s*</section>'
$newUnlistedDisclaimer = @'
<div class="disclaimer-text-content">
                        <p>
                            Meera Associates facilitates transactions strictly through compliant offline depository transfer mechanisms (NSDL / CDSL) between consenting parties. Every transaction is purely a private agreement between two consenting parties in compliance with applicable laws.
                        </p>
                        <p>
                            Investments in Unlisted Securities and PRE-IPO shares carry illiquidity and heavy price volatility risk. Investor must Conduct their Own individual research before Investing.
                        </p>
                        <div class="disclaimer-note-block">
                            <p>As per SEBI regulations, unlisted shares cannot be traded online on any exchange portal, and this website is not a stock exchange, trading terminal, or broking platform.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
'@

if ([regex]::IsMatch($unlistedContent, $unlistedPattern)) {
    $unlistedContent = [regex]::Replace($unlistedContent, $unlistedPattern, $newUnlistedDisclaimer)
    [System.IO.File]::WriteAllText($unlistedPath, $unlistedContent, [System.Text.Encoding]::UTF8)
    Write-Output "Updated in-page disclaimer in unlisted-shares.html"
} else {
    Write-Output "Could not match unlisted-shares.html in-page disclaimer pattern"
}
