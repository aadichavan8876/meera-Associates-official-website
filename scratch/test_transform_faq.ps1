$html = Get-Content "scripts/ncdex/ncdex.html" -Raw -Encoding UTF8

# Extract each faq-card
$faqCardRegex = '(?s)<div class="faq-card"[^>]*>.*?<span class="faq-q-text">(.*?)</span>.*?<div class="faq-card-answer">(.*?)</div>\s*</div>'
$matches = [regex]::Matches($html, $faqCardRegex)

Write-Host "Found $($matches.Count) FAQ items in ncdex.html"
foreach ($m in $matches) {
    $q = $m.Groups[1].Value.Trim()
    Write-Host "Q: $q"
}
