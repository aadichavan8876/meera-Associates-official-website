$utf8NoBom = New-Object System.Text.UTF8Encoding($false)

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

$updated = 0

foreach ($s in $scrips29) {
    $file = "scripts/$s/$s.html"
    $path = (Resolve-Path $file).Path
    $html = [System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)

    $cardMatch = [regex]::Match($html, $fullCardPattern)
    if ($cardMatch.Success) {
        $prefix = $cardMatch.Groups[1].Value
        $oldCardText = $cardMatch.Value

        $items = [regex]::Matches($oldCardText, $faqCardRegex)
        if ($items.Count -gt 0) {
            $itemsHtml = ""
            foreach ($it in $items) {
                $q = $it.Groups[1].Value.Trim()
                $ans = $it.Groups[2].Value.Trim()

                $itemsHtml += @"

                            <div class="faq-item">
                                <div class="faq-question">
                                    <span>$q</span>
                                    <span class="faq-arrow">▾</span>
                                </div>
                                <div class="faq-answer">
                                    $ans
                                </div>
                            </div>
"@
            }

            $newCard = @"
                    <!-- Frequently Asked Questions -->
                    <div class="$prefix-card">
                        <div class="$prefix-card-header">
                            <h2 class="$prefix-card-title">
                                <span class="$prefix-card-title-icon">❓</span>
                                Frequently Asked Questions
                            </h2>
                            <span class="$prefix-card-tag">Investor Intelligence</span>
                        </div>

                        <div class="faq-accordion">$itemsHtml
                        </div>
                    </div>
"@

            $newHtml = $html.Replace($oldCardText, $newCard)
            [System.IO.File]::WriteAllText($path, $newHtml, $utf8NoBom)
            $updated++
            Write-Host "Successfully converted FAQ in $s ($($items.Count) items, prefix: $prefix)" -ForegroundColor Green
        } else {
            Write-Host "No FAQ items extracted in $s" -ForegroundColor Red
        }
    } else {
        Write-Host "Card pattern did not match in $s" -ForegroundColor Red
    }
}

Write-Host "Total scrips updated: $updated / $($scrips29.Count)"
