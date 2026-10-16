$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
$scrips = Get-ChildItem -Directory scripts

$updatedHtmlCount = 0
$updatedCssCount = 0

foreach ($s in $scrips) {
    $slug = $s.Name
    $htmlPath = Join-Path $s.FullName "$slug.html"
    $cssPath = Join-Path $s.FullName "$slug.css"
    
    if (Test-Path $htmlPath) {
        $html = [System.IO.File]::ReadAllText($htmlPath, [System.Text.Encoding]::UTF8)
        
        # Detect prefix from html
        $mPrefix = [regex]::Match($html, 'class="([a-z0-9]+)-metrics-strip"')
        if (-not $mPrefix.Success) {
            Write-Host "Warning: Could not detect metrics-strip prefix in $slug"
            continue
        }
        $prefix = $mPrefix.Groups[1].Value
        
        # 1. Standardize Hero Metrics Strip to 3 cards
        $stripPattern = '(?s)(<div class="' + $prefix + '-metrics-strip">)(.*?)(</div>\s*</div>\s*</section>)'
        $mStrip = [regex]::Match($html, $stripPattern)
        if ($mStrip.Success) {
            $stripInner = $mStrip.Groups[2].Value
            $cards = [regex]::Matches($stripInner, '(?s)<div class="' + $prefix + '-metric-card">.*?</div>')
            if ($cards.Count -ge 3) {
                $c0 = $cards[0].Value
                $c1 = $cards[1].Value
                $c2 = $cards[2].Value
                
                # Standardize emojis in cards to numeric entities
                $c0 = [regex]::Replace($c0, 'class="' + $prefix + '-metric-label">.*?Established', 'class="' + $prefix + '-metric-label">&#128197; Established')
                $c1 = [regex]::Replace($c1, 'class="' + $prefix + '-metric-label">.*?Face Value', 'class="' + $prefix + '-metric-label">&#128176; Face Value')
                $c2 = [regex]::Replace($c2, 'class="' + $prefix + '-metric-label">.*?ISIN Depository Code', 'class="' + $prefix + '-metric-label">&#128203; ISIN Depository Code')
                
                $newStripInner = "`r`n                " + $c0.Trim() + "`r`n`r`n                " + $c1.Trim() + "`r`n`r`n                " + $c2.Trim() + "`r`n            "
                $newStrip = $mStrip.Groups[1].Value + $newStripInner + $mStrip.Groups[3].Value
                $html = $html.Substring(0, $mStrip.Index) + $newStrip + $html.Substring($mStrip.Index + $mStrip.Length)
            }
        }
        
        # 2. Standardize Corporate Master Table to strictly 4 rows
        $tablePattern = '(?s)(<table class="' + $prefix + '-table"[^>]*>\s*<tbody>)(.*?)(</tbody>\s*</table>)'
        $mTable = [regex]::Match($html, $tablePattern)
        if ($mTable.Success) {
            $tbody = $mTable.Groups[2].Value
            $rows = [regex]::Matches($tbody, '(?s)<tr>\s*<td class="td-label">(.*?)</td>\s*<td class="td-val">(.*?)</td>\s*</tr>')
            
            $rowName = $null
            $rowBiz = $null
            $rowProm = $null
            $rowAddr = $null
            
            foreach ($r in $rows) {
                $lbl = $r.Groups[1].Value
                $val = $r.Groups[2].Value.Trim()
                if ($lbl -match 'Company Name') {
                    $rowName = "                                <tr>`r`n                                    <td class=""td-label"">&#127970; Company Name</td>`r`n                                    <td class=""td-val"">$val</td>`r`n                                </tr>"
                } elseif ($lbl -match 'Nature of Business') {
                    $rowBiz = "                                <tr>`r`n                                    <td class=""td-label"">&#9889; Nature of Business</td>`r`n                                    <td class=""td-val"">$val</td>`r`n                                </tr>"
                } elseif ($lbl -match 'Promoters') {
                    $rowProm = "                                <tr>`r`n                                    <td class=""td-label"">&#128101; Promoters</td>`r`n                                    <td class=""td-val"">$val</td>`r`n                                </tr>"
                } elseif ($lbl -match 'Registered Address') {
                    $rowAddr = "                                <tr>`r`n                                    <td class=""td-label"">&#128205; Registered Address</td>`r`n                                    <td class=""td-val"">$val</td>`r`n                                </tr>"
                }
            }
            
            if ($rowName -and $rowBiz -and $rowProm -and $rowAddr) {
                $newTbody = "`r`n" + $rowName + "`r`n" + $rowBiz + "`r`n" + $rowProm + "`r`n" + $rowAddr + "`r`n                            "
                $newTable = $mTable.Groups[1].Value + $newTbody + $mTable.Groups[3].Value
                $html = $html.Substring(0, $mTable.Index) + $newTable + $html.Substring($mTable.Index + $mTable.Length)
            } else {
                Write-Host "Warning: Could not extract all 4 rows for $($slug)"
            }
        }
        
        [System.IO.File]::WriteAllText($htmlPath, $html, $utf8NoBom)
        $updatedHtmlCount++
        
        # 3. Update CSS metrics-strip grid-template-columns
        if (Test-Path $cssPath) {
            $css = [System.IO.File]::ReadAllText($cssPath, [System.Text.Encoding]::UTF8)
            $newCss = [regex]::Replace($css, '(\.' + $prefix + '-metrics-strip\s*\{[^}]*?grid-template-columns:\s*)repeat\(4,\s*1fr\)', '${1}repeat(3, 1fr)')
            if ($newCss -ne $css) {
                [System.IO.File]::WriteAllText($cssPath, $newCss, $utf8NoBom)
                $updatedCssCount++
            }
        }
    }
}

Write-Host "Processed $updatedHtmlCount HTML files, updated $updatedCssCount CSS files."
