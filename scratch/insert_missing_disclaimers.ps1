$disclaimerBlock = @'
        <!-- Statutory Regulatory Notice & SEBI Compliance Disclaimer -->
        <div class="container footer-disclaimer-wrap">
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
'@

$missingFiles = @(
    "scripts\cosmicpv\cosmicpv.html",
    "scripts\goldisolar\goldisolar.html",
    "scripts\infobayai\infobayai.html",
    "scripts\inoxairproducts\inoxairproducts.html",
    "scripts\inoxneo\inoxneo.html",
    "scripts\jsrdynamics\jsrdynamics.html",
    "scripts\ofbusiness\ofbusiness.html",
    "scripts\plindia\plindia.html",
    "scripts\recyclekaro\recyclekaro.html",
    "scripts\rkbglobal\rkbglobal.html",
    "scripts\skfinance\skfinance.html",
    "scripts\sundropsenergia\sundropsenergia.html"
)

foreach ($rel in $missingFiles) {
    if (Test-Path $rel) {
        $content = [System.IO.File]::ReadAllText($rel, [System.Text.Encoding]::UTF8)
        # Insert before <!-- Footer Bottom -->
        if ($content.Contains("<!-- Footer Bottom -->")) {
            $content = $content.Replace("<!-- Footer Bottom -->", "$disclaimerBlock`r`n`r`n            <!-- Footer Bottom -->")
            [System.IO.File]::WriteAllText($rel, $content, [System.Text.Encoding]::UTF8)
            Write-Output "Inserted disclaimer into $rel"
        }
    }
}
