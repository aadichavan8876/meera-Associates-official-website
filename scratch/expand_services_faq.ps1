$filePath = 'services.html'
$c = [System.IO.File]::ReadAllText($filePath, [System.Text.Encoding]::UTF8)

# Baseline div counts
$origDivOpen = ([regex]::Matches($c, '<div[\s>]')).Count
$origDivClose = ([regex]::Matches($c, '</div>')).Count

# 1. Update tab button count from (36) to (48)
$c = $c.Replace('All Questions (36)', 'All Questions (48)')

# 2. Insert Category 2 questions (after Q14)
# Let's find Q14 item end
$q14Str = 'How do I obtain a live valuation or buyback price quote for my unlisted scrips?'
$q14Idx = $c.IndexOf($q14Str)
if ($q14Idx -lt 0) { Write-Host "Q14 not found!"; exit 1 }

# Find the closing </div> of Q14's .faq-item
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

# The faq-item containing Q14 starts before $q14Idx
$q14ItemStart = $c.LastIndexOf('<div class="faq-item"', $q14Idx)
$q14ItemEnd = Get-MatchingDivEndIndex $c $q14ItemStart

$cat2New = @"


                    <!-- Q14B -->
                    <div class="faq-item" data-category="selling">
                        <div class="faq-question">
                            <span>Can I sell unlisted shares acquired through employee stock options (ESOPs)?</span>
                            <span class="faq-arrow">&#9662;</span>
                        </div>
                        <div class="faq-answer">
                            <p><strong>Yes.</strong> Once your employee stock options (ESOPs) are vested, exercised, and the resultant equity shares are credited to your personal Demat account (NSDL or CDSL), they are fully eligible for liquidation in the secondary unlisted market.</p>
                            <p>Meera Associates verifies that any company-specific grant lock-in or restriction period has expired, and executes the off-market sale with guaranteed same-day RTGS/NEFT settlement upon depository credit.</p>
                        </div>
                    </div>

                    <!-- Q14C -->
                    <div class="faq-item" data-category="selling">
                        <div class="faq-question">
                            <span>What is the step-by-step verification process before the same-day payout is released?</span>
                            <span class="faq-arrow">&#9662;</span>
                        </div>
                        <div class="faq-answer">
                            <p>Our <strong>Guaranteed Same-Day Payout</strong> follows a strict 3-step institutional protocol executed within standard banking clearing hours:</p>
                            <ul>
                                <li><strong>Step 1 — Rate &amp; Quantity Confirmation:</strong> Agree on the net realization price per share and confirm your bank account details (cancelled cheque / bank statement).</li>
                                <li><strong>Step 2 — Depository Transfer:</strong> Execute the off-market transfer via CDSL Easiest, NSDL Speed-e, or physical DIS slip to our designated SEBI-clearing Demat account.</li>
                                <li><strong>Step 3 — Instant Bank Credit:</strong> As soon as the depository credit reflects (typically within 15–30 minutes), our treasury desk immediately dispatches funds via RTGS/NEFT and provides the official bank UTR reference receipt.</li>
                            </ul>
                        </div>
                    </div>
"@

$c = $c.Substring(0, $q14ItemEnd) + $cat2New + $c.Substring($q14ItemEnd)

# 3. Insert Category 3 question (after Q21)
$q21Str = 'What is a Client Master List (CML) and why is a broker seal required?'
$q21Idx = $c.IndexOf($q21Str)
if ($q21Idx -lt 0) { Write-Host "Q21 not found!"; exit 1 }
$q21ItemStart = $c.LastIndexOf('<div class="faq-item"', $q21Idx)
$q21ItemEnd = Get-MatchingDivEndIndex $c $q21ItemStart

$cat3New = @"


                    <!-- Q21B -->
                    <div class="faq-item" data-category="demat">
                        <div class="faq-question">
                            <span>What is the difference between an Intra-Depository transfer and an Inter-Depository transfer?</span>
                            <span class="faq-arrow">&#9662;</span>
                        </div>
                        <div class="faq-answer">
                            <p>In Indian securities clearing, depository transfers fall into two distinct operational routes:</p>
                            <ul>
                                <li><strong>Intra-Depository Transfer:</strong> Transfer occurring within the same depository system—either <em>CDSL to CDSL</em> or <em>NSDL to NSDL</em>. These settle almost instantaneously upon OTP / PIN authorization on CDSL Easiest or NSDL Speed-e.</li>
                                <li><strong>Inter-Depository Transfer:</strong> Transfer occurring across different depositories—either <em>CDSL to NSDL</em> or <em>NSDL to CDSL</em>. Both depositories execute a cross-settlement protocol, taking approximately 2 to 4 hours during business days.</li>
                            </ul>
                            <p>Meera Associates maintains operational clearing Demat accounts across <strong>both NSDL and CDSL</strong>, allowing sellers and buyers to execute faster, lower-cost Intra-Depository transfers regardless of which broker they use.</p>
                        </div>
                    </div>
