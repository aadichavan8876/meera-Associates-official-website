$html = [System.IO.File]::ReadAllText("index.html", [System.Text.Encoding]::UTF8)

# 1. Replace Hero Laptop image and comments with iPad
$oldHeroImg = @'
                <!-- Realistic 3D Laptop Display Running Meera Unlisted Market Terminal with Moving Blocks -->
                <div class="hero-media">
                    <div class="laptop-3d-scaler">
'@

$newHeroImg = @'
                <!-- Realistic iPad Display Running Meera Unlisted Market Terminal with Moving Blocks -->
                <div class="hero-media">
                    <div class="laptop-3d-scaler ipad-scaler">
'@

$html = $html.Replace($oldHeroImg, $newHeroImg)

$oldLaptopImgTag = '<img src="assets/laptop_mockup.png" class="laptop-3d-base-img" alt="Meera Associates Unlisted Shares Market Terminal Laptop" width="570" height="387">'
$newLaptopImgTag = '<img src="assets/ipad_frame_cutout.png" class="laptop-3d-base-img ipad-base-img" alt="Meera Associates Unlisted Shares Market Terminal iPad" width="600" height="452">'

$html = $html.Replace($oldLaptopImgTag, $newLaptopImgTag)

# 2. Update Footer Disclaimer
$oldFooterDisc = @'
                <p>
                    Meera Associates operates as an independent private equity facilitation and financial consulting firm. Transactions in unlisted and pre-IPO securities are facilitated strictly through compliant off-market depository transfer mechanisms (NSDL / CDSL) between consenting parties. Unlisted investments are subject to market risks, illiquidity, and transfer procedures. This website is educational and informational in nature and does not constitute a public offer, recommendation, stock exchange trading portal, or solicitation to buy or sell securities. Investors are advised to consult SEBI-registered professionals before making financial decisions.
                </p>
'@

$newFooterDisc = @'
                <p>
                    Meera Associates facilitates transactions strictly through compliant offline depository transfer mechanisms (NSDL / CDSL) between consenting parties. Every transaction is purely a private agreement between two consenting parties in compliance with applicable laws.
                </p>
                <p style="margin-top: 8px;">
                    Investments in Unlisted Securities and PRE-IPO shares carry illiquidity and heavy price volatility risk. Investor must Conduct their Own individual research before Investing.
                </p>
                <div class="footer-disclaimer-note">
                    As per SEBI regulations, unlisted shares cannot be traded online on any exchange portal, and this website is not a stock exchange, trading terminal, or broking platform.
                </div>
'@

$html = $html.Replace($oldFooterDisc.Trim(), $newFooterDisc.Trim())

# 3. Update Disclaimer Modal Body
$oldModalBody = @'
            <div class="disclaimer-body" id="disclaimer-content">
                <p>The content on this website is provided solely for general informational and educational purposes. As per SEBI regulations, unlisted shares cannot be traded online on any exchange portal, and this website is not a stock exchange, trading terminal, or broking platform.</p>
                <p>Investments in unlisted securities and pre-IPO equities carry inherent risks, including illiquidity, price volatility, and potential loss of capital. Users must conduct their own independent research and consult SEBI-registered professionals before making financial decisions. <strong>Meera Associates</strong> does not guarantee any returns, listing, liquidity, or future value of unlisted securities.</p>
                <p><strong>Meera Associates</strong> facilitates transactions strictly through compliant offline depository transfer mechanisms (NSDL / CDSL) between consenting parties. Every transaction is purely a private agreement between two consenting parties in compliance with applicable laws.</p>
            </div>
'@

$newModalBody = @'
            <div class="disclaimer-body" id="disclaimer-content">
                <p>Meera Associates facilitates transactions strictly through compliant offline depository transfer mechanisms (NSDL / CDSL) between consenting parties. Every transaction is purely a private agreement between two consenting parties in compliance with applicable laws.</p>
                <p>Investments in Unlisted Securities and PRE-IPO shares carry illiquidity and heavy price volatility risk. Investor must Conduct their Own individual research before Investing.</p>
                <div class="disclaimer-note-block">
                    <p>As per SEBI regulations, unlisted shares cannot be traded online on any exchange portal, and this website is not a stock exchange, trading terminal, or broking platform.</p>
                </div>
            </div>
'@

$html = $html.Replace($oldModalBody.Trim(), $newModalBody.Trim())

[System.IO.File]::WriteAllText("index.html", $html, [System.Text.Encoding]::UTF8)
Write-Output "Successfully updated index.html"
