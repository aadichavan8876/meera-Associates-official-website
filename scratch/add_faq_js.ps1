# Add FAQ accordion listener to dedicated JS scripts
$utf8NoBom = New-Object System.Text.UTF8Encoding($false)

$jsFiles = @(
    "scripts/ppfas/ppfas.js",
    "scripts/frickindia/frickindia.js",
    "scripts/sundayproptech/sundayproptech.js",
    "scripts/carrier/carrier.js",
    "scripts/cial/cial.js",
    "scripts/motilaloswalhf/motilaloswalhf.js",
    "scripts/nayaraenergy/nayaraenergy.js"
)

$faqSnippet = @"

/**
 * Initializes interactive accordion behavior for FAQ questions
 */
function initFaqAccordion() {
    const faqItems = document.querySelectorAll('.faq-item, .faq-card');
    faqItems.forEach(item => {
        const toggleBtn = item.querySelector('.faq-question, .faq-card-question');
        if (toggleBtn) {
            toggleBtn.addEventListener('click', (e) => {
                e.preventDefault();
                const isActive = item.classList.contains('active');
                const parent = item.parentElement;
                if (parent) {
                    const siblings = parent.querySelectorAll('.faq-item, .faq-card');
                    siblings.forEach(s => { if (s !== item) s.classList.remove('active'); });
                }
                item.classList.toggle('active', !isActive);
            });
        }
    });
}
"@

foreach ($jf in $jsFiles) {
    $path = (Resolve-Path $jf).Path
    $content = [System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)

    if (-not $content.Contains("initFaqAccordion")) {
        # Add call in DOMContentLoaded
        $content = $content -replace "initIsinCopyFeature\(\);", "initIsinCopyFeature();`n    initFaqAccordion();"
        # Append function
        $content = $content + "`n" + $faqSnippet
        [System.IO.File]::WriteAllText($path, $content, $utf8NoBom)
        Write-Host "Added FAQ handler to $jf"
    } else {
        Write-Host "Already has FAQ handler: $jf"
    }
}
