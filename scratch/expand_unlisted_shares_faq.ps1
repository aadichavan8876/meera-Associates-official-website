$filePath = 'unlisted-shares.html'
$c = [System.IO.File]::ReadAllText($filePath, [System.Text.Encoding]::UTF8)

# Check baseline div count
$origDivOpen = ([regex]::Matches($c, '<div[\s>]')).Count
$origDivClose = ([regex]::Matches($c, '</div>')).Count

# We want to find the last item (Q18) and append Q19 to Q25 before the closing </div> of .faq-accordion
$accStart = $c.IndexOf('<div class="faq-accordion"')
if ($accStart -lt 0) {
    Write-Host "Accordion not found!"
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

$accEnd = Get-MatchingDivEndIndex $c $accStart
# The closing </div> is at $accEnd - 6
$insertPos = $accEnd - 6

$newQuestions = @"

                    <!-- Q19 -->
                    <div class="faq-item" data-category="unlisted">
                        <div class="faq-question">
                            <span>Can Non-Resident Indians (NRIs) and OCIs invest in Indian unlisted shares, and what is the process?</span>
                            <span class="faq-arrow">&#9662;</span>
                        </div>
                        <div class="faq-answer">
                            <p><strong>Yes, absolutely.</strong> NRIs and Overseas Citizens of India (OCIs) can legally purchase and sell unlisted shares in India in compliance with the Foreign Exchange Management Act (FEMA) and RBI guidelines:</p>
                            <ul>
                                <li><strong>Account Structure:</strong> Transactions are routed through a designated Non-Resident Ordinary (NRO) Demat account (for non-repatriable investments) or Non-Resident External (NRE) Demat account (for repatriable investments subject to sectoral caps).</li>
                                <li><strong>Required Documentation:</strong> Valid Passport copy with Visa/OCI card, Overseas address proof, PAN card, and broker-attested NRO/NRE Client Master List (CML).</li>
                                <li><strong>Advisory Support:</strong> Meera Associates assists international investors with FEMA compliance certifications, Fair Market Value (FMV) reporting, and seamless depository settlements.</li>
                            </ul>
                        </div>
                    </div>

                    <!-- Q20 -->
                    <div class="faq-item" data-category="unlisted">
                        <div class="faq-question">
                            <span>What is a Demat Client Master List (CML) and why must it bear a broker seal?</span>
                            <span class="faq-arrow">&#9662;</span>
                        </div>
                        <div class="faq-answer">
                            <p>A <strong>Client Master List (CML)</strong> or Client Master Report (CMR) is an official identity statement generated directly from the depository (NSDL or CDSL) by your Depository Participant (broker such as Zerodha, Groww, ICICI Direct, HDFC Securities, or Angel One).</p>
                            <p>It contains your complete 16-digit Demat Account number, DP ID, Client ID, verified PAN, bank mandate, and registered nominee details. An official broker digital or physical stamp is mandatory under SEBI regulations to authenticate account ownership and prevent fraudulent off-market transfers.</p>
                        </div>
                    </div>

                    <!-- Q21 -->
                    <div class="faq-item" data-category="unlisted">
                        <div class="faq-question">
                            <span>How are dividends from unlisted shares paid and is TDS deducted?</span>
                            <span class="faq-arrow">&#9662;</span>
                        </div>
                        <div class="faq-answer">
                            <p>Dividends declared by unlisted companies are credited directly to your bank account registered with your Demat account via Electronic Clearing Service (ECS) or direct NEFT/RTGS:</p>
                            <ul>
                                <li><strong>Tax Deduction at Source (TDS):</strong> Under Section 194 of the Income Tax Act, companies deduct <strong>10% TDS</strong> on dividend payouts exceeding ₹5,000 in a financial year for resident individual shareholders with valid PAN.</li>
                                <li><strong>Exemption Submission:</strong> Resident individuals with total income below taxable thresholds can submit Form 15G or Form 15H to the company's Registrar &amp; Transfer Agent (RTA) prior to the corporate record date to avoid TDS deduction.</li>
                                <li><strong>Form 26AS / AIS:</strong> The deducted TDS reflects in your Annual Information Statement (AIS) and Form 26AS, which can be claimed when filing your annual ITR.</li>
                            </ul>
                        </div>
                    </div>

                    <!-- Q22 -->
                    <div class="faq-item" data-category="unlisted">
                        <div class="faq-question">
                            <span>What happens if an unlisted company initiates a share buyback or capital reduction?</span>
                            <span class="faq-arrow">&#9662;</span>
                        </div>
                        <div class="faq-answer">
                            <p>Unlisted public companies frequently execute corporate share buybacks under Section 68 of the Companies Act, 2013 to return surplus cash to shareholders or restructure equity capital:</p>
                            <ul>
                                <li><strong>Tender Offer Notice:</strong> The company sends an official Buyback Offer Letter and tender form to all registered Demat shareholders as of the specified corporate record date.</li>
                                <li><strong>Participation:</strong> Shareholders can tender their eligible shares off-market through their depository portal (CDSL Easiest or NSDL DIS) to the company's designated escrow Demat account.</li>
                                <li><strong>Taxation:</strong> Under the amended Finance Act provisions, buyback proceeds are taxed in the hands of the recipient shareholder as dividend income, and capital losses may be claimed on the tendered acquisition cost.</li>
                            </ul>
                        </div>
                    </div>

                    <!-- Q23 -->
                    <div class="faq-item" data-category="unlisted">
                        <div class="faq-question">
                            <span>How are unlisted shares transmitted to a nominee or legal heir in case of a shareholder's demise?</span>
                            <span class="faq-arrow">&#9662;</span>
                        </div>
                        <div class="faq-answer">
                            <p>Because all unlisted shares transacted via Meera Associates are held in electronic Demat form (NSDL / CDSL), inheritance transmission follows streamlined statutory depository procedures:</p>
                            <ul>
                                <li><strong>With Registered Nominee:</strong> The registered nominee submits a notarized Death Certificate and Transmission Request Form (TRF) to the Depository Participant (DP). The shares are directly transferred to the nominee's Demat account without court intervention.</li>
                                <li><strong>Without Nominee (Simplified Threshold):</strong> For estates up to ₹15 Lakhs in market value, transmission is completed with a notarized indemnity bond, affidavit, and No Objection Certificates (NOC) from all legal heirs.</li>
                                <li><strong>Specialist Assistance:</strong> Meera Associates' estate recovery desk provides comprehensive documentation support to ensure legal heirs experience zero friction.</li>
                            </ul>
                        </div>
                    </div>

                    <!-- Q24 -->
                    <div class="faq-item" data-category="unlisted">
                        <div class="faq-question">
                            <span>Can I pledge unlisted shares as collateral for loans with commercial banks or NBFCs?</span>
                            <span class="faq-arrow">&#9662;</span>
                        </div>
                        <div class="faq-answer">
                            <p><strong>Yes, subject to institutional lender criteria.</strong> Several premier Non-Banking Financial Companies (NBFCs) and private wealth banks offer <em>Loan Against Shares (LAS)</em> on select high-quality, dividend-paying unlisted companies (such as market infrastructure institutions, tier-1 pre-IPO enterprises, or parent MNC subsidiaries).</p>
                            <p>Pledge creation is executed electronically through your NSDL or CDSL Demat account under standard depository pledge-hypothecation protocols with applicable Loan-to-Value (LTV) haircuts.</p>
                        </div>
                    </div>

                    <!-- Q25 -->
                    <div class="faq-item" data-category="unlisted">
                        <div class="faq-question">
                            <span>Why is settlement conducted via direct RTGS / NEFT rather than retail UPI or card gateways?</span>
                            <span class="faq-arrow">&#9662;</span>
                        </div>
                        <div class="faq-answer">
                            <p>Unlisted equity transactions involve formal off-market private contracts governed by the Companies Act and Indian Stamp Act, requiring strict institutional banking audit trails:</p>
                            <ul>
                                <li><strong>Statutory Proof of Consideration:</strong> RTGS / NEFT bank transfers generate verifiable Unique Transaction Reference (UTR) numbers that legally link the buyer's payment to the seller's Delivery Instruction Slip (DIS) and Stamp Duty challan.</li>
                                <li><strong>Transaction Value Limits:</strong> Institutional block trades and HNI lot sizes routinely exceed retail UPI and payment gateway daily limits (typically capped at ₹1 Lakh to ₹2 Lakhs).</li>
                                <li><strong>Direct Bank Credit:</strong> Sellers receive direct RTGS credits into their verified bank account without intermediaries holding escrow funds for days.</li>
                            </ul>
                        </div>
                    </div>

"@

$newContent = $c.Substring(0, $insertPos) + $newQuestions + $c.Substring($insertPos)

$newDivOpen = ([regex]::Matches($newContent, '<div[\s>]')).Count
$newDivClose = ([regex]::Matches($newContent, '</div>')).Count

Write-Host "Original Divs: $origDivOpen / $origDivClose ($($origDivOpen - $origDivClose))"
Write-Host "New Divs:      $newDivOpen / $newDivClose ($($newDivOpen - $newDivClose))"
Write-Host "Div Difference: $($newDivOpen - $origDivOpen) (Expected: 21 because 7 items * 3 divs = 21)"

if (($newDivOpen - $newDivClose) -eq 0 -and ($newDivOpen - $origDivOpen) -eq 21) {
    [System.IO.File]::WriteAllText($filePath, $newContent, [System.Text.Encoding]::UTF8)
    Write-Host "Successfully expanded unlisted-shares.html to 25 questions!"
} else {
    Write-Host "ERROR: Div balance check failed!"
    exit 1
}
