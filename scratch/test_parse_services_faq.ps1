$c = [System.IO.File]::ReadAllText('services.html', [System.Text.Encoding]::UTF8)

$startIdx = $c.IndexOf('<div class="faq-accordion-container">')
if ($startIdx -lt 0) {
    Write-Host "faq-accordion-container not found!"
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
Write-Host "Container from $startIdx to $endIdx (Length: $($endIdx - $startIdx))"

$containerHtml = $c.Substring($startIdx, $endIdx - $startIdx)

$cards = @()
$cardStart = 0
while (($cardStart = $containerHtml.IndexOf('<div class="faq-card', $cardStart)) -ge 0) {
    $cardEnd = Get-MatchingDivEndIndex $containerHtml $cardStart
    $cardHtml = $containerHtml.Substring($cardStart, $cardEnd - $cardStart)
    $cards += $cardHtml
    $cardStart = $cardEnd
}

Write-Host "Found $($cards.Count) cards in services.html via matching div."

for ($k = 0; $k -lt $cards.Count; $k++) {
    $card = $cards[$k]
    $cat = ""
    if ($card -match 'data-category="([^"]+)"') { $cat = $matches[1] }
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
    Write-Host "Q$($k+1) [$cat]: $qText (Ans len: $($ansHtml.Length))"
}
