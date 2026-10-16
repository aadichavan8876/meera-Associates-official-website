$utf8NoBom = New-Object System.Text.UTF8Encoding($false)

# Read base HTML
$baseHtml = [System.IO.File]::ReadAllText("scripts/csk/csk.html", [System.Text.Encoding]::UTF8)

$h = $baseHtml

# CSK replacements
$h = $h.Replace("Chennai Super Kings (CSK) Unlisted Shares | Meera Associates", "GFCL EV Products Limited Unlisted Shares | Meera Associates")
$h = $h.Replace("Explore Chennai Super Kings Cricket Limited (CSK) unlisted shares, franchise sports business model, board of directors, and ISIN INE852S01026 at Meera Associates.", "Explore GFCL EV Products Limited unlisted shares, EV battery materials manufacturing, board of directors, IFC investment, and ISIN INE0KA501014 at Meera Associates.")
$h = $h.Replace("csk.css", "gfclev.css")
$h = $h.Replace("csk-", "gfclev-")

# Breadcrumbs
$h = $h.Replace("<span>Chennai Super Kings</span>", "<span>GFCL EV Products</span>")

# Hero badge, title, subtitle
$oldBadgeRegex = '(?s)<div class="gfclev-hero-badge">.*?</div>'
$newBadge = '<div class="gfclev-hero-badge"><span class="pulse-dot"></span> &#9889; EV Battery Materials &amp; INOXGFL Group Subsidiary</div>'
$h = [regex]::Replace($h, $oldBadgeRegex, $newBadge)

$h = $h.Replace("Chennai Super Kings Cricket Limited</h1>", "GFCL EV Products Limited</h1>")

$oldSubRegex = '(?s)<p class="gfclev-hero-subtitle">.*?</p>'
$newSub = '<p class="gfclev-hero-subtitle">Leading Indian manufacturer of battery chemicals and advanced fluoropolymer materials for Lithium-ion batteries. Wholly owned subsidiary of Gujarat Fluorochemicals Limited (GFL) backed by a US$50 Million strategic investment from the International Finance Corporation (IFC).</p>'
$h = [regex]::Replace($h, $oldSubRegex, $newSub)

# Hero 3-Metric Strip (Rule #6: 1st block Established, 2nd block Face Value, 3rd block ISIN)
$oldMetricsRegex = '(?s)<div class="gfclev-metrics-strip">.*?</div>\s*</div>\s*</section>'
$newMetrics = @"
<div class="gfclev-metrics-strip">
                <div class="gfclev-metric-card">
                    <span class="gfclev-metric-label">&#128197; Established</span>
                    <span class="gfclev-metric-value">2021</span>
                    <span class="gfclev-metric-sub">INOXGFL Group Subsidiary</span>
                </div>

                <div class="gfclev-metric-card">
                    <span class="gfclev-metric-label">&#128176; Face Value</span>
                    <span class="gfclev-metric-value">&#8377;1.00</span>
                    <span class="gfclev-metric-sub">Per Equity Share (Rs.1/-)</span>
                </div>

                <div class="gfclev-metric-card">
                    <span class="gfclev-metric-label">&#128203; ISIN Depository Code</span>
                    <span class="gfclev-metric-value" style="font-size: 1.15rem; font-family: monospace; color: #38bdf8;">INE0KA501014</span>
                    <span class="gfclev-metric-sub">Demat Off-Market Eligible</span>
                </div>
            </div>
        </div>
    </section>
"@
$h = [regex]::Replace($h, $oldMetricsRegex, $newMetrics)

# Master Specifications Table (as per NCDEX)
$oldTableRegex = '(?s)<table class="gfclev-table".*?</table>'
$newTable = @"
<table class="gfclev-table" aria-label="GFCL EV Products Limited Corporate Master Specifications">
                            <tbody>
                                <tr>
                                    <td class="td-label">&#127970; Company Name</td>
                                    <td class="td-val">GFCL EV PRODUCTS LIMITED.</td>
                                </tr>
                                <tr>
                                    <td class="td-label">&#9889; Nature of Business</td>
                                    <td class="td-val">BATTERY MATERIALS &amp; ADVANCED FLUOROCHEMICALS</td>
                                </tr>
                                <tr>
                                    <td class="td-label">&#128101; Promoters</td>
                                    <td class="td-val">GUJARAT FLUOROCHEMICALS LIMITED (GFL), INOXGFL GROUP, ARVIND KANT, DEVENDRA KUMAR JAIN, NARENDRA KUMAR JAIN, AND SIDDHARTH JAIN</td>
                                </tr>
                                <tr>
                                    <td class="td-label">&#128205; Registered Address</td>
                                    <td class="td-val">SURVEY NO. 16/3, 26 &amp; 27, VILLAGE RANJITNAGAR, TALUKA GHOGHAMBA, PANCHMAHAL, GUJARAT &ndash; 389001, INDIA</td>
                                </tr>
                                <tr>
                                    <td class="td-label">&#127760; Company Website</td>
                                    <td class="td-val"><a href="https://gfclev.co.in/" target="_blank" rel="noopener noreferrer" style="color: #0284c7; text-decoration: none; font-weight: 600;">www.gfclev.co.in &rarr;</a></td>
                                </tr>
                            </tbody>
                        </table>