"@

$c = $c.Substring(0, $q21ItemEnd) + $cat3New + $c.Substring($q21ItemEnd)

# 4. Insert Category 4 questions (after Q26)
$q26Str = 'How do legal heirs claim physical shares of a deceased family member (Transmission of Shares)?'
$q26Idx = $c.IndexOf($q26Str)
if ($q26Idx -lt 0) { Write-Host "Q26 not found!"; exit 1 }
$q26ItemStart = $c.LastIndexOf('<div class="faq-item"', $q26Idx)
$q26ItemEnd = Get-MatchingDivEndIndex $c $q26ItemStart

$cat4New = @"


                    <!-- Q26B -->
                    <div class="faq-item" data-category="physical">
                        <div class="faq-question">
                            <span>What are SEBI Form ISR-1, ISR-2, and ISR-4, and why are they mandatory for physical shares?</span>
                            <span class="faq-arrow">&#9662;</span>
                        </div>
                        <div class="faq-answer">
                            <p>SEBI has standardized all service requests relating to physical paper securities through mandatory Investor Service Request (ISR) statutory forms:</p>
                            <ul>
                                <li><strong>Form ISR-1:</strong> Mandatory form for registering or updating PAN, KYC details, bank account mandate, mobile number, and email ID with the Registrar &amp; Transfer Agent (RTA).</li>
                                <li><strong>Form ISR-2:</strong> Banker's verification form containing the original signature attestation by your bank branch manager, used to eliminate signature mismatches.</li>
                                <li><strong>Form ISR-4:</strong> Request for issue of duplicate share certificates, replacement of defaced certificates, or Letter of Confirmation for dematerialization.</li>
                            </ul>
                            <p>Our physical share desk prepares and pre-fills all requisite ISR forms with complete legal compliance to ensure zero RTA rejection.</p>
                        </div>
                    </div>

                    <!-- Q26C -->
                    <div class="faq-item" data-category="physical">
                        <div class="faq-question">
                            <span>Can physical share certificates held in joint names be converted into a Demat account?</span>
                            <span class="faq-arrow">&#9662;</span>
                        </div>
                        <div class="faq-answer">
                            <p><strong>Yes.</strong> To dematerialize joint physical share certificates, the electronic Demat account must have the exact same joint holders in the identical order of names (e.g. Primary Holder: Father, Second Holder: Son).</p>
                            <p>If the names appear in reversed or alternate order in your Demat account, a <strong>Transposition Request Form (TRF)</strong> is submitted alongside the Demat Request Form (DRF). This allows the depository to match and credit the shares into the Demat account without requiring a formal stamp duty sale deed or transfer execution.</p>
                        </div>
                    </div>

                    <!-- Q26D -->
                    <div class="faq-item" data-category="physical">
                        <div class="faq-question">
                            <span>What happens if the company whose physical certificates I hold has merged, changed its name, or split shares?</span>
                            <span class="faq-arrow">&#9662;</span>
                        </div>
                        <div class="faq-answer">
                            <p>Many legacy certificates date back 20 to 40 years, during which companies have undergone corporate mergers, reverse mergers, demergers, splits, and bonus issues (e.g. Reliance, Tata, Larsen &amp; Toubro, ITC):</p>
                            <ul>
                                <li><strong>Corporate Entitlement Audit:</strong> Meera Associates tracks the complete corporate action history of the company across ROC and stock exchange records to establish current share entitlement and swap ratios.</li>
                                <li><strong>Current RTA Liaison:</strong> We identify the surviving entity's active Registrar &amp; Transfer Agent (such as Link Intime, KFin Technologies, or Bigshare) and file for current entitlement certificates.</li>
                                <li><strong>Consolidated Demat Credit:</strong> The entire expanded shareholding, along with accumulated corporate split and bonus benefits, is credited directly into your active Demat portfolio.</li>
                            </ul>
                        </div>
                    </div>
"@

$c = $c.Substring(0, $q26ItemEnd) + $cat4New + $c.Substring($q26ItemEnd)

