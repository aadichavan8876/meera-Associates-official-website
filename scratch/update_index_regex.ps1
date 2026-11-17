$html = [System.IO.File]::ReadAllText("index.html", [System.Text.Encoding]::UTF8)

# 1. Hero replacement
$html = $html.Replace("assets/laptop_mockup.png", "assets/ipad_frame_cutout.png")
$html = $html.Replace("laptop-3d-scaler`"", "laptop-3d-scaler ipad-scaler`"")
$html = $html.Replace("laptop-3d-base-img`"", "laptop-3d-base-img ipad-base-img`"")
$html = $html.Replace("Market Terminal Laptop", "Market Terminal iPad")
$html = $html.Replace('width="570" height="387"', 'width="600" height="452"')

# 2. Modal Body replacement with regex
$modalPattern = '(?s)<div class="disclaimer-body" id="disclaimer-content">.*?</div>'
$newModalBody = @'
<div class="disclaimer-body" id="disclaimer-content">
                <p>Meera Associates facilitates transactions strictly through compliant offline depository transfer mechanisms (NSDL / CDSL) between consenting parties. Every transaction is purely a private agreement between two consenting parties in compliance with applicable laws.</p>
                <p>Investments in Unlisted Securities and PRE-IPO shares carry illiquidity and heavy price volatility risk. Investor must Conduct their Own individual research before Investing.</p>
                <div class="disclaimer-note-block">
                    <p>As per SEBI regulations, unlisted shares cannot be traded online on any exchange portal, and this website is not a stock exchange, trading terminal, or broking platform.</p>
                </div>
            </div>
'@

$html = [regex]::Replace($html, $modalPattern, $newModalBody)

# 3. Footer disclaimer replacement with regex
$footerPattern = '(?s)<div class="footer-disclaimer-card">.*?</div>\s*</div>\s*<!-- Footer Bottom Bar -->'
$newFooter = @'
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
        </div>

        <!-- Footer Bottom Bar -->
'@

$html = [regex]::Replace($html, $footerPattern, $newFooter)

[System.IO.File]::WriteAllText("index.html", $html, [System.Text.Encoding]::UTF8)
Write-Output "Successfully updated index.html with disclaimer & ipad"
