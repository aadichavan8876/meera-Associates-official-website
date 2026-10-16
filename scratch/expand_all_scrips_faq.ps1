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

$scrips = Get-ChildItem -Path scripts -Directory
$successList = @()
$skipList = @()
$errorList = @()

foreach ($s in $scrips) {
    $scripName = $s.Name
    $filePath = "scripts\$scripName\$scripName.html"
    if (-not (Test-Path $filePath)) { continue }
    
    $c = [System.IO.File]::ReadAllText($filePath, [System.Text.Encoding]::UTF8)
    
    $origDivOpen = ([regex]::Matches($c, '<div[\s>]')).Count
    $origDivClose = ([regex]::Matches($c, '</div>')).Count
    
    $accStart = $c.IndexOf('<div class="faq-accordion">')
    if ($accStart -lt 0) {
        $skipList += "$scripName (no .faq-accordion found)"
        continue
    }
    
    $accEnd = Get-MatchingDivEndIndex $c $accStart
    if ($accEnd -lt 0) {
        $errorList += "$scripName (div matching failed)"
        continue
    }
    
    $accInner = $c.Substring($accStart, $accEnd - $accStart)
    
    # Extract Title and ISIN
    $titleMatch = [regex]::Match($c, '<h1[^>]*>(.*?)</h1>')
    $rawTitle = if ($titleMatch.Success) { ($titleMatch.Groups[1].Value -replace '<[^>]+>', '').Trim() } else { $scripName }
    $shortName = $rawTitle -replace '\s+Limited.*', '' -replace '\s+Ltd.*', '' -replace '\s+Pvt.*', ''
    
    $isinMatch = [regex]::Match($c, 'INE[A-Z0-9]{9}')
    $isin = if ($isinMatch.Success) { $isinMatch.Value } else { "Active Demat" }
    
    # Extract existing questions
    $qMatches = [regex]::Matches($accInner, '(?s)<div class="faq-question">\s*<span>(.*?)</span>')
    $existingQs = @()
    for ($i = 0; $i -lt $qMatches.Count; $i++) {
        $existingQs += $qMatches[$i].Groups[1].Value.Trim()
    }
    $allQText = $existingQs -join " "
    
    $hasSelling = ($allQText -match '(?i)sell|liquidat|payout')
    $hasIPO = ($allQText -match '(?i)\bipo\b|lock-in|listing')
    $hasTax = ($allQText -match '(?i)tax|capital gains')
    $hasDividends = ($allQText -match '(?i)dividend|corporate action|bonus')
    
    $itemsToAdd = @()
    
    if (-not $hasSelling) {
        $itemsToAdd += @"
                            <div class="faq-item">
                                <div class="faq-question">
                                    <span>Can I sell my existing $shortName shares, and how fast is payout credited?</span>
                                    <span class="faq-arrow">&#9662;</span>
                                </div>
                                <div class="faq-answer">
                                    <p><strong>Yes, guaranteed same-day bank credit.</strong> Meera Associates actively purchases unlisted equity shares of $shortName. Once you initiate the off-market depository transfer to our designated clearing Demat account via CDSL Easiest or NSDL, funds are credited directly to your bank account via RTGS/NEFT on the exact same business day upon transfer confirmation.</p>
                                </div>
                            </div>
"@
    }
    
    if (-not $hasIPO) {
        $itemsToAdd += @"
                            <div class="faq-item">
                                <div class="faq-question">
                                    <span>What happens to my $shortName unlisted shares if the company announces an IPO?</span>
                                    <span class="faq-arrow">&#9662;</span>
                                </div>
                                <div class="faq-answer">
                                    <p>When $shortName files its Draft Red Herring Prospectus (DRHP) and lists on the stock exchange (NSE / BSE), your unlisted Demat shares automatically transition into publicly traded listed shares under the company's designated exchange ticker. Under SEBI ICDR regulations, all pre-IPO equity shares held by non-promoters are subject to a mandatory <strong>6-month lock-in period</strong> from the commercial listing date, after which they can be freely traded on the public exchange.</p>
                                </div>
                            </div>
"@
    }
    
    if (-not $hasTax) {
        $itemsToAdd += @"
                            <div class="faq-item">
                                <div class="faq-question">
                                    <span>How is Capital Gains Tax calculated on profits from selling $shortName unlisted shares?</span>
                                    <span class="faq-arrow">&#9662;</span>
                                </div>
                                <div class="faq-answer">
                                    <p>Profits on unlisted equity shares are taxed under the Indian Income Tax Act based on holding tenure:</p>
                                    <ul>
                                        <li><strong>Short-Term Capital Gains (STCG):</strong> If held for <strong>24 months or less</strong>, net gains are added to your taxable income and taxed at your applicable personal income tax slab rates.</li>
                                        <li><strong>Long-Term Capital Gains (LTCG):</strong> If held for <strong>more than 24 months</strong>, net gains are taxed at <strong>12.5%</strong> without indexation benefits (as per recent Finance Act provisions).</li>
                                        <li><strong>Securities Transaction Tax (STT):</strong> Not applicable on off-market transfers; statutory stamp duty @ 0.015% is paid at the time of depository transfer.</li>
                                    </ul>
                                </div>
                            </div>
"@
    }
    
    if (-not $hasDividends) {
        $itemsToAdd += @"
                            <div class="faq-item">
                                <div class="faq-question">
                                    <span>Are $shortName unlisted shares eligible for corporate dividends and bonus shares?</span>
                                    <span class="faq-arrow">&#9662;</span>
                                </div>
                                <div class="faq-answer">
                                    <p><strong>Yes, 100%.</strong> As an unlisted equity shareholder recorded under ISIN <strong>$isin</strong> in the depository register (NSDL / CDSL), you enjoy complete shareholder rights under the Companies Act, 2013. Any corporate dividends declared by $shortName are credited directly to your bank account registered with your Demat account via ECS/NEFT, and bonus shares or stock splits are credited directly into your Demat account as per corporate record dates.</p>
                                </div>
                            </div>
"@
    }
    
    if ($itemsToAdd.Count -eq 0) {
        $skipList += "$scripName (already has all 4 standard questions)"
        continue
    }
    
    $insertPos = $accEnd - 6
    $addText = "`n" + ($itemsToAdd -join "`n`n") + "`n"
    $newContent = $c.Substring(0, $insertPos) + $addText + $c.Substring($insertPos)
    
    # Replace any ❓ with &#10067;
    $newContent = $newContent.Replace('❓', '&#10067;')
    
    $newDivOpen = ([regex]::Matches($newContent, '<div[\s>]')).Count
    $newDivClose = ([regex]::Matches($newContent, '</div>')).Count
    $expectedDiff = $itemsToAdd.Count * 3
    
    if (($newDivOpen - $newDivClose) -eq 0 -and ($newDivOpen - $origDivOpen) -eq $expectedDiff) {
        [System.IO.File]::WriteAllText($filePath, $newContent, [System.Text.Encoding]::UTF8)
        $newTotal = $existingQs.Count + $itemsToAdd.Count
        $successList += [PSCustomObject]@{
            Scrip = $scripName
            Added = $itemsToAdd.Count
            Previous = $existingQs.Count
            Total = $newTotal
        }
    } else {
        $errorList += "$scripName (Div mismatch: open=$newDivOpen, close=$newDivClose, diff=$($newDivOpen-$origDivOpen), expected=$expectedDiff)"
    }
}

Write-Host "================ SUMMARY ================"
Write-Host "Successfully updated: $($successList.Count)"
Write-Host "Skipped:              $($skipList.Count)"
Write-Host "Errors:               $($errorList.Count)"

if ($errorList.Count -gt 0) {
    Write-Host "Errors encountered:"
    $errorList | ForEach-Object { Write-Host "  $_" }
}

$successList | Format-Table -AutoSize
