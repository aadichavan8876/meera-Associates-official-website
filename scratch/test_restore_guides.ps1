# Load files
$nsdlCurrent = [System.IO.File]::ReadAllText("nsdl-ideas-guide.html")
$nsdlOld = [System.IO.File]::ReadAllText("scratch/nsdl_utf8.html")

$cdslCurrent = [System.IO.File]::ReadAllText("cdsl-easiest-guide.html")
$cdslOld = [System.IO.File]::ReadAllText("scratch/cdsl_utf8.html")

# --- NSDL RESTORATION ---
# 1. Extract Section 1 & 2 from nsdlOld
$nsdlS1Start = $nsdlOld.IndexOf('<!-- SECTION 1: NSDL IDeAS Online Registration -->')
$nsdlS3Start = $nsdlOld.IndexOf('<!-- SECTION 3: Frequently Asked Questions')
$nsdlSections1and2 = $nsdlOld.Substring($nsdlS1Start, $nsdlS3Start - $nsdlS1Start)

# 2. In nsdlCurrent, find where the card starts:
# Current has:
#                 <!-- SECTION 1: NSDL IDeAS Online Registration -->
#                 <section class="guide-card" id="registration">
#                     <div class="guide-card-header">
#                         <h2 class="guide-card-title"><span class="guide-card-title-icon">&#10067;</span> Frequently Asked Questions</h2>
#                         <span class="guide-step-tag">Investor Intelligence</span>
#                     </div>
$nsdlTarget = '<!-- SECTION 1: NSDL IDeAS Online Registration -->
                <section class="guide-card" id="registration">
                    <div class="guide-card-header">
                        <h2 class="guide-card-title"><span class="guide-card-title-icon">&#10067;</span> Frequently Asked Questions</h2>
                        <span class="guide-step-tag">Investor Intelligence</span>
                    </div>'

$nsdlReplacement = $nsdlSections1and2 + '<!-- SECTION 3: Frequently Asked Questions & Troubleshooting -->
                <section class="guide-card" id="faqs">
                    <div class="guide-card-header">
                        <h2 class="guide-card-title"><span class="guide-card-title-icon">&#10067;</span> 3. Frequently Asked Questions</h2>
                        <span class="guide-step-tag">Helpdesk</span>
                    </div>'

$nsdlNew = $nsdlCurrent.Replace($nsdlTarget.Trim(), $nsdlReplacement.Trim())
[System.IO.File]::WriteAllText("scratch/nsdl_restored.html", $nsdlNew, [System.Text.Encoding]::UTF8)

# --- CDSL RESTORATION ---
# 1. Extract Section 1 & 2 from cdslOld
$cdslS1Start = $cdslOld.IndexOf('<!-- SECTION 1: CDSL Easiest Online Registration -->')
$cdslS3Start = $cdslOld.IndexOf('<!-- SECTION 3: Frequently Asked Questions')
$cdslSections1and2 = $cdslOld.Substring($cdslS1Start, $cdslS3Start - $cdslS1Start)

$cdslTarget = '<!-- SECTION 1: CDSL Easiest Online Registration -->
                <section class="guide-card" id="registration">
                    <div class="guide-card-header">
                        <h2 class="guide-card-title"><span class="guide-card-title-icon">&#10067;</span> Frequently Asked Questions</h2>
                        <span class="guide-step-tag tag-cdsl">Investor Intelligence</span>
                    </div>'

$cdslReplacement = $cdslSections1and2 + '<!-- SECTION 3: Frequently Asked Questions & Troubleshooting -->
                <section class="guide-card" id="faqs">
                    <div class="guide-card-header">
                        <h2 class="guide-card-title"><span class="guide-card-title-icon">&#10067;</span> 3. Frequently Asked Questions</h2>
                        <span class="guide-step-tag tag-cdsl">Helpdesk</span>
                    </div>'

$cdslNew = $cdslCurrent.Replace($cdslTarget.Trim(), $cdslReplacement.Trim())
[System.IO.File]::WriteAllText("scratch/cdsl_restored.html", $cdslNew, [System.Text.Encoding]::UTF8)

Write-Output "Generated restored files in scratch/."
