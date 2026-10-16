# Generator for Carrier Airconditioning & Refrigeration Ltd
$utf8NoBom = New-Object System.Text.UTF8Encoding($false)

$nayaraLines = Get-Content "scripts/nayaraenergy/nayaraenergy.html" -Encoding UTF8
$headerSnippet = ($nayaraLines[23..129] -join "`r`n")
$footerSnippet = ($nayaraLines[676..813] -join "`r`n")

$html = @"
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Carrier Aircon & Refrigeration - Unlisted Shares & Details | Meera Associates</title>
    <meta name="description" content="Explore Carrier Airconditioning & Refrigeration Ltd unlisted shares, global HVAC engineering leadership, audited reports, corporate master specifications, and ISIN INE040I01011 at Meera Associates.">
    <!-- Google Fonts: Plus Jakarta Sans -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../../styles.css">
    <link rel="stylesheet" href="../../chatbot.css">
    <link rel="icon" type="image/png" href="../../assets/meera_associates_logo.png">

    <!-- Dedicated Scoped Styling for Carrier -->
    <link rel="stylesheet" href="carrier.css">
</head>
<body>
    <!-- Mouse Light Follower -->
    <div id="mouse-light-follower"></div>

    <!-- 1. NAVIGATION HEADER -->
$headerSnippet

    <!-- 2. HIGH-IMPACT HERO COMMAND BAR -->
    <section class="carrier-hero">
        <div class="carrier-hero-container">
            <!-- Breadcrumbs -->
            <nav class="carrier-breadcrumbs" aria-label="Breadcrumb">
                <a href="../../index.html">Home</a>
                <span class="crumb-sep">/</span>
                <a href="../../unlisted-shares.html">Unlisted Shares</a>
                <span class="crumb-sep">/</span>
                <span>Carrier Aircon</span>
            </nav>

            <!-- Hero Badge -->
            <div class="carrier-hero-badge">
                <span class="pulse-dot"></span>
                Scrip #18 • Consumer &amp; Industrial HVAC Directory
            </div>

            <!-- Hero Title & Subtitle -->
            <h1 class="carrier-hero-title">Carrier Airconditioning &amp; Refrigeration Ltd</h1>
            <p class="carrier-hero-subtitle">
                World-renowned thermal engineering and intelligent climate solutions powerhouse, creating sustainable indoor environments and transport cold chains across India since 1992.
            </p>

            <!-- 4-KPI Metric Strip in Hero -->
            <div class="carrier-metrics-strip">
                <div class="metric-card">
                    <span class="metric-label">ISIN NUMBER</span>
                    <div class="metric-val">
                        <button type="button" class="isin-copy-badge" id="copy-isin-btn" title="Click to copy ISIN">
                            <span>INE040I01011</span>
                            <span class="copy-hint" id="copy-status-text">📋 Copy</span>
                        </button>
                    </div>
                    <span class="metric-sub">NSDL &amp; CDSL Demat</span>
                </div>

                <div class="metric-card">
                    <span class="metric-label">FACE VALUE</span>
                    <div class="metric-val highlight">₹10.00</div>
                    <span class="metric-sub">Per Equity Share</span>
                </div>

                <div class="metric-card">
                    <span class="metric-label">SECTOR</span>
                    <div class="metric-val">Consumer / HVAC</div>
                    <span class="metric-sub">Air Conditioning &amp; Cold Chain</span>
                </div>

                <div class="metric-card">
                    <span class="metric-label">TRADING STATUS</span>
                    <div class="metric-val status-active">Active</div>
                    <span class="metric-sub">Off-Market Demat Facilitation</span>
                </div>
            </div>
        </div>
    </section>

    <!-- 3. MAIN CONTENT BODY (2-COLUMN GRID) -->
    <main class="carrier-page-wrap">
        <div class="carrier-body-container">
            <div class="carrier-content-grid">
                
                <!-- LEFT COLUMN: Main Specifications & Corporate Details -->
                <div class="carrier-main-col">

                    <!-- Card 1: Master Corporate Specifications -->
                    <div class="carrier-card">
                        <div class="carrier-card-header">
                            <h2 class="carrier-card-title">
                                <span class="carrier-card-title-icon">🏛️</span>
                                Corporate Master Specifications
                            </h2>
                            <span class="carrier-card-tag">Statutory Profile</span>
                        </div>

                        <div class="carrier-table-responsive">
                            <table class="carrier-table">
                                <tbody>
                                    <tr>
                                        <td class="spec-label">Company Name</td>
                                        <td class="spec-value"><strong>Carrier Airconditioning &amp; Refrigeration Limited</strong></td>
                                    </tr>
                                    <tr>
                                        <td class="spec-label">Corporate Identification Number (CIN)</td>
                                        <td class="spec-value"><code>U74999HR1992PLC031612</code></td>
                                    </tr>
                                    <tr>
                                        <td class="spec-label">International Securities Identification Number (ISIN)</td>
                                        <td class="spec-value">
                                            <button type="button" class="isin-copy-badge table-isin-badge" id="table-copy-isin-btn" title="Click to copy ISIN">
                                                <span>INE040I01011</span>
                                                <span class="copy-hint" id="table-copy-status">📋 Copy</span>
                                            </button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="spec-label">Face Value (FV)</td>
                                        <td class="spec-value"><strong>Rs. 10/- per equity share</strong></td>
                                    </tr>
                                    <tr>
                                        <td class="spec-label">Date of Incorporation</td>
                                        <td class="spec-value">1992 (Over 3 decades of thermal engineering leadership)</td>
                                    </tr>
                                    <tr>
                                        <td class="spec-label">Depository Eligibility</td>
                                        <td class="spec-value">
                                            <span class="depository-badge">NSDL</span>
                                            <span class="depository-badge">CDSL</span>
                                            <span class="depository-sub">Fully Dematerialized Equity Transfer</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="spec-label">Key Promoters &amp; Parent</td>
                                        <td class="spec-value">Carrier Corporation, Delaware (Global HVAC Leader)</td>
                                    </tr>
                                    <tr>
                                        <td class="spec-label">Registered Office Address</td>
                                        <td class="spec-value">Narsingpur, Kherki Daula Post, Delhi-Jaipur Highway, Gurugram, Haryana - 122004</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <!-- Card 2: Board of Directors & Leadership -->
                    <div class="carrier-card">
                        <div class="carrier-card-header">
                            <h2 class="carrier-card-title">
                                <span class="carrier-card-title-icon">👥</span>
                                Board of Directors
                            </h2>
                            <span class="carrier-card-tag">Corporate Governance</span>
                        </div>

                        <div class="directors-grid">
                            <!-- Director 1 -->
                            <div class="director-card">
                                <div class="director-check">✓</div>
                                <div class="director-info">
                                    <span class="director-name">Mr. Sundaresan Narayanan</span>
                                    <span class="director-role">MANAGING DIRECTOR</span>
                                </div>
                            </div>

                            <!-- Director 2 -->
                            <div class="director-card">
                                <div class="director-check">✓</div>
                                <div class="director-info">
                                    <span class="director-name">Mr. Hitesh Khanna</span>
                                    <span class="director-role">WHOLE-TIME DIRECTOR</span>
                                </div>
                            </div>

                            <!-- Director 3 -->
                            <div class="director-card">
                                <div class="director-check">✓</div>
                                <div class="director-info">
                                    <span class="director-name">Mr. Pritesh Agrawal</span>
                                    <span class="director-role">CHIEF FINANCIAL OFFICER</span>
                                </div>
                            </div>

                            <!-- Director 4 -->
                            <div class="director-card">
                                <div class="director-check">✓</div>
                                <div class="director-info">
                                    <span class="director-name">Mr. Narendra Singh Sisodia</span>
                                    <span class="director-role">INDEPENDENT DIRECTOR</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Card 3: Strategic Moats & Engineering Strengths -->
                    <div class="carrier-card">
                        <div class="carrier-card-header">
                            <h2 class="carrier-card-title">
                                <span class="carrier-card-title-icon">🛡️</span>
                                Strategic Moats &amp; Thermal Engineering Edge
                            </h2>
                            <span class="carrier-card-tag">Industrial Moats</span>
                        </div>

                        <div class="moats-grid">
                            <!-- Moat 1 -->
                            <div class="moat-card">
                                <div class="moat-icon">🏆</div>
                                <h3 class="moat-title">Inventor of Modern Air Conditioning</h3>
                                <p class="moat-desc">
                                    Carries the unmatched heritage of Willis Carrier, boasting one of the world's most trusted brands in indoor climate comfort and industrial cooling.
                                </p>
                            </div>

                            <!-- Moat 2 -->
                            <div class="moat-card">
                                <div class="moat-icon">🏭</div>
                                <h3 class="moat-title">Gurugram High-Tech Manufacturing</h3>
                                <p class="moat-desc">
                                    World-class production plant along Delhi-Jaipur Highway with psychrometric test laboratories, automated assembly lines, and ISO/AHRI certifications.
                                </p>
                            </div>

                            <!-- Moat 3 -->
                            <div class="moat-card">
                                <div class="moat-icon">🚚</div>
                                <h3 class="moat-title">Carrier Transicold Transport Dominance</h3>
                                <p class="moat-desc">
                                    Dominant market share in transport refrigeration, supplying refrigeration units for refrigerated trucks, marine containers, and critical pharma cold logistics.
                                </p>
                            </div>

                            <!-- Moat 4 -->
                            <div class="moat-card">
                                <div class="moat-icon">🌱</div>
                                <h3 class="moat-title">Intelligent Building Automation (BMS)</h3>
                                <p class="moat-desc">
                                    Eco-friendly low-GWP chillers paired with Automated Logic building automation controls, drastically reducing lifecycle carbon emissions and energy bills.
                                </p>
                            </div>
                        </div>
                    </div>

                    <!-- Card 4: Products & HVAC Solutions -->
                    <div class="carrier-card">
                        <div class="carrier-card-header">
                            <h2 class="carrier-card-title">
                                <span class="carrier-card-title-icon">📦</span>
                                Climate Products &amp; Cold Chain Solutions
                            </h2>
                            <span class="carrier-card-tag">Product Portfolio</span>
                        </div>

                        <div class="subsections-tri-grid">
                            <!-- Sub-Card 1 -->
                            <div class="sub-feature-card">
                                <div class="sub-feature-head">
                                    <span class="sub-feature-icon">🏢</span>
                                    <h3 class="sub-feature-title">Applied &amp; Commercial Chillers</h3>
                                </div>
                                <ul class="sub-feature-list">
                                    <li>AquaEdge Water-Cooled Centrifugal Chillers</li>
                                    <li>AquaForce Air-Cooled Screw Chillers</li>
                                    <li>High-Efficiency Variable Refrigerant Flow (VRF)</li>
                                    <li>Air Handling Units (AHUs) &amp; Fan Coil Units (FCUs)</li>
                                </ul>
                            </div>

                            <!-- Sub-Card 2 -->
                            <div class="sub-feature-card">
                                <div class="sub-feature-head">
                                    <span class="sub-feature-icon">🏠</span>
                                    <h3 class="sub-feature-title">Light Commercial &amp; Residential</h3>
                                </div>
                                <ul class="sub-feature-list">
                                    <li>Inverter Hi-Wall Split Air Conditioners</li>
                                    <li>Cassette &amp; Ducted Split Systems</li>
                                    <li>Air Purifiers &amp; Dehumidification Systems</li>
                                    <li>Packaged Rooftop Air Conditioners</li>
                                </ul>
                            </div>

                            <!-- Sub-Card 3 -->
                            <div class="sub-feature-card">
                                <div class="sub-feature-head">
                                    <span class="sub-feature-icon">❄️</span>
                                    <h3 class="sub-feature-title">Transport &amp; Cold Chain</h3>
                                </div>
                                <ul class="sub-feature-list">
                                    <li>Carrier Transicold Truck &amp; Trailer Units</li>
                                    <li>Container Refrigeration for Maritime Shipping</li>
                                    <li>Commercial Supermarket Display Cases</li>
                                    <li>Walk-in Cold Rooms &amp; Condensing Skids</li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <!-- Card 5: News & Market Updates -->
                    <div class="carrier-card">
                        <div class="carrier-card-header">
                            <h2 class="carrier-card-title">
                                <span class="carrier-card-title-icon">📰</span>
                                News &amp; Market Developments
                            </h2>
                            <span class="carrier-card-tag">Corporate News</span>
                        </div>

                        <div class="news-cards-grid">
                            <div class="news-card" style="grid-column: 1 / -1;">
                                <div>
                                    <span class="news-card-badge">CSR &amp; Skill Development</span>
                                    <h3 class="news-card-title">Carrier India Launches Professional Skill Development Program in Collaboration with Don Bosco Technical Institute and United Way of Delhi</h3>
                                    <p class="news-card-desc">
                                        Carrier India launched an impactful vocational skill training initiative to empower Indian youth with hands-on technical training in HVAC maintenance, heating, and sustainable refrigeration technologies.
                                    </p>
                                </div>
                                <a href="https://www.carrier.com/commercial/en/in/news/news-article/carrier-india-launches-professional-skill-development-program-in-collaboration--with-don-bosco-technical-institute-and-united-way-of-delhi.html" target="_blank" rel="noopener noreferrer" class="news-link-btn">
                                    Read Article at Carrier India Official ↗
                                </a>
                            </div>
                        </div>
                    </div>

                    <!-- Card 6: Annual Reports & Statutory Disclosures -->
                    <div class="carrier-card">
                        <div class="filing-badge-card">
                            <div class="filing-badge-left">
                                <div class="filing-icon">📑</div>
                                <div>
                                    <strong style="color: #0f172a; font-size: 0.98rem; display: block;">ANNUAL REPORTS &amp; STATUTORY DISCLOSURES</strong>
                                    <span style="font-size: 0.85rem; color: #64748b;">
                                        ✓ CARRIER AIRCONDITIONING &amp; REFRIGERATION LTD — Audited annual statements, financial disclosures, and corporate governance filings.
                                    </span>
                                </div>
                            </div>
                            <a href="https://www.carrier.com/commercial/en/in/investor/" target="_blank" rel="noopener noreferrer" class="carrier-link-btn" style="font-size: 0.88rem; white-space: nowrap;">
                                View Annual Reports ↗
                            </a>
                        </div>
                    </div>

                    <!-- Card 7: Frequently Asked Questions -->
                    <div class="carrier-card">
                        <div class="carrier-card-header">
                            <h2 class="carrier-card-title">
                                <span class="carrier-card-title-icon">❓</span>
                                Frequently Asked Questions
                            </h2>
                            <span class="carrier-card-tag">Investor Intelligence</span>
                        </div>

                        <div class="faq-accordion">
                            <div class="faq-item">
                                <div class="faq-question">
                                    <span>Who is the parent company of Carrier Airconditioning &amp; Refrigeration Ltd?</span>
                                    <span class="faq-arrow">▾</span>
                                </div>
                                <div class="faq-answer">
                                    Carrier Airconditioning &amp; Refrigeration Ltd is the Indian operating arm of Carrier Corporation (Delaware, USA), a global benchmark in heating, ventilating, and air conditioning (HVAC) and refrigeration solutions.
                                </div>
                            </div>

                            <div class="faq-item">
                                <div class="faq-question">
                                    <span>What is the official ISIN and Depository status of Carrier Aircon shares?</span>
                                    <span class="faq-arrow">▾</span>
                                </div>
                                <div class="faq-answer">
                                    The official ISIN for Carrier Airconditioning &amp; Refrigeration Limited is <strong>INE040I01011</strong> with a face value of ₹10/- per equity share. The shares are fully dematerialized and eligible for settlement across both NSDL and CDSL depositories.
                                </div>
                            </div>

                            <div class="faq-item">
                                <div class="faq-question">
                                    <span>What sectors drive demand for Carrier's systems in India?</span>
                                    <span class="faq-arrow">▾</span>
                                </div>
                                <div class="faq-answer">
                                    Demand is driven by rapid commercial real estate expansion, data center cooling requirements, smart cities, airport modernizations, pharmaceutical cold chains, and residential premium inverter AC adoption.
                                </div>
                            </div>

                            <div class="faq-item">
                                <div class="faq-question">
                                    <span>How are transactions in Carrier unlisted shares executed?</span>
                                    <span class="faq-arrow">▾</span>
                                </div>
                                <div class="faq-answer">
                                    Transactions are executed via compliant off-market depository transfers between buyer and seller Demat accounts via DIS slips or online CDSL Easiest / NSDL Speed-e, with strict Client Master Report (CMR) verification and bank settlement.
                                </div>
                            </div>

                            <div class="faq-item">
                                <div class="faq-question">
                                    <span>Does Carrier India distribute dividends to shareholders?</span>
                                    <span class="faq-arrow">▾</span>
                                </div>
                                <div class="faq-answer">
                                    Carrier India maintains strong free cash flow generation and prudent capital allocation, historically maintaining dividend declarations in line with board approvals and corporate performance.
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

                <!-- RIGHT COLUMN: Action Desk & Corporate Sidebar -->
                <div class="carrier-sidebar-col">

                    <!-- 1. Corporate Identity Badge Card -->
                    <div class="sidebar-brand-card">
                        <div class="sidebar-logo-box">
                            <img src="../../assets/logos/carrier.png" alt="Carrier Logo" class="sidebar-logo-img">
                        </div>
                        <div class="sidebar-brand-meta">
                            <span class="sidebar-scrip-tag">CARRIER AIRCON UNLISTED</span>
                            <span class="sidebar-sec-tag">HVAC, Air Conditioning &amp; Cold Chain</span>
                        </div>
                        <a href="https://www.carrier.com/commercial/en/in/" target="_blank" rel="noopener noreferrer" class="sidebar-btn-web">
                            <span>🌐 Visit Official Website</span>
                            <span>↗</span>
                        </a>
                    </div>

                    <!-- 2. Direct Investor Execution Desk -->
                    <div class="sidebar-trade-card">
                        <div class="sidebar-trade-badge">DIRECT EXECUTION DESK</div>
                        <h3 class="sidebar-trade-title">Trade Carrier Aircon Shares</h3>
                        <p class="sidebar-trade-desc">
                            Connect directly with our institutional investment desk for verified share lots, current transaction quotes, and off-market settlement assistance.
                        </p>

                        <div class="sidebar-actions-stack">
                            <a href="https://wa.me/919324546516?text=Hi%2C%20I%20am%20interested%20in%20buying%20or%20selling%20Carrier%20Aircon%20unlisted%20shares.%20Please%20share%20current%20rates%20and%20procedure." target="_blank" rel="noopener noreferrer" class="sidebar-btn-wa">
                                <span class="btn-icon">💬</span>
                                <div class="btn-text-wrap">
                                    <span class="btn-lead">WhatsApp Institutional Desk</span>
                                    <span class="btn-sub">+91 93245 46516</span>
                                </div>
                            </a>

                            <a href="tel:+919324546516" class="sidebar-btn-call">
                                <span class="btn-icon">📞</span>
                                <div class="btn-text-wrap">
                                    <span class="btn-lead">Direct Phone Consultation</span>
                                    <span class="btn-sub">Speak with Private Equity Team</span>
                                </div>
                            </a>
                        </div>

                        <div class="sidebar-trust-bullets">
                            <div class="trust-bullet">
                                <span class="trust-check">✓</span>
                                <span>Zero Counterparty Risk with CMR Verification</span>
                            </div>
                            <div class="trust-bullet">
                                <span class="trust-check">✓</span>
                                <span>Seamless NSDL &amp; CDSL Off-Market Credit</span>
                            </div>
                            <div class="trust-bullet">
                                <span class="trust-check">✓</span>
                                <span>Four Decades of Industry Trust (Since 1985)</span>
                            </div>
                        </div>
                    </div>

                    <!-- 3. Depository & Statutory Profile Card -->
                    <div class="sidebar-compliance-card">
                        <div class="compliance-head">
                            <span class="compliance-icon">⚖️</span>
                            <h4 class="compliance-title">Depository &amp; Custody Profile</h4>
                        </div>
                        <ul class="compliance-list">
                            <li>
                                <span class="comp-label">Demat Mode</span>
                                <span class="comp-val">NSDL &amp; CDSL</span>
                            </li>
                            <li>
                                <span class="comp-label">Settlement Cycle</span>
                                <span class="comp-val">T+1 / T+2 Off-Market</span>
                            </li>
                            <li>
                                <span class="comp-label">Transfer Mechanism</span>
                                <span class="comp-val">DIS Slip / Speed-e</span>
                            </li>
                            <li>
                                <span class="comp-label">Stamp Duty</span>
                                <span class="comp-val">Compliant 0.015%</span>
                            </li>
                            <li>
                                <span class="comp-label">Mandatory KYC</span>
                                <span class="comp-val">PAN + CMR Demat</span>
                            </li>
                        </ul>
                    </div>

                    <!-- 4. Sector Peer Equities -->
                    <div class="sidebar-peers-card">
                        <div class="peers-head">
                            <span class="peers-icon">🏢</span>
                            <h4 class="peers-title">Manufacturing &amp; HVAC Peers</h4>
                        </div>
                        <div class="peers-links">
                            <a href="../frickindia/frickindia.html" class="peer-link-item">
                                <span class="peer-name">Frick India Limited</span>
                                <span class="peer-arrow">↗</span>
                            </a>
                            <a href="../anugrahavalve/anugrahavalve.html" class="peer-link-item">
                                <span class="peer-name">Anugraha Valve Castings</span>
                                <span class="peer-arrow">↗</span>
                            </a>
                            <a href="../inoxairproducts/inoxairproducts.html" class="peer-link-item">
                                <span class="peer-name">Inox Air Products</span>
                                <span class="peer-arrow">↗</span>
                            </a>
                            <a href="../eiffilwater/eiffilwater.html" class="peer-link-item">
                                <span class="peer-name">Eiffil Water Systems</span>
                                <span class="peer-arrow">↗</span>
                            </a>
                        </div>
                    </div>

                </div>

            </div>
        </div>
    </main>

    <!-- 4. CANONICAL FOOTER -->
$footerSnippet

    <!-- Dedicated Script for Carrier -->
    <script src="carrier.js"></script>

    <!-- Global Interactive Scripts -->
    <script src="../../script.js"></script>
    <script src="../../chatbot-kb.js"></script>
    <script src="../../chatbot.js"></script>
</body>
</html>
"@

[System.IO.File]::WriteAllText((Join-Path (Get-Location).Path "scripts/carrier/carrier.html"), $html, $utf8NoBom)
Write-Host "Generated: scripts/carrier/carrier.html"