# 5. Insert Category 5 questions (after Q30)
$q30Str = 'How long does the complete IEPF recovery process take from filing to Demat credit?'
$q30Idx = $c.IndexOf($q30Str)
if ($q30Idx -lt 0) { Write-Host "Q30 not found!"; exit 1 }
$q30ItemStart = $c.LastIndexOf('<div class="faq-item"', $q30Idx)
$q30ItemEnd = Get-MatchingDivEndIndex $c $q30ItemStart

$cat5New = @"


                    <!-- Q30B -->
                    <div class="faq-item" data-category="iepf">
                        <div class="faq-question">
                            <span>How do I check if my lost shares or unclaimed dividends have been transferred to the IEPF Authority?</span>
                            <span class="faq-arrow">&#9662;</span>
                        </div>
                        <div class="faq-answer">
                            <p>You can verify whether your investments have been transferred to the government IEPF repository using official portals:</p>
                            <ul>
                                <li><strong>Official IEPF Portal Search:</strong> Visit the official MCA IEPF portal (<a href="https://www.iepf.gov.in" target="_blank" rel="noopener noreferrer" style="color: #0284c7; font-weight: 700;">iepf.gov.in</a>) and use the <em>Search Unclaimed / Unpaid Amounts</em> tool by entering your PAN number, Folio number, or DP ID / Client ID.</li>
                                <li><strong>Company Unpaid Dividend Lists:</strong> All listed and public unlisted companies publish an annual PDF list of IEPF-transferred shareholders on their Investor Relations webpage under MCA guidelines.</li>
                                <li><strong>Free Verification by Meera Associates:</strong> Submit your folios or certificate scans to our IEPF desk for a complimentary search across nationwide MCA and RTA databases.</li>
                            </ul>
                        </div>
                    </div>

                    <!-- Q30C -->
                    <div class="faq-item" data-category="iepf">
                        <div class="faq-question">
                            <span>What is the Entitlement Letter issued by the company / RTA during IEPF-5 verification?</span>
                            <span class="faq-arrow">&#9662;</span>
                        </div>
                        <div class="faq-answer">
                            <p>The <strong>Verification Report &amp; Entitlement Letter</strong> is the most critical milestone in an IEPF claim:</p>
                            <p>After filing Form IEPF-5 online and submitting physical documentation to the company's nodal officer, the company/RTA performs statutory verification. Upon confirming the claimant's legal ownership, the company uploads an electronic Verification Report to the Ministry of Corporate Affairs, officially certifying that the claimant is entitled to the specified number of shares and total accumulated unpaid dividends. Once approved, the IEPF Authority sanctions the direct Demat credit.</p>
                        </div>
                    </div>

                    <!-- Q30D -->
                    <div class="faq-item" data-category="iepf">
                        <div class="faq-question">
                            <span>What are the Advance Indemnity Bond and Affidavit required for IEPF claims?</span>
                            <span class="faq-arrow">&#9662;</span>
                        </div>
                        <div class="faq-answer">
                            <p>Under the IEPF Authority (Accounting, Audit, Transfer and Refund) Rules, claimants must execute two legal instruments on non-judicial stamp paper:</p>
                            <ul>
                                <li><strong>Advance Stamp Indemnity Bond:</strong> An agreement on appropriate state non-judicial stamp paper indemnifying the IEPF Authority against any future rival claims or disputes regarding the transferred securities.</li>
                                <li><strong>Affidavit of Ownership:</strong> A notarized sworn declaration confirming identity, valid title to the original share folio, and explaining any signature differences or historic address changes.</li>
                            </ul>
                            <p>Meera Associates drafts and franking-certifies these customized legal documents in accordance with applicable state stamp acts.</p>
                        </div>
                    </div>

                    <!-- Q30E -->
                    <div class="faq-item" data-category="iepf">
                        <div class="faq-question">
                            <span>Can legal heirs claim shares from IEPF if the original shareholder passed away without nomination?</span>
                            <span class="faq-arrow">&#9662;</span>
                        </div>
                        <div class="faq-answer">
                            <p><strong>Yes, through Transmission-cum-IEPF Claim.</strong> When a shareholder passes away without registering a nominee, legal heirs can still successfully reclaim both the equity shares and accumulated dividend corpus:</p>
                            <ul>
                                <li><strong>Up to ₹5 Lakhs Market Value:</strong> Transmission is processed with a registered Will / Legal Heirship Certificate, notarized Indemnity Bond, and No Objection Certificates (NOC) from other surviving legal heirs.</li>
                                <li><strong>Above ₹5 Lakhs Market Value:</strong> A Succession Certificate or Letter of Administration from a competent civil court is required under statutory MCA provisions.</li>
                                <li><strong>Our End-to-End Service:</strong> Meera Associates handles civil court petition drafting, legal liaison, RTA document stamping, and IEPF-5 digital submission until the shares are safely credited to the heir's Demat account.</li>
                            </ul>
                        </div>
                    </div>
