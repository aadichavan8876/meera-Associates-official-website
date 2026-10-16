$html = Get-Content "scripts/ncdex/ncdex.html" -Raw -Encoding UTF8

$pattern = '(?s)<div class="([a-zA-Z0-9_-]+)-card[^"]*"(?:[^>]*?)>\s*<div class="\1-card-header">\s*<h2 class="\1-card-title">\s*<span class="\1-card-title-icon">.*?</span>\s*Frequently Asked Questions\s*</h2>\s*<span class="\1-card-tag">.*?</span>\s*</div>\s*<div class="faq-accordion-container"[^>]*>.*?</div>\s*</div>'

$match = [regex]::Match($html, $pattern)
Write-Host "Match success: $($match.Success)"
if ($match.Success) {
    Write-Host "Matched length: $($match.Value.Length)"
    Write-Host "Prefix captured: $($match.Groups[1].Value)"
}
