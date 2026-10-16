# Generator for Frick India Limited
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
    <title>Frick India Limited - Unlisted Shares & Details | Meera Associates</title>
    <meta name="description" content="Explore Frick India Limited unlisted shares, corporate master specifications, audited financial trajectory, board of directors, industrial refrigeration leadership, and ISIN INE499C01012 at Meera Associates.">
    <!-- Google Fonts: Plus Jakarta Sans -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../../styles.css">
    <link rel="stylesheet" href="../../chatbot.css">
    <link rel="icon" type="image/png" href="../../assets/meera_associates_logo.png">

    <!-- Dedicated Scoped Styling for Frick India -->
    <link rel="stylesheet" href="frickindia.css">
</head>
<body>
    <!-- Mouse Light Follower -->
    <div id="mouse-light-follower"></div>

    <!-- 1. NAVIGATION HEADER -->
$headerSnippet

    <!-- 2. HIGH-IMPACT HERO COMMAND BAR -->
    <section class="frick-hero">
        <div class="frick-hero-container">
            <!-- Breadcrumbs -->
            <nav class="frick-breadcrumbs" aria-label="Breadcrumb">
                <a href="../../index.html">Home</a>
                <span class="crumb-sep">/</span>
                <a href="../../unlisted-shares.html">Unlisted Shares</a>
                <span class="crumb-sep">/</span>
                <span>Frick India</span>
            </nav>

            <!-- Hero Badge -->
            <div class="frick-hero-badge">
                <span class="pulse-dot"></span>
                Scrip #15 • Manufacturing Directory
            </div>

            <!-- Hero Title & Subtitle -->
            <h1 class="frick-hero-title">Frick India Limited</h1>
            <p class="frick-hero-subtitle">
                Pioneer and undisputed market leader in industrial refrigeration and cold chain infrastructure across India, operating with precision manufacturing engineering since 1962.
            </p>

            <!-- 4-KPI Metric Strip in Hero -->
            <div class="frick-metrics-strip">
                <div class="metric-card">
                    <span class="metric-label">ISIN NUMBER</span>
                    <div class="metric-val">
                        <button type="button" class="isin-copy-badge" id="copy-isin-btn" title="Click to copy ISIN">
                            <span>INE499C01012</span>
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
                    <div class="metric-val">Manufacturing</div>
                    <span class="metric-sub">Industrial Refrigeration Equip.</span>
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
    <main class="frick-page-wrap">
        <div class="frick-body-container">
            <div class="frick-content-grid">
                
                <!-- LEFT COLUMN: Main Specifications & Corporate Details -->
                <div class="frick-main-col">

                    <!-- Card 1: Master Corporate Specifications -->
                    <div class="frick-card">
                        <div class="frick-card-header">
                            <h2 class="frick-card-title">
                                <span class="frick-card-title-icon">🏛️</span>
                                Corporate Master Specifications
                            </h2>
                            <span class="frick-card-tag">Statutory Profile</span>
                        </div>

                        <div class="frick-table-responsive">
                            <table class="frick-table">
                                <tbody>
                                    <tr>
                                        <td class="spec-label">Company Name</td>
                                        <td class="spec-value"><strong>Frick India Limited</strong></td>
                                    </tr>
                                    <tr>
                                        <td class="spec-label">Corporate Identification Number (CIN)</td>
                                        <td class="spec-value"><code>L74899DL1962PLC003807</code></td>
                                    </tr>
                                    <tr>
                                        <td class="spec-label">International Securities Identification Number (ISIN)</td>
                                        <td class="spec-value">
                                            <button type="button" class="isin-copy-badge table-isin-badge" id="table-copy-isin-btn" title="Click to copy ISIN">
                                                <span>INE499C01012</span>
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
                                        <td class="spec-value">1962 (Over 6 decades of precision industrial refrigeration)</td>
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
                                        <td class="spec-label">Key Promoters &amp; Management</td>
                                        <td class="spec-value">Mr. Jasmohan Singh</td>
                                    </tr>
                                    <tr>
                                        <td class="spec-label">Registered Office Address</td>
                                        <td class="spec-value">809, Surya Kiran, 19 K.G. Marg, New Delhi 110 001</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <!-- Card 2: Board of Directors & Leadership -->
                    <div class="frick-card">
                        <div class="frick-card-header">
                            <h2 class="frick-card-title">
                                <span class="frick-card-title-icon">👥</span>
                                Board of Directors
                            </h2>
                            <span class="frick-card-tag">Corporate Governance</span>
                        </div>

                        <div class="directors-grid">
                            <!-- Director 1 -->
                            <div class="director-card">
                                <div class="director-check">✓</div>
                                <div class="director-info">
                                    <span class="director-name">Mr. Jasmohan Singh</span>
                                    <span class="director-role">MANAGING DIRECTOR</span>
                                </div>
                            </div>

                            <!-- Director 2 -->
                            <div class="director-card">
                                <div class="director-check">✓</div>
                                <div class="director-info">
                                    <span class="director-name">Ms. Jasleen Kaur</span>
                                    <span class="director-role">NON-EXECUTIVE DIRECTOR</span>
                                </div>
                            </div>

                            <!-- Director 3 -->
                            <div class="director-card">
                                <div class="director-check">✓</div>
                                <div class="director-info">
                                    <span class="director-name">CA. Mahendra Kumar Doogar</span>
                                    <span class="director-role">INDEPENDENT-DIRECTOR</span>
                                </div>
                            </div>

                            <!-- Director 4 -->
                            <div class="director-card">
                                <div class="director-check">✓</div>
                                <div class="director-info">
                                    <span class="director-name">Ms. Gurleen Kaur</span>
                                    <span class="director-role">NON-EXECUTIVE DIRECTOR</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Card 3: Strategic Moats & Engineering Strengths -->
                    <div class="frick-card">
                        <div class="frick-card-header">
                            <h2 class="frick-card-title">
                                <span class="frick-card-title-icon">🛡️</span>
                                Strategic Moats &amp; Cold Chain Leadership
                            </h2>
                            <span class="frick-card-tag">Industrial Moats</span>
                        </div>

                        <div class="moats-grid">
                            <!-- Moat 1 -->
                            <div class="moat-card">
                                <div class="moat-icon">❄️</div>
                                <h3 class="moat-title">60+ Years Cold Chain Dominance</h3>
                                <p class="moat-desc">
                                    Established pioneer in high-capacity rotary screw and reciprocating industrial refrigeration compressors trusted across India's largest food and pharma processors.
                                </p>
                            </div>

                            <!-- Moat 2 -->
                            <div class="moat-card">
                                <div class="moat-icon">🏭</div>
                                <h3 class="moat-title">Integrated 22-Acre Faridabad Plant</h3>
                                <p class="moat-desc">
                                    Comprehensive engineering infrastructure featuring dedicated captive foundries, heavy CNC machining centers, automated welding bays, and rigorous pressure test facilities.
                                </p>
                            </div>

                            <!-- Moat 3 -->
                            <div class="moat-card">
                                <div class="moat-icon">⚙️</div>
                                <h3 class="moat-title">Turnkey Cold Storage EPC</h3>
                                <p class="moat-desc">
                                    Full turnkey engineering from fruit &amp; vegetable controlled-atmosphere (CA) packhouses to dairy chilling centers, frozen seafood processing, and vaccine cold rooms.
                                </p>
                            </div>

                            <!-- Moat 4 -->
                            <div class="moat-card">
                                <div class="moat-icon">🌍</div>
                                <h3 class="moat-title">Global Export Reach (50+ Countries)</h3>
                                <p class="moat-desc">
                                    ASME and ISO certified engineering systems exported to over 50 countries across the Middle East, Southeast Asia, Africa, and North America.
                                </p>
                            </div>
                        </div>
                    </div>

                    <!-- Card 4: Products & Industrial Solutions -->
                    <div class="frick-card">
                        <div class="frick-card-header">
                            <h2 class="frick-card-title">
                                <span class="frick-card-title-icon">📦</span>
                                Products &amp; Cold Chain Verticals
                            </h2>
                            <span class="frick-card-tag">Core Offerings</span>
                        </div>

                        <div class="subsections-tri-grid">
                            <!-- Sub-Card 1 -->
                            <div class="sub-feature-card">
                                <div class="sub-feature-head">
                                    <span class="sub-feature-icon">🌀</span>
                                    <h3 class="sub-feature-title">Refrigeration Compressors</h3>
                                </div>
                                <ul class="sub-feature-list">
                                    <li>Rotary Twin Screw Compressor Packages</li>
                                    <li>High-Speed Multi-Cylinder Reciprocating Units</li>
                                    <li>Ammonia &amp; Eco-Friendly Freon Compressors</li>
                                    <li>Two-Stage Booster Compressor Systems</li>
                                </ul>
                            </div>

                            <!-- Sub-Card 2 -->
                            <div class="sub-feature-card">
                                <div class="sub-feature-head">
                                    <span class="sub-feature-icon">❄️</span>
                                    <h3 class="sub-feature-title">Air Cooling &amp; Freezers</h3>
                                </div>
                                <ul class="sub-feature-list">
                                    <li>Industrial Air Handling Units (AHUs)</li>
                                    <li>IQF (Individually Quick Frozen) Tunnel Freezers</li>
                                    <li>Heavy Evaporative Condensers &amp; Chillers</li>
                                    <li>Plate Freezers for Meat &amp; Seafood</li>
                                </ul>
                            </div>

                            <!-- Sub-Card 3 -->
                            <div class="sub-feature-card">
                                <div class="sub-feature-head">
                                    <span class="sub-feature-icon">🥛</span>
                                    <h3 class="sub-feature-title">Dairy &amp; Agro Cold Chain</h3>
                                </div>
                                <ul class="sub-feature-list">
                                    <li>Turnkey Controlled Atmosphere (CA) Stores</li>
                                    <li>Bulk Milk Chillers &amp; Silo Cooling Systems</li>
                                    <li>Pharma Clean-Room HVAC &amp; Cold Storage</li>
                                    <li>Beverage &amp; Brewery Refrigeration Plants</li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <!-- Card 5: Interactive Financial Trajectory (NO <table> tags) -->
                    <div class="frick-card" id="frick-fin-graph-container">
                        <div class="frick-card-header">
                            <h2 class="frick-card-title">
                                <span class="frick-card-title-icon">📊</span>
                                Audited Financial Performance &amp; Trajectory
                            </h2>
                            <span class="frick-card-tag">Interactive Analytics</span>
                        </div>

                        <!-- 4 High-Impact KPI Glance Cards -->
                        <div class="fin-kpi-summary-grid">
                            <div class="fin-kpi-card">
                                <div class="fin-kpi-header">
                                    <span class="fin-kpi-title">Revenue (FY26)</span>
                                    <span class="fin-kpi-badge">Audited</span>
                                </div>
                                <div class="fin-kpi-val">₹47,653 L</div>
                                <div class="fin-kpi-sub">
                                    <span class="fin-pill-growth positive">₹476.53 Cr</span>
                                    <span>FY 2025-26</span>
                                </div>
                            </div>

                            <div class="fin-kpi-card">
                                <div class="fin-kpi-header">
                                    <span class="fin-kpi-title">Operating EBITDA</span>
                                    <span class="fin-kpi-badge">Operating Core</span>
                                </div>
                                <div class="fin-kpi-val">₹3,526.78 L</div>
                                <div class="fin-kpi-sub">
                                    <span class="fin-pill-growth positive">₹35.27 Cr</span>
                                    <span>7.40% Margin</span>
                                </div>
                            </div>

                            <div class="fin-kpi-card">
                                <div class="fin-kpi-header">
                                    <span class="fin-kpi-title">PAT (Net Profit)</span>
                                    <span class="fin-kpi-badge">After Tax</span>
                                </div>
                                <div class="fin-kpi-val">₹2,022.00 L</div>
                                <div class="fin-kpi-sub">
                                    <span class="fin-pill-growth positive">₹20.22 Cr</span>
                                    <span>Positive Earnings</span>
                                </div>
                            </div>

                            <div class="fin-kpi-card">
                                <div class="fin-kpi-header">
                                    <span class="fin-kpi-title">Diluted EPS</span>
                                    <span class="fin-kpi-badge">Per Share</span>
                                </div>
                                <div class="fin-kpi-val">₹33.71</div>
                                <div class="fin-kpi-sub">
                                    <span class="fin-pill-growth positive">Per Equity Share</span>
                                    <span>FV ₹10/-</span>
                                </div>
                            </div>
                        </div>

                        <!-- Chart Controls Bar -->
                        <div class="fin-controls-bar">
                            <div class="fin-metric-tabs">
                                <button type="button" class="fin-metric-tab active" data-metric="all">📊 All Metrics</button>
                                <button type="button" class="fin-metric-tab" data-metric="revenue">📈 Revenue</button>
                                <button type="button" class="fin-metric-tab" data-metric="ebitda">⚡ EBITDA</button>
                                <button type="button" class="fin-metric-tab" data-metric="pat">💰 PAT</button>
                                <button type="button" class="fin-metric-tab" data-metric="eps">🎯 EPS</button>
                            </div>
                            <div class="fin-type-toggle">
                                <button type="button" class="fin-type-btn active" data-type="bar" title="Bar Chart View">📊 Bar</button>
                                <button type="button" class="fin-type-btn" data-type="line" title="Line Chart View">📈 Line</button>
                            </div>
                        </div>

                        <!-- Canvas Visualization Area -->
                        <div class="fin-chart-canvas-wrapper" style="margin-bottom: 0;">
                            <canvas id="frick-fin-canvas"></canvas>
                        </div>
                    </div>

                    <!-- Card 6: Annual Reports & Statutory Disclosures -->
                    <div class="frick-card">
                        <div class="filing-badge-card">
                            <div class="filing-badge-left">
                                <div class="filing-icon">📑</div>
                                <div>
                                    <strong style="color: #0f172a; font-size: 0.98rem; display: block;">ANNUAL REPORTS &amp; STATUTORY DISCLOSURES</strong>
                                    <span style="font-size: 0.85rem; color: #64748b;">
                                        ✓ FRICK INDIA LIMITED — Audited financial reports, balance sheets, profit &amp; loss statements, and corporate governance filings.
                                    </span>
                                </div>
                            </div>
                            <a href="https://frickweb.com/investors-relation/" target="_blank" rel="noopener noreferrer" class="frick-link-btn" style="font-size: 0.88rem; white-space: nowrap;">
                                View Annual Reports ↗
                            </a>
                        </div>
                    </div>

                    <!-- Card 7: Frequently Asked Questions -->
                    <div class="frick-card">
                        <div class="frick-card-header">
                            <h2 class="frick-card-title">
                                <span class="frick-card-title-icon">❓</span>
                                Frequently Asked Questions
                            </h2>
                            <span class="frick-card-tag">Investor Intelligence</span>
                        </div>

                        <div class="faq-accordion">
                            <div class="faq-item">
                                <div class="faq-question">
                                    <span>What is the core business of Frick India Limited?</span>
                                    <span class="faq-arrow">▾</span>
                                </div>
                                <div class="faq-answer">
                                    Frick India Limited is India's pioneer manufacturer of industrial refrigeration equipment, screw and reciprocating compressors, food freezing systems, and turnkey cold chain infrastructure, catering to food processing, dairy, pharma, and agro-industries.
                                </div>
                            </div>

                            <div class="faq-item">
                                <div class="faq-question">
                                    <span>What is the official ISIN and Depository status of Frick India shares?</span>
                                    <span class="faq-arrow">▾</span>
                                </div>
                                <div class="faq-answer">
                                    The official ISIN for Frick India Limited is <strong>INE499C01012</strong> with a face value of ₹10/- per equity share. The shares are fully dematerialized and eligible for settlement across both NSDL and CDSL depositories.
                                </div>
                            </div>

                            <div class="faq-item">
                                <div class="faq-question">
                                    <span>What are the key drivers for Frick India's growth and profitability?</span>
                                    <span class="faq-arrow">▾</span>
                                </div>
                                <div class="faq-answer">
                                    Key drivers include massive nationwide expansion in cold storage subsidies under PM Krishi Sinchayee Yojana, rising demand for temperature-controlled logistics, expansion of dairy processing capacities, and steady export orders to 50+ countries.
                                </div>
                            </div>

                            <div class="faq-item">
                                <div class="faq-question">
                                    <span>How are transactions in Frick India unlisted shares settled?</span>
                                    <span class="faq-arrow">▾</span>
                                </div>
                                <div class="faq-answer">
                                    Transactions are executed through compliant off-market depository transfers between buyer and seller Demat accounts via DIS slips or online CDSL Easiest / NSDL Speed-e, with strict Client Master Report (CMR) verification and bank settlement.
                                </div>
                            </div>

                            <div class="faq-item">
                                <div class="faq-question">
                                    <span>What is the historical performance track record of Frick India?</span>
                                    <span class="faq-arrow">▾</span>
                                </div>
                                <div class="faq-answer">
                                    Incorporated in 1962, Frick India has maintained consistent dividend-paying status, zero long-term funded debt risk, high return on capital employed, and substantial manufacturing asset backing at its 22-acre Faridabad complex.
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

                <!-- RIGHT COLUMN: Action Desk & Corporate Sidebar -->
                <div class="frick-sidebar-col">

                    <!-- 1. Corporate Identity Badge Card -->
                    <div class="sidebar-brand-card">
                        <div class="sidebar-logo-box">
                            <img src="../../assets/logos/frick-india.png" alt="Frick India Logo" class="sidebar-logo-img">
                        </div>
                        <div class="sidebar-brand-meta">
                            <span class="sidebar-scrip-tag">FRICK INDIA UNLISTED SHARES</span>
                            <span class="sidebar-sec-tag">Industrial Refrigeration &amp; Cold Chain</span>
                        </div>
                        <a href="https://frickweb.com" target="_blank" rel="noopener noreferrer" class="sidebar-btn-web">
                            <span>🌐 Visit Official Website</span>
                            <span>↗</span>
                        </a>
                    </div>

                    <!-- 2. Direct Investor Execution Desk -->
                    <div class="sidebar-trade-card">
                        <div class="sidebar-trade-badge">DIRECT EXECUTION DESK</div>
                        <h3 class="sidebar-trade-title">Trade Frick India Unlisted Shares</h3>
                        <p class="sidebar-trade-desc">
                            Connect directly with our institutional investment desk for verified share lots, current transaction quotes, and off-market settlement assistance.
                        </p>

                        <div class="sidebar-actions-stack">
                            <a href="https://wa.me/919324546516?text=Hi%2C%20I%20am%20interested%20in%20buying%20or%20selling%20Frick%20India%20unlisted%20shares.%20Please%20share%20current%20rates%20and%20procedure." target="_blank" rel="noopener noreferrer" class="sidebar-btn-wa">
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
                            <span class="peers-icon">🏭</span>
                            <h4 class="peers-title">Manufacturing Peers</h4>
                        </div>
                        <div class="peers-links">
                            <a href="../anugrahavalve/anugrahavalve.html" class="peer-link-item">
                                <span class="peer-name">Anugraha Valve Castings</span>
                                <span class="peer-arrow">↗</span>
                            </a>
                            <a href="../carrier/carrier.html" class="peer-link-item">
                                <span class="peer-name">Carrier Aircon &amp; Refrigeration</span>
                                <span class="peer-arrow">↗</span>
                            </a>
                            <a href="../inoxairproducts/inoxairproducts.html" class="peer-link-item">
                                <span class="peer-name">Inox Air Products</span>
                                <span class="peer-arrow">↗</span>
                            </a>
                            <a href="../goashipyard/goashipyard.html" class="peer-link-item">
                                <span class="peer-name">Goa Shipyard Limited</span>
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

    <!-- Financial Charts Dependencies -->
    <script src="../../assets/chart.min.js"></script>
    <script src="../../assets/financial-charts.js"></script>

    <!-- Dedicated Script for Frick India -->
    <script src="frickindia.js"></script>

    <!-- Global Interactive Scripts -->
    <script src="../../script.js"></script>
    <script src="../../chatbot-kb.js"></script>
    <script src="../../chatbot.js"></script>
</body>
</html>
"@

[System.IO.File]::WriteAllText((Join-Path (Get-Location).Path "scripts/frickindia/frickindia.html"), $html, $utf8NoBom)
Write-Host "Generated: scripts/frickindia/frickindia.html"
