$scrips29 = @(
    "anugrahavalve", "carehealth", "cosmicpv", "eiffilwater", "garudaaerospace",
    "goashipyard", "greenzoenergy", "hdfcsecurities", "hindonmercantile", "hpx",
    "incredcapital", "indofil", "insolare", "mavericksimulation", "motilaloswalhf",
    "msei", "nayaraenergy", "ncdex", "nerl", "oyo",
    "pharmed", "proyuga", "pxil", "recyclekaro", "ritewater",
    "soleos", "sterlitegrid5", "sterlitepower", "vivritinext"
)

$faqCardRegex = '(?s)<div class="faq-card"[^>]*>.*?<span class="faq-q-text">(.*?)</span>.*?<div class="faq-card-answer">(.*?)</div>\s*</div>'
$fullCardPattern = '(?s)<div class="([a-zA-Z0-9_-]+)-card[^"]*"(?:[^>]*?)>\s*<div class="\1-card-header">\s*<h2 class="\1-card-title">\s*<span class="\1-card-title-icon">.*?</span>\s*Frequently Asked Questions\s*</h2>\s*<span class="\1-card-tag">.*?</span>\s*</div>\s*<div class="faq-accordion-container"[^>]*>.*?</div>\s*</div>'

$results = @()
foreach ($s in $scrips29) {
    $file = "scripts/$s/$s.html"
    $html = Get-Content $file -Raw -Encoding UTF8

    $m = [regex]::Match($html, $fullCardPattern)
    $items = [regex]::Matches($html, $faqCardRegex)

    $results += [PSCustomObject]@{
        Scrip = $s
        CardMatched = $m.Success
        Prefix = if ($m.Success) { $m.Groups[1].Value } else { "none" }
        ItemsCount = $items.Count
    }
}

$results | Format-Table -AutoSize
