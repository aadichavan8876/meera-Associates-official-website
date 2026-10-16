$utf8NoBom = New-Object System.Text.UTF8Encoding($false)

function Get-MatchingDiv($text, $startIndex) {
    $depth = 0
    $i = $startIndex
    $len = $text.Length
    while ($i -lt $len) {
        if ($text.Substring($i).StartsWith("<div", [System.StringComparison]::OrdinalIgnoreCase)) {
            $depth++
            $i += 4
        } elseif ($text.Substring($i).StartsWith("</div>", [System.StringComparison]::OrdinalIgnoreCase)) {
            $depth--
            if ($depth -eq 0) {
                return ($i + 6)
            }
            $i += 6
        } else {
            $i++
        }
    }
    return -1
}

$scrips19 = @(
    "anugrahavalve", "carehealth", "goashipyard", "greenzoenergy", "hdfcsecurities",
    "hpx", "incredcapital", "indofil", "motilaloswalhf", "msei",
    "nayaraenergy", "ncdex", "nerl", "oyo", "pharmed",
    "pxil", "ritewater", "sterlitegrid5", "sterlitepower"
)

$updatedCount = 0

foreach ($s in $scrips19) {
    $path = "scripts/$s/$s.html"
    $content = [System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)

    $match = [regex]::Match($content, '<div class="faq-accordion-container"[^>]*>')
    if (-not $match.Success) {
        Write-Host "No faq-accordion-container in $s" -ForegroundColor Red
        continue
    }

    $start = $match.Index
    $end = Get-MatchingDiv $content $start
    if ($end -le 0) {
        Write-Host "Could not find matching div for $s" -ForegroundColor Red
        continue
    }

    $containerHtml = $content.Substring($start, $end - $start)
    $faqCardRegex = '(?s)<div class="faq-card"[^>]*>.*?<span class="faq-q-text">(.*?)</span>.*?<div class="faq-card-answer">(.*?)</div>\s*</div>'
    $items = [regex]::Matches($containerHtml, $faqCardRegex)

    if ($items.Count -eq 0) {
        Write-Host "No items found in $s" -ForegroundColor Red
        continue
    }

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

    $newAccordion = @"
<div class="faq-accordion">$itemsHtml
                    </div>
"@

    $newContent = $content.Substring(0, $start) + $newAccordion + $content.Substring($end)

    # In the FAQ card header (right before $start), update the badge to 'Investor Intelligence'
    # Look back 500 chars from $start for the card header
    $headerLookbackStart = [Math]::Max(0, $start - 500)
    $headerChunk = $newContent.Substring($headerLookbackStart, $start - $headerLookbackStart)
    $tagRegex = '(?s)(<span class="([a-zA-Z0-9_-]+)-card-tag"[^>]*>)(.*?)(</span>)'
    if ($headerChunk -match $tagRegex) {
        $newHeaderChunk = [regex]::Replace($headerChunk, $tagRegex, '$1Investor Intelligence$4')
        $newContent = $newContent.Substring(0, $headerLookbackStart) + $newHeaderChunk + $newContent.Substring($start)
    }

    [System.IO.File]::WriteAllText($path, $newContent, $utf8NoBom)
    Write-Host "Converted $s ($($items.Count) items)" -ForegroundColor Green
    $updatedCount++
}

Write-Host "Successfully converted $updatedCount / $($scrips19.Count) scrips" -ForegroundColor Cyan
