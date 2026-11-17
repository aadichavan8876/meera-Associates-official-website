# Function to clean non-ASCII chars to HTML decimal entities
function Convert-ToHtmlEntities([string]$text) {
    $sb = New-Object System.Text.StringBuilder
    for ($i = 0; $i -lt $text.Length; $i++) {
        $c = $text[$i]
        $code = [int]$c
        if ($code -ge 55296 -and $code -le 56319) {
            # Surrogate pair
            $c2 = $text[$i+1]
            $codePoint = [char]::ConvertToUtf32($c, $c2)
            $sb.Append("&#$codePoint;") | Out-Null
            $i++
        } elseif ($code -gt 127) {
            # Single non-ASCII char
            $sb.Append("&#$code;") | Out-Null
        } else {
            $sb.Append($c) | Out-Null
        }
    }
    return $sb.ToString()
}

# --- NSDL ASSEMBLY ---
$nsdlReal = [System.IO.File]::ReadAllText("scratch/nsdl_real_utf8.html", [System.Text.Encoding]::UTF8)
$nsdlCurrent = [System.IO.File]::ReadAllText("nsdl-ideas-guide.html", [System.Text.Encoding]::UTF8)

# 1. Extract Section 1 & 2 from nsdlReal
$nsdlS1Start = $nsdlReal.IndexOf('<!-- SECTION 1: NSDL IDeAS Online Registration -->')
$nsdlS3Start = $nsdlReal.IndexOf('<!-- SECTION 3: Frequently Asked Questions & Troubleshooting -->')
$nsdlS1S2 = $nsdlReal.Substring($nsdlS1Start, $nsdlS3Start - $nsdlS1Start)
$nsdlS1S2Clean = Convert-ToHtmlEntities $nsdlS1S2

# 2. Extract FAQ Accordion from current nsdl-ideas-guide.html
$faqAccStart = $nsdlCurrent.IndexOf('<div class="faq-accordion">')
$faqAccEnd = $nsdlCurrent.IndexOf('</section>', $faqAccStart)
$nsdlFaqAccordion = $nsdlCurrent.Substring($faqAccStart, $faqAccEnd - $faqAccStart)

# 3. Build Section 3 FAQs
$nsdlSection3 = @"
<!-- SECTION 3: Frequently Asked Questions & Troubleshooting -->
                <section class="guide-card" id="faqs">
                    <div class="guide-card-header">
                        <h2 class="guide-card-title"><span class="guide-card-title-icon">&#10067;</span> 3. Frequently Asked Questions</h2>
                        <span class="guide-step-tag">Helpdesk</span>
                    </div>

                    $nsdlFaqAccordion
                </section>
"@

# 4. In nsdlCurrent, replace the card starting at <!-- SECTION 1: with ($nsdlS1S2Clean + $nsdlSection3)
$currentCardStart = $nsdlCurrent.IndexOf('<!-- SECTION 1: NSDL IDeAS Online Registration -->')
$currentCardEnd = $nsdlCurrent.IndexOf('</section>', $currentCardStart) + 10 # length of </section>
$nsdlBefore = $nsdlCurrent.Substring(0, $currentCardStart)
$nsdlAfter = $nsdlCurrent.Substring($currentCardEnd)

$nsdlFinal = $nsdlBefore + $nsdlS1S2Clean + "`r`n`r`n                " + $nsdlSection3 + $nsdlAfter
[System.IO.File]::WriteAllText("scratch/nsdl_final.html", $nsdlFinal, [System.Text.Encoding]::UTF8)
Write-Output "Successfully generated scratch/nsdl_final.html (length: $($nsdlFinal.Length))"


# --- CDSL ASSEMBLY ---
$cdslReal = [System.IO.File]::ReadAllText("scratch/cdsl_real_utf8.html", [System.Text.Encoding]::UTF8)
$cdslCurrent = [System.IO.File]::ReadAllText("cdsl-easiest-guide.html", [System.Text.Encoding]::UTF8)

# 1. Extract Section 1 & 2 from cdslReal
$cdslS1Start = $cdslReal.IndexOf('<!-- SECTION 1: CDSL Easiest Online Registration -->')
$cdslS3Start = $cdslReal.IndexOf('<!-- SECTION 3: Frequently Asked Questions & Troubleshooting -->')
$cdslS1S2 = $cdslReal.Substring($cdslS1Start, $cdslS3Start - $cdslS1Start)
$cdslS1S2Clean = Convert-ToHtmlEntities $cdslS1S2

# 2. Extract FAQ Accordion from current cdsl-easiest-guide.html
$cdslFaqAccStart = $cdslCurrent.IndexOf('<div class="faq-accordion">')
$cdslFaqAccEnd = $cdslCurrent.IndexOf('</section>', $cdslFaqAccStart)
$cdslFaqAccordion = $cdslCurrent.Substring($cdslFaqAccStart, $cdslFaqAccEnd - $cdslFaqAccStart)

# 3. Build Section 3 FAQs
$cdslSection3 = @"
<!-- SECTION 3: Frequently Asked Questions & Troubleshooting -->
                <section class="guide-card" id="faqs">
                    <div class="guide-card-header">
                        <h2 class="guide-card-title"><span class="guide-card-title-icon">&#10067;</span> 3. Frequently Asked Questions</h2>
                        <span class="guide-step-tag tag-cdsl">Helpdesk</span>
                    </div>

                    $cdslFaqAccordion
                </section>
"@

# 4. In cdslCurrent, replace the card starting at <!-- SECTION 1: with ($cdslS1S2Clean + $cdslSection3)
$currentCdslCardStart = $cdslCurrent.IndexOf('<!-- SECTION 1: CDSL Easiest Online Registration -->')
$currentCdslCardEnd = $cdslCurrent.IndexOf('</section>', $currentCdslCardStart) + 10
$cdslBefore = $cdslCurrent.Substring(0, $currentCdslCardStart)
$cdslAfter = $cdslCurrent.Substring($currentCdslCardEnd)

$cdslFinal = $cdslBefore + $cdslS1S2Clean + "`r`n`r`n                " + $cdslSection3 + $cdslAfter
[System.IO.File]::WriteAllText("scratch/cdsl_final.html", $cdslFinal, [System.Text.Encoding]::UTF8)
Write-Output "Successfully generated scratch/cdsl_final.html (length: $($cdslFinal.Length))"
