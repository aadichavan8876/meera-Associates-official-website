$c = [System.IO.File]::ReadAllText('unlisted-shares.html', [System.Text.Encoding]::UTF8)

# Locate faq-accordion-container
$startIdx = $c.IndexOf('<div class="faq-accordion-container"')
if ($startIdx -lt 0) {
    Write-Host "faq-accordion-container not found!"
    exit 1
}

# Function to get matching closing div
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

# Parse each faq-card
# Each card starts with <div class="faq-card
$cardMatches = [regex]::Matches($containerHtml, '(?s)<div class="faq-card[^"]*"([^>]*)>(.*?)</div>\s*(?=<div class="faq-card|$)')
Write-Host "Found $($cardMatches.Count) cards via regex."

# Better parser using Get-MatchingDivEndIndex for each card
$cards = @()
$cardStart = 0
while (($cardStart = $containerHtml.IndexOf('<div class="faq-card', $cardStart)) -ge 0) {
    $cardEnd = Get-MatchingDivEndIndex $containerHtml $cardStart
    $cardHtml = $containerHtml.Substring($cardStart, $cardEnd - $cardStart)
    $cards += $cardHtml
    $cardStart = $cardEnd
}

Write-Host "Found $($cards.Count) cards via matching div."

for ($k = 0; $k -lt $cards.Count; $k++) {
    $card = $cards[$k]
    # Extract category
    $cat = ""
    if ($card -match 'data-category="([^"]+)"') { $cat = $matches[1] }
    # Extract question text from <span class="faq-q-text">(.*?)</span>
    $qText = ""
    if ($card -match '(?s)<span class="faq-q-text">(.*?)</span>') {
        $qText = $matches[1].Trim()
    }
    # Extract answer from <div class="faq-card-answer"[^>]*>(.*?)</div> (note: answer might contain internal divs or tags)
    $ansStart = $card.IndexOf('<div class="faq-card-answer"')
    $ansHtml = ""
    if ($ansStart -ge 0) {
        $ansEnd = Get-MatchingDivEndIndex $card $ansStart
        # Strip outer <div class="faq-card-answer"...> and </div>
        $rawAns = $card.Substring($ansStart, $ansEnd - $ansStart)
        $innerAns = [regex]::Replace($rawAns, '^<div class="faq-card-answer"[^>]*>', '')
        $innerAns = [regex]::Replace($innerAns, '</div>$', '').Trim()
        $ansHtml = $innerAns
    }
    Write-Host "Q$($k+1) [$cat]: $qText (Ans len: $($ansHtml.Length))"
}
