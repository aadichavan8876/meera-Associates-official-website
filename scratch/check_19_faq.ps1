$scrips19 = @(
    "anugrahavalve", "carehealth", "goashipyard", "greenzoenergy", "hdfcsecurities",
    "hpx", "incredcapital", "indofil", "motilaloswalhf", "msei",
    "nayaraenergy", "ncdex", "nerl", "oyo", "pharmed",
    "pxil", "ritewater", "sterlitegrid5", "sterlitepower"
)

foreach ($s in $scrips19) {
    $file = "scripts/$s/$s.html"
    $content = Get-Content $file -Raw -Encoding UTF8
    $hasContainer = $content.Contains("faq-accordion-container")
    $itemMatches = [regex]::Matches($content, '<div class="faq-card"[^>]*>')
    Write-Host "$s : hasContainer=$hasContainer, faqCardsCount=$($itemMatches.Count)"
}
