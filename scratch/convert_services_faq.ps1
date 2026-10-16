$filePath = 'services.html'
$c = [System.IO.File]::ReadAllText($filePath, [System.Text.Encoding]::UTF8)

# Check baseline div count
$origDivOpen = ([regex]::Matches($c, '<div[\s>]')).Count
$origDivClose = ([regex]::Matches($c, '</div>')).Count

$startIdx = $c.IndexOf('<div class="faq-accordion-container">')
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

# Extract cards and comments
# Let's map categories to their comments
$catComments = @{
    1 = "<!-- ================= CATEGORY 1: PRE-IPO & UNLISTED SHARES ================= -->"
    9 = "<!-- ================= CATEGORY 2: SELLING & SAME-DAY PAYOUT ================= -->"
    15 = "<!-- ================= CATEGORY 3: DEMAT & DEPOSITORY (NSDL / CDSL) ================= -->"
    22 = "<!-- ================= CATEGORY 4: PHYSICAL SHARE DEMATERIALIZATION ================= -->"
    27 = "<!-- ================= CATEGORY 5: IEPF RECOVERY ASSISTANCE ================= -->"
    31 = "<!-- ================= CATEGORY 6: LEGAL, SAFETY & TAXATION ================= -->"
}

$cards = @()
$cardStart = 0
while (($cardStart = $containerHtml.IndexOf('<div class="faq-card', $cardStart)) -ge 0) {
    $cardEnd = Get-MatchingDivEndIndex $containerHtml $cardStart
    $cardHtml = $containerHtml.Substring($cardStart, $cardEnd - $cardStart)
    $cards += $cardHtml
    $cardStart = $cardEnd
}

Write-Host "Extracted $($cards.Count) cards from services.html."

$newItems = @()
for ($k = 0; $k -lt $cards.Count; $k++) {
    $qNum = $k + 1
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
    
    $prefixComment = ""
    if ($catComments.ContainsKey($qNum)) {
        $prefixComment = "`n                    " + $catComments[$qNum] + "`n`n"
    }
    
    $itemHtml = @"
$prefixComment                    <!-- Q$qNum -->
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
<div class="faq-accordion">

$($newItems -join "`n`n")

                </div>
"@

$newContent = $c.Substring(0, $startIdx) + $newContainer + $c.Substring($endIdx)

$newDivOpen = ([regex]::Matches($newContent, '<div[\s>]')).Count
$newDivClose = ([regex]::Matches($newContent, '</div>')).Count

Write-Host "Original Divs: $origDivOpen / $origDivClose ($($origDivOpen - $origDivClose))"
Write-Host "New Divs:      $newDivOpen / $newDivClose ($($newDivOpen - $newDivClose))"
Write-Host "Div difference: $($newDivOpen - $origDivOpen)"

[System.IO.File]::WriteAllText($filePath, $newContent, [System.Text.Encoding]::UTF8)
Write-Host "Successfully converted $filePath!"
