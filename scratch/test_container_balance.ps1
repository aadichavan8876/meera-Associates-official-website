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

$file = "scripts/anugrahavalve/anugrahavalve.html"
$content = Get-Content $file -Raw -Encoding UTF8

$match = [regex]::Match($content, '<div class="faq-accordion-container"[^>]*>')
if ($match.Success) {
    $start = $match.Index
    $end = Get-MatchingDiv $content $start
    $containerHtml = $content.Substring($start, $end - $start)

    Write-Host "After container text:"
    $after = $content.Substring($end, 60)
    Write-Host ($after.Replace("`r`n", "\n"))

    $faqCardRegex = '(?s)<div class="faq-card"[^>]*>.*?<span class="faq-q-text">(.*?)</span>.*?<div class="faq-card-answer">(.*?)</div>\s*</div>'
    $items = [regex]::Matches($containerHtml, $faqCardRegex)

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

    # Check tag balance
    $openDivsOrig = ([regex]::Matches($content, '<div\b')).Count
    $closeDivsOrig = ([regex]::Matches($content, '</div>')).Count

    $openDivsNew = ([regex]::Matches($newContent, '<div\b')).Count
    $closeDivsNew = ([regex]::Matches($newContent, '</div>')).Count

    Write-Host "Orig divs: $openDivsOrig / $closeDivsOrig (diff: $($openDivsOrig - $closeDivsOrig))"
    Write-Host "New divs:  $openDivsNew / $closeDivsNew (diff: $($openDivsNew - $closeDivsNew))"
}