"@
$h = [regex]::Replace($h, $oldTableRegex, $newTable)

# Directors Grid
$oldDirectorsRegex = '(?s)<div class="directors-grid">.*?</div>\s*</div>\s*<!-- Card 3'
$newDirectors = @"
<div class="directors-grid">
                            <!-- Director 1 -->
                            <div class="director-card">
                                <div class="director-check">&#10003;</div>
                                <div class="director-info">
                                    <span class="director-name">Mr. Vivek Jain</span>
                                    <span class="director-role">CHAIRMAN &amp; MANAGING DIRECTOR</span>
                                </div>
                            </div>

                            <!-- Director 2 -->
                            <div class="director-card">
                                <div class="director-check">&#10003;</div>
                                <div class="director-info">
                                    <span class="director-name">Mr. Manoj Agrawal</span>
                                    <span class="director-role">CHIEF FINANCIAL OFFICER (CFO)</span>
                                </div>
                            </div>

                            <!-- Director 3 -->
                            <div class="director-card">
                                <div class="director-check">&#10003;</div>
                                <div class="director-info">
                                    <span class="director-name">Dr. Bir Kapoor</span>
                                    <span class="director-role">NON-INDEPENDENT DIRECTOR</span>
                                </div>
                            </div>

                            <!-- Director 4 -->
                            <div class="director-card">
                                <div class="director-check">&#10003;</div>
                                <div class="director-info">
                                    <span class="director-name">Mr. Sanjay Bhan</span>
                                    <span class="director-role">WHOLE-TIME DIRECTOR</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Card 3
"@
$h = [regex]::Replace($h, $oldDirectorsRegex, $newDirectors)

