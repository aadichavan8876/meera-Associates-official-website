$filePath = 'unlisted-shares.html'
$c = [System.IO.File]::ReadAllText($filePath, [System.Text.Encoding]::UTF8)

# Check baseline div count
$origDivOpen = ([regex]::Matches($c, '<div[\s>]')).Count
$origDivClose = ([regex]::Matches($c, '</div>')).Count

$startIdx = $c.IndexOf('<div class="faq-accordion-container"')
if ($startIdx -lt 0) {
    Write-Host "Container not found!"
    exit 1
}

function Get-MatchingDivEndIndex($html, $startIndex) {
    $i = $startIndex
    $depth = 0
    $len = $html.Length
    while ($i -lt $len) {
        if ($html.Substring($i).StartsWith("<div", [System.StringComparison]::OrdinalIgnoreCase)) {
            $depth++
            $i += 4
        } elseif ($html.Substring($i).StartsWith("</div>", [System.StringComparison]::OrdinalIgnoreCase)) {
            $depth--
            if ($depth -eq 0) {
                return $i + 6
            }
            $i += 6
        } else {
            $i++
        }
    }
    return -1
}

$endIdx = Get-MatchingDivEndIndex $c $startIdx
$containerHtml = $c.Substring($startIdx, $endIdx - $startIdx)

# Extract style attribute if any
$styleMatch = [regex]::Match($containerHtml, '^<div class="faq-accordion-container"(\s+style="[^"]*")?')
$containerStyle = ""
if ($styleMatch.Success -and $styleMatch.Groups[1].Value) {
    $containerStyle = $styleMatch.Groups[1].Value
}

# Extract cards
$cards = @()
$cardStart = 0
while (($cardStart = $containerHtml.IndexOf('<div class="faq-card', $cardStart)) -ge 0) {
    $cardEnd = Get-MatchingDivEndIndex $containerHtml $cardStart
    $cardHtml = $containerHtml.Substring($cardStart, $cardEnd - $cardStart)
    $cards += $cardHtml
    $cardStart = $cardEnd
}

Write-Host "Extracted $($cards.Count) cards."

$newItems = @()
for ($k = 0; $k -lt $cards.Count; $k++) {
    $card = $cards[$k]
    
    $catAttr = ""
    if ($card -match 'data-category="([^"]+)"') {
        $catAttr = " data-category=`"$($matches[1])`""
    }
    
    $qText = ""
    if ($card -match '(?s)<span class="faq-q-text">(.*?)</span>') {
        $qText = $matches[1].Trim()
    }
    
    $ansStart = $card.IndexOf('<div class="faq-card-answer"')
    $ansHtml = ""
    if ($ansStart -ge 0) {
        $ansEnd = Get-MatchingDivEndIndex $card $ansStart
        $rawAns = $card.Substring($ansStart, $ansEnd - $ansStart)
        $innerAns = [regex]::Replace($rawAns, '^<div class="faq-card-answer"[^>]*>', '')
        $innerAns = [regex]::Replace($innerAns, '</div>$', '').Trim()
        $ansHtml = $innerAns
    }
    
    $itemHtml = @"
                    <!-- Q$($k+1) -->
                    <div class="faq-item"$catAttr>
                        <div class="faq-question">
                            <span>$qText</span>
                            <span class="faq-arrow">&#9662;</span>
                        </div>
                        <div class="faq-answer">
                            $ansHtml
                        </div>
                    </div>
"@
    $newItems += $itemHtml
}

$newContainer = @"
<div class="faq-accordion"$containerStyle>

$($newItems -join "`n`n")

                </div>
"@

$newContent = $c.Substring(0, $startIdx) + $newContainer + $c.Substring($endIdx)

$newDivOpen = ([regex]::Matches($newContent, '<div[\s>]')).Count
$newDivClose = ([regex]::Matches($newContent, '</div>')).Count

Write-Host "Original Divs: $origDivOpen / $origDivClose ($($origDivOpen - $origDivClose))"
Write-Host "New Divs:      $newDivOpen / $newDivClose ($($newDivOpen - $newDivClose))"

if (($newDivOpen - $newDivClose) -eq 0 -and $newDivOpen -eq ($origDivOpen - ($cards.Count))) {
    # Notice: In the old card, there were <div class="faq-card">, <div class="faq-question-content">, <div class="faq-card-answer"> = 3 divs per card.
    # In the new item, there are <div class="faq-item">, <div class="faq-question">, <div class="faq-answer"> = 3 divs per card.
    # Wait, did old card have button? <button class="faq-card-question"> <div class="faq-question-content"> ... </div> </button> <div class="faq-card-answer">.
    # Yes, exactly 3 opening divs and 3 closing divs per card.
    # New: <div class="faq-item">, <div class="faq-question">, <div class="faq-answer"> = 3 divs!
    # So div count should be EXACTLY equal ($origDivOpen == $newDivOpen)!
}

Write-Host "Div difference: $($newDivOpen - $origDivOpen)"

[System.IO.File]::WriteAllText($filePath, $newContent, [System.Text.Encoding]::UTF8)
Write-Host "Successfully converted $filePath!"
