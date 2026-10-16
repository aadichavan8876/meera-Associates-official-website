$scrips29 = @(
    "anugrahavalve", "carehealth", "cosmicpv", "eiffilwater", "garudaaerospace",
    "goashipyard", "greenzoenergy", "hdfcsecurities", "hindonmercantile", "hpx",
    "incredcapital", "indofil", "insolare", "mavericksimulation", "motilaloswalhf",
    "msei", "nayaraenergy", "ncdex", "nerl", "oyo",
    "pharmed", "proyuga", "pxil", "recyclekaro", "ritewater",
    "soleos", "sterlitegrid5", "sterlitepower", "vivritinext"
)

$faqCardRegex = '(?s)<div class="faq-card"[^>]*>.*?<span class="faq-q-text">(.*?)</span>.*?<div class="faq-card-answer">(.*?)</div>\s*</div>'

$results = @()
foreach ($s in $scrips29) {
    $file = "scripts/$s/$s.html"
    $html = Get-Content $file -Raw -Encoding UTF8
    $matches = [regex]::Matches($html, $faqCardRegex)
    $results += [PSCustomObject]@{
        Scrip = $s
        Count = $matches.Count
    }
}

$results | Format-Table -AutoSize