# Card 3: Business Overview & Product Portfolio
$oldCard3Regex = '(?s)<!-- Card 3: Franchise Legacy & Sports Unicorn Profile -->.*?<!-- Card 5: Annual Reports'
$newCard3And4 = @"
<!-- Card 3: Business Overview & Advanced Product Portfolio -->
                    <div class="gfclev-card">
                        <div class="gfclev-card-header">
                            <h2 class="gfclev-card-title">
                                <span class="gfclev-card-title-icon">&#128267;</span>
                                Business Ecosystem &amp; Products
                            </h2>
                            <span class="gfclev-card-tag">Specialty Chemicals</span>
                        </div>

                        <p style="font-size: 0.96rem; color: #334155; line-height: 1.65; margin-bottom: 20px;">
                            GFCL EV Products Limited is a leading Indian pioneer in manufacturing specialized battery chemicals and critical intermediate materials for Lithium-ion batteries. As a wholly owned subsidiary of <strong>Gujarat Fluorochemicals Limited (GFL)</strong> and part of the multi-billion dollar <strong>INOXGFL Group</strong>, the company is developing India's first integrated battery materials manufacturing facility in Gujarat to substitute imports and fortify the domestic EV and Energy Storage Systems (ESS) supply chain.
                        </p>

                        <div class="moats-grid">
                            <div class="moat-card">
                                <div class="moat-icon">&#129514;</div>
                                <h3 class="moat-title">Battery Electrolytes &amp; Formulations</h3>
                                <p class="moat-desc">
                                    Formulated electrolytes customized for high-energy density and high-voltage Lithium-ion battery applications across EV two-wheelers, four-wheelers, and commercial fleets.
                                </p>
                            </div>

                            <div class="moat-card">
                                <div class="moat-icon">&#9889;</div>
                                <h3 class="moat-title">Electrolyte Salts (LiPF<sub>6</sub>)</h3>
                                <p class="moat-desc">
                                    Indigenous domestic manufacturing of Lithium Hexafluorophosphate (LiPF<sub>6</sub>), the indispensable conducting salt powering global Lithium-ion battery chemistries.
                                </p>
                            </div>

                            <div class="moat-card">
                                <div class="moat-icon">&#128279;</div>
                                <h3 class="moat-title">Battery Binders (PVDF / PTFE)</h3>
                                <p class="moat-desc">
                                    Proprietary Polyvinylidene Fluoride (PVDF) and PTFE fluoropolymer binders engineered for cathode and anode electrode coatings, ensuring robust mechanical integrity.
                                </p>
                            </div>

                            <div class="moat-card">
                                <div class="moat-icon">&#9881;&#65039;</div>
                                <h3 class="moat-title">Cathode Active Materials (LFP)</h3>
                                <p class="moat-desc">
                                    Lithium Iron Phosphate (LFP) cathode active precursor materials delivering superior thermal stability, long cycle life, and cost competitiveness for Indian driving conditions.
                                </p>
                            </div>
                        </div>
                    </div>

                    <!-- Card 4: Financial Growth & Strategic Highlights -->
                    <div class="gfclev-card">
                        <div class="gfclev-card-header">
                            <h2 class="gfclev-card-title">
                                <span class="gfclev-card-title-icon">&#128200;</span>
                                Financial Highlights &amp; Strategic Backing
                            </h2>
                            <span class="gfclev-card-tag">Growth Trajectory</span>
                        </div>

                        <div class="gfclev-table-wrap">
                            <table class="gfclev-table">
                                <thead>
                                    <tr>
                                        <th>Strategic Milestone</th>
                                        <th>Operational &amp; Investment Significance</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><strong>Revenue Surge (FY 2025-26)</strong></td>
                                        <td>Revenue from operations escalated by approx. <strong>249%</strong>, reflecting the commercial commissioning and capacity ramp-up at its Dahej &amp; Ranjitnagar plants.</td>
                                    </tr>
                                    <tr>
                                        <td><strong>IFC Strategic Investment</strong></td>
                                        <td>In 2025, the <strong>International Finance Corporation (IFC)</strong> committed an equity investment of approx. <strong>US$50 Million (~&#8377;420 Crore)</strong> to fuel facility expansion.</td>
                                    </tr>
                                    <tr>
                                        <td><strong>Integrated Manufacturing</strong></td>
                                        <td>Building India's first end-to-end integrated battery materials complex, backward integrating into captive fluorine chemistry and intermediate feedstocks.</td>
                                    </tr>
                                    <tr>
                                        <td><strong>In-House Cell Testing Labs</strong></td>
                                        <td>Advanced R&amp;D center featuring specialized Cell Performance Testing Labs for rigorous validation of next-gen EV and grid-scale ESS technologies.</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <!-- Card 5: Annual Reports
"@
$h = [regex]::Replace($h, $oldCard3Regex, $newCard3And4)

# Annual Reports card link
$oldFilingRegex = '(?s)<div class="filing-badge-card">.*?</div>\s*</div>\s*<!-- Card 6'
$newFiling = @"
<div class="filing-badge-card">
                            <div class="filing-badge-left">
                                <div class="filing-icon">&#128193;</div>
                                <div>
                                    <strong style="color: #0f172a; font-size: 0.98rem; display: block;">ANNUAL REPORTS &amp; STATUTORY FILINGS</strong>
                                    <span style="font-size: 0.85rem; color: #64748b;">
                                        &#10003; GFCL EV PRODUCTS LIMITED &mdash; Access official annual reports, financial balance sheets, and INOXGFL disclosures.
                                    </span>
                                </div>
                            </div>
                            <div style="display: flex; gap: 10px; flex-wrap: wrap;">
                                <a href="https://gfclev.co.in/Annual-Report" target="_blank" rel="noopener noreferrer" class="gfclev-link-btn" style="font-size: 0.88rem; white-space: nowrap;">
                                    Annual Reports &rarr;
                                </a>
                                <a href="https://gfl.co.in/News.php" target="_blank" rel="noopener noreferrer" class="gfclev-link-btn" style="font-size: 0.88rem; white-space: nowrap; background: #0284c7; color: #fff;">
                                    Company News &rarr;
                                </a>
                            </div>
                        </div>
                    </div>

                    <!-- Card 6
"@
$h = [regex]::Replace($h, $oldFilingRegex, $newFiling)

# Card 6: Frequently Asked Questions (Standardized Orbis Accordion with 7 questions)
$oldFaqRegex = '(?s)<div class="faq-accordion">.*?</div>\s*</div>\s*</div>\s*<!-- RIGHT COLUMN'
$newFaq = @"
<div class="faq-accordion">
                            <div class="faq-item">
                                <div class="faq-question">
                                    <span>What is the core business and product profile of GFCL EV Products Limited?</span>
                                    <span class="faq-arrow">&#9662;</span>
                                </div>
                                <div class="faq-answer">
                                    <p>GFCL EV Products Limited is an Indian manufacturer of critical battery materials for Lithium-ion batteries. As an INOXGFL Group company, it manufactures battery electrolytes, conducting electrolyte salts (LiPF<sub>6</sub>), PVDF/PTFE binders, fluoropolymers, and cathode active materials (LFP) for electric mobility and energy storage systems.</p>
                                </div>
                            </div>

                            <div class="faq-item">
                                <div class="faq-question">
                                    <span>What is the official ISIN and Depository status of GFCL EV Products unlisted shares?</span>
                                    <span class="faq-arrow">&#9662;</span>
                                </div>
                                <div class="faq-answer">
                                    <p>The official ISIN for GFCL EV Products Limited is <strong>INE0KA501014</strong> with an official face value of &#8377;1.00 per equity share. The shares are fully dematerialized and eligible for custody and transfer across both NSDL and CDSL depositories.</p>
                                </div>
                            </div>

                            <div class="faq-item">
                                <div class="faq-question">
                                    <span>Who are the promoter entities and institutional investors backing GFCL EV Products?</span>
                                    <span class="faq-arrow">&#9662;</span>
                                </div>
                                <div class="faq-answer">
                                    <p>GFCL EV is a wholly owned subsidiary of <strong>Gujarat Fluorochemicals Limited (GFL)</strong> within the INOXGFL Group. In 2025, the <strong>International Finance Corporation (IFC)</strong>, the private sector arm of the World Bank Group, committed an equity investment of approx. US$50 Million (~&#8377;420 Crore) to accelerate project execution.</p>
                                </div>
                            </div>

                            <div class="faq-item">
                                <div class="faq-question">
                                    <span>Can I sell my existing GFCL EV Products shares, and how fast is payout credited?</span>
                                    <span class="faq-arrow">&#9662;</span>
                                </div>
                                <div class="faq-answer">
                                    <p><strong>Yes, guaranteed same-day bank credit.</strong> Meera Associates actively purchases unlisted equity shares of GFCL EV Products. Once you initiate the off-market depository transfer to our designated clearing Demat account via CDSL Easiest or NSDL, funds are credited directly to your bank account via RTGS/NEFT on the exact same business day upon transfer confirmation.</p>
                                </div>
                            </div>

                            <div class="faq-item">
                                <div class="faq-question">
                                    <span>What happens to my GFCL EV Products unlisted shares if the company announces an IPO?</span>
                                    <span class="faq-arrow">&#9662;</span>
                                </div>
                                <div class="faq-answer">
                                    <p>When GFCL EV Products files its Draft Red Herring Prospectus (DRHP) and lists on the stock exchange (NSE / BSE), your unlisted Demat shares automatically transition into publicly traded listed shares under the company's designated exchange ticker. Under SEBI ICDR regulations, all pre-IPO equity shares held by non-promoters are subject to a mandatory <strong>6-month lock-in period</strong> from the commercial listing date, after which they can be freely traded on the public exchange.</p>
                                </div>
                            </div>

                            <div class="faq-item">
                                <div class="faq-question">
                                    <span>How is Capital Gains Tax calculated on profits from selling GFCL EV Products unlisted shares?</span>
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

                            <div class="faq-item">
                                <div class="faq-question">
                                    <span>Are GFCL EV Products unlisted shares eligible for corporate dividends and bonus shares?</span>
                                    <span class="faq-arrow">&#9662;</span>
                                </div>
                                <div class="faq-answer">
                                    <p><strong>Yes, 100%.</strong> As an unlisted equity shareholder recorded under ISIN <strong>INE0KA501014</strong> in the depository register (NSDL / CDSL), you enjoy complete shareholder rights under the Companies Act, 2013. Any corporate dividends declared by GFCL EV Products Limited are credited directly to your bank account registered with your Demat account via ECS/NEFT, and bonus shares or stock splits are credited directly into your Demat account as per corporate record dates.</p>
                                </div>
                            </div>
                        </div>
                    </div>

            </div>

            <!-- RIGHT COLUMN
"@
$h = [regex]::Replace($h, $oldFaqRegex, $newFaq)

# Sidebar Factsheet
$oldSidebarRegex = '(?s)<!-- Sidebar Card 1: Scrip Snapshot -->.*?<!-- Sidebar Card 2: Off-Market Demat Transfer -->'
$newSidebar = @"
<!-- Sidebar Card 1: Scrip Snapshot -->
                    <div class="gfclev-card sidebar-factsheet-card">
                        <div class="sidebar-scrip-badge">
                            <img src="../../assets/logos/gfcl-ev.webp" alt="GFCL EV Products Logo" class="sidebar-scrip-logo" style="max-height: 48px; object-fit: contain;">
                            <div>
                                <span class="sidebar-scrip-name">GFCL EV Products</span>
                                <span class="sidebar-scrip-isin">ISIN: INE0KA501014</span>
                            </div>
                        </div>

                        <div class="sidebar-fact-row">
                            <span class="sidebar-fact-label">Category</span>
                            <span class="sidebar-fact-val">EV Battery Materials</span>
                        </div>
                        <div class="sidebar-fact-row">
                            <span class="sidebar-fact-label">Face Value</span>
                            <span class="sidebar-fact-val">&#8377;1.00 (Rs. 1/-)</span>
                        </div>
                        <div class="sidebar-fact-row">
                            <span class="sidebar-fact-label">Incorporation</span>
                            <span class="sidebar-fact-val">2021 (INOXGFL Group)</span>
                        </div>
                        <div class="sidebar-fact-row">
                            <span class="sidebar-fact-label">Depository</span>
                            <span class="sidebar-fact-val">NSDL &amp; CDSL Demat</span>
                        </div>
                        <div class="sidebar-fact-row">
                            <span class="sidebar-fact-label">Official Website</span>
                            <span class="sidebar-fact-val">
                                <a href="https://gfclev.co.in" target="_blank" rel="noopener noreferrer" style="color: #0284c7; text-decoration: none;">gfclev.co.in &rarr;</a>
                            </span>
                        </div>

                        <button type="button" class="sidebar-copy-isin-btn" id="copy-isin-btn" onclick="copyIsinCode('INE0KA501014')" title="Click to copy ISIN">
                            <span>INE0KA501014</span>
                            <span class="copy-hint" id="copy-status-text">&#128203; Copy ISIN</span>
                        </button>
                    </div>

                    <!-- Sidebar Card 2: Off-Market Demat Transfer -->
"@
$h = [regex]::Replace($h, $oldSidebarRegex, $newSidebar)

# Sidebar peers
$oldPeersRegex = '(?s)<!-- Sidebar Card 3: Peer Comparison -->.*?<!-- Sidebar Card 4'
$newPeers = @"
<!-- Sidebar Card 3: Peer Comparison -->
                    <div class="gfclev-card sidebar-peers-card">
                        <div class="sidebar-card-head">
                            <span class="sidebar-card-icon">&#128202;</span>
                            <h3 class="sidebar-card-title">Clean Energy &amp; EV Peers</h3>
                        </div>
                        <div class="peers-list">
                            <a href="../inoxneo/inoxneo.html" class="peer-item-link">
                                <span class="peer-name">Inox Neo Energies</span>
                                <span class="peer-tag">Renewables</span>
                            </a>
                            <a href="../recyclekaro/recyclekaro.html" class="peer-item-link">
                                <span class="peer-name">Recyclekaro</span>
                                <span class="peer-tag">Battery Recycling</span>
                            </a>
                            <a href="../goldisolar/goldisolar.html" class="peer-item-link">
                                <span class="peer-name">Goldi Solar</span>
                                <span class="peer-tag">Solar Tech</span>
                            </a>
                        </div>
                    </div>

                    <!-- Sidebar Card 4
"@
$h = [regex]::Replace($h, $oldPeersRegex, $newPeers)

# CTA card desc
$h = $h.Replace("Chennai Super Kings Cricket Limited equity shares.", "GFCL EV Products Limited equity shares.")

# Bottom scripts
$h = $h.Replace('<script src="csk.js"></script>', '<script src="gfclev.js"></script>')

[System.IO.File]::WriteAllText("scripts/gfclev/gfclev.html", $h, $utf8NoBom)
Write-Host "Created scripts/gfclev/gfclev.html with 100% entity purity!"