"@

$c = $c.Substring(0, $q30ItemEnd) + $cat5New + $c.Substring($q30ItemEnd)

# 6. Insert Category 6 questions (after Q36)
$q36Str = 'Why choose Meera Associates over online aggregator apps or unauthorized brokers?'
$q36Idx = $c.IndexOf($q36Str)
if ($q36Idx -lt 0) { Write-Host "Q36 not found!"; exit 1 }
$q36ItemStart = $c.LastIndexOf('<div class="faq-item"', $q36Idx)
$q36ItemEnd = Get-MatchingDivEndIndex $c $q36ItemStart

$cat6New = @"


                    <!-- Q36B -->
                    <div class="faq-item" data-category="legal">
                        <div class="faq-question">
                            <span>Are unlisted share investments required to be disclosed in the Annual Income Tax Return (ITR)?</span>
                            <span class="faq-arrow">&#9662;</span>
                        </div>
                        <div class="faq-answer">
                            <p><strong>Yes, mandatory reporting.</strong> The Central Board of Direct Taxes (CBDT) requires all resident individuals holding unlisted equity shares at any time during the financial year to file either <strong>ITR-2</strong> or <strong>ITR-3</strong> (ITR-1 Sahaj cannot be used):</p>
                            <ul>
                                <li><strong>Schedule Unlisted Equity Shares:</strong> You must disclose the Name of Company, Type of Company, PAN of Company, Opening balance (quantity &amp; cost), shares acquired during year (dates, face value, issue price), shares sold during year, and Closing balance.</li>
                                <li><strong>Compliance:</strong> Complete transparency ensures seamless long-term wealth audit compliance and facilitates hassle-free capital gains assessment upon future IPO listing.</li>
                            </ul>
                        </div>
                    </div>

                    <!-- Q36C -->
                    <div class="faq-item" data-category="legal">
                        <div class="faq-question">
                            <span>What statutory safeguards protect investors against fraudulent off-market transfers?</span>
                            <span class="faq-arrow">&#9662;</span>
                        </div>
                        <div class="faq-answer">
                            <p>Off-market share transfers in India operate within the world's most secure and regulated depository infrastructure under SEBI oversight:</p>
                            <ul>
                                <li><strong>Depository Two-Factor Authentication:</strong> Every transfer on CDSL Easiest or NSDL Speed-e mandates multi-factor authentication involving registered mobile OTP and confidential depository PIN/TPIN.</li>
                                <li><strong>Real-Time SMS &amp; Email Alerts:</strong> NSDL and CDSL send instant, tamper-proof electronic debit and credit confirmation alerts directly to the investor's registered phone and email.</li>
                                <li><strong>Direct CML Reconciliation:</strong> Transactions are routed exclusively between verified depository accounts registered under matching PAN credentials, completely eliminating bogus or counterfeit transactions.</li>
                            </ul>
                        </div>
                    </div>
"@

$c = $c.Substring(0, $q36ItemEnd) + $cat6New + $c.Substring($q36ItemEnd)

# Now check div balances:
# 12 items added * 3 divs per item = 36 divs
$newDivOpen = ([regex]::Matches($c, '<div[\s>]')).Count
$newDivClose = ([regex]::Matches($c, '</div>')).Count

Write-Host "Original Divs: $origDivOpen / $origDivClose ($($origDivOpen - $origDivClose))"
Write-Host "New Divs:      $newDivOpen / $newDivClose ($($newDivOpen - $newDivClose))"
Write-Host "Div Difference: $($newDivOpen - $origDivOpen) (Expected: 36 because 12 items * 3 divs = 36)"

if (($newDivOpen - $newDivClose) -eq 0 -and ($newDivOpen - $origDivOpen) -eq 36) {
    [System.IO.File]::WriteAllText($filePath, $c, [System.Text.Encoding]::UTF8)
    Write-Host "Successfully expanded services.html to 48 questions (8 per category)!"
} else {
    Write-Host "ERROR: Div balance check failed!"
    exit 1
}
