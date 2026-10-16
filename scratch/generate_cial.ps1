# Generator for Cochin International Airport Ltd. (CIAL)
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
    <title>Cochin International Airport (CIAL) - Unlisted Shares & Details | Meera Associates</title>
    <meta name="description" content="Explore Cochin International Airport Ltd (CIAL) unlisted shares, world's first 100% solar-powered airport, audited financials, corporate specifications, and ISIN INE02KH01019 at Meera Associates.">
    <!-- Google Fonts: Plus Jakarta Sans -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../../styles.css">
    <link rel="stylesheet" href="../../chatbot.css">
    <link rel="icon" type="image/png" href="../../assets/meera_associates_logo.png">

    <!-- Dedicated Scoped Styling for CIAL -->
    <link rel="stylesheet" href="cial.css">
</head>
<body>
    <!-- Mouse Light Follower -->
    <div id="mouse-light-follower"></div>

    <!-- 1. NAVIGATION HEADER -->
$headerSnippet

    <!-- 2. HIGH-IMPACT HERO COMMAND BAR -->
    <section class="cial-hero">
        <div class="cial-hero-container">
            <!-- Breadcrumbs -->
            <nav class="cial-breadcrumbs" aria-label="Breadcrumb">
                <a href="../../index.html">Home</a>
                <span class="crumb-sep">/</span>
                <a href="../../unlisted-shares.html">Unlisted Shares</a>
                <span class="crumb-sep">/</span>
                <span>CIAL</span>
            </nav>

            <!-- Hero Badge -->
            <div class="cial-hero-badge">
                <span class="pulse-dot"></span>
                Scrip #19 • Infrastructure &amp; Aviation Directory
            </div>

            <!-- Hero Title & Subtitle -->
            <h1 class="cial-hero-title">Cochin International Airport Ltd. (CIAL)</h1>
            <p class="cial-hero-subtitle">
                Pioneering public-private partnership airport infrastructure and the world's first fully solar-powered green airport, driving aviation excellence since 1994.
            </p>

            <!-- 4-KPI Metric Strip in Hero -->
            <div class="cial-metrics-strip">
                <div class="metric-card">
                    <span class="metric-label">ISIN NUMBER</span>
                    <div class="metric-val">
                        <button type="button" class="isin-copy-badge" id="copy-isin-btn" title="Click to copy ISIN">
                            <span>INE02KH01019</span>
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
                    <div class="metric-val">Infrastructure</div>
                    <span class="metric-sub">Airport Ops &amp; Green IPP</span>
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
    <main class="cial-page-wrap">
        <div class="cial-body-container">
            <div class="cial-content-grid">
                
                <!-- LEFT COLUMN: Main Specifications & Corporate Details -->
                <div class="cial-main-col">

                    <!-- Card 1: Master Corporate Specifications -->
                    <div class="cial-card">
                        <div class="cial-card-header">
                            <h2 class="cial-card-title">
                                <span class="cial-card-title-icon">🏛️</span>
                                Corporate Master Specifications
                            </h2>
                            <span class="cial-card-tag">Statutory Profile</span>
                        </div>

                        <div class="cial-table-responsive">
                            <table class="cial-table">
                                <tbody>
                                    <tr>
                                        <td class="spec-label">Company Name</td>
                                        <td class="spec-value"><strong>Cochin International Airport Limited (CIAL)</strong></td>
                                    </tr>
                                    <tr>
                                        <td class="spec-label">Corporate Identification Number (CIN)</td>
                                        <td class="spec-value"><code>U63033KL1994PLC007803</code></td>
                                    </tr>
                                    <tr>
                                        <td class="spec-label">International Securities Identification Number (ISIN)</td>
                                        <td class="spec-value">
                                            <button type="button" class="isin-copy-badge table-isin-badge" id="table-copy-isin-btn" title="Click to copy ISIN">
                                                <span>INE02KH01019</span>
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
                                        <td class="spec-value">1994 (India's First Public-Private Partnership Airport)</td>
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
                                        <td class="spec-label">Key Promoters &amp; Ownership</td>
                                        <td class="spec-value">Government of Kerala &amp; NRI Shareholders / George Nereaparam Vareed</td>
                                    </tr>
                                    <tr>
                                        <td class="spec-label">Registered Office Address</td>
                                        <td class="spec-value">Room No. 35, 4th Floor, GCDA Commercial Complex, Marine Drive, Cochin - 682031</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <!-- Card 2: Board of Directors & Leadership -->
                    <div class="cial-card">
                        <div class="cial-card-header">
                            <h2 class="cial-card-title">
                                <span class="cial-card-title-icon">👥</span>
                                Board of Directors
                            </h2>
                            <span class="cial-card-tag">Corporate Governance</span>
                        </div>

                        <div class="directors-grid">
                            <!-- Director 1 -->
                            <div class="director-card">
                                <div class="director-check">✓</div>
                                <div class="director-info">
                                    <span class="director-name">Shri. Pinarayi Vijayan</span>
                                    <span class="director-role">CHIEF MINISTER OF KERALA &amp; CHAIRMAN</span>
                                </div>
                            </div>

                            <!-- Director 2 -->
                            <div class="director-card">
                                <div class="director-check">✓</div>
                                <div class="director-info">
                                    <span class="director-name">Shri. P. Rajeeve</span>
                                    <span class="director-role">MINISTER FOR LAW, INDUSTRIES &amp; COIR &amp; DIRECTOR</span>
                                </div>
                            </div>

                            <!-- Director 3 -->
                            <div class="director-card">
                                <div class="director-check">✓</div>
                                <div class="director-info">
                                    <span class="director-name">Shri. K. Rajan</span>
                                    <span class="director-role">MINISTER FOR REVENUE &amp; HOUSING &amp; DIRECTOR</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Card 3: Strategic Moats & Sustainability Architecture -->
                    <div class="cial-card">
                        <div class="cial-card-header">
                            <h2 class="cial-card-title">
                                <span class="cial-card-title-icon">🛡️</span>
                                Strategic Moats &amp; Aviation Moats
                            </h2>
                            <span class="cial-card-tag">Infrastructure Moats</span>
                        </div>

                        <div class="moats-grid">
                            <!-- Moat 1 -->
                            <div class="moat-card">
                                <div class="moat-icon">☀️</div>
                                <h3 class="moat-title">World's 1st Fully Solar-Powered Airport</h3>
                                <p class="moat-desc">
                                    Awarded the prestigious UN Champion of the Earth accolade; produces over 250,000 units of clean electricity daily from dedicated 50 MWp+ solar power plants.
                                </p>
                            </div>

                            <!-- Moat 2 -->
                            <div class="moat-card">
                                <div class="moat-icon">✈️</div>
                                <h3 class="moat-title">Primary Aviation Gateway to Kerala</h3>
                                <p class="moat-desc">
                                    Handles over 10 million passengers annually with dense direct flight connectivity across the Middle East, Europe, Southeast Asia, and major Indian metros.
                                </p>
                            </div>

                            <!-- Moat 3 -->
                            <div class="moat-card">
                                <div class="moat-icon">🛍️</div>
                                <h3 class="moat-title">High-Margin Non-Aero Cash Flows</h3>
                                <p class="moat-desc">
                                    Robust commercial monetization from duty-free retail, aviation fueling stations, hospitality concessions, luxury lounges, and aviation maintenance hangars.
                                </p>
                            </div>

                            <!-- Moat 4 -->
                            <div class="moat-card">
                                <div class="moat-icon">💰</div>
                                <h3 class="moat-title">Debt-Free Profile &amp; Regular Dividends</h3>
                                <p class="moat-desc">
                                    One of the very few airport companies in India with exceptional return ratios, zero funded debt stress, and an uninterrupted multi-decade dividend payout history.
                                </p>
                            </div>
                        </div>
                    </div>

                    <!-- Card 4: Products & Aviation Verticals -->
                    <div class="cial-card">
                        <div class="cial-card-header">
                            <h2 class="cial-card-title">
                                <span class="cial-card-title-icon">📦</span>
                                Aviation Verticals &amp; Commercial Solutions
                            </h2>
                            <span class="cial-card-tag">Aviation Operations</span>
                        </div>

                        <div class="subsections-tri-grid">
                            <!-- Sub-Card 1 -->
                            <div class="sub-feature-card">
                                <div class="sub-feature-head">
                                    <span class="sub-feature-icon">🛫</span>
                                    <h3 class="sub-feature-title">Passenger Terminals</h3>
                                </div>
                                <ul class="sub-feature-list">
                                    <li>Terminal T3 International Terminal Complex</li>
                                    <li>Terminal T1 Modern Domestic Terminal</li>
                                    <li>0407 Business Jet Terminal (VVIP Lounge)</li>
                                    <li>Multi-Level Parking &amp; Smart Transit Hubs</li>
                                </ul>
                            </div>

                            <!-- Sub-Card 2 -->
                            <div class="sub-feature-card">
                                <div class="sub-feature-head">
                                    <span class="sub-feature-icon">📦</span>
                                    <h3 class="sub-feature-title">Air Cargo Logistics</h3>
                                </div>
                                <ul class="sub-feature-list">
                                    <li>Perishable Cargo Center of Excellence (CEPC)</li>
                                    <li>Bonded International Freight Station</li>
                                    <li>Temperature-Controlled Pharma Logistics</li>
                                    <li>Domestic Courier &amp; Heavy Cargo Bays</li>
                                </ul>
                            </div>

                            <!-- Sub-Card 3 -->
                            <div class="sub-feature-card">
                                <div class="sub-feature-head">
                                    <span class="sub-feature-icon">⚡</span>
                                    <h3 class="sub-feature-title">Green Energy &amp; MRO</h3>
                                </div>
                                <ul class="sub-feature-list">
                                    <li>Captive &amp; Commercial Solar IPP Power</li>
                                    <li>Green Hydrogen Plant Pilot Project</li>
                                    <li>Aircraft MRO Maintenance &amp; Hangars</li>
                                    <li>Duty-Free Retail &amp; Food &amp; Beverage</li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <!-- Card 5: Interactive Financial Trajectory (NO <table> tags) -->
                    <div class="cial-card" id="cial-fin-graph-container">
                        <div class="cial-card-header">
                            <h2 class="cial-card-title">
                                <span class="cial-card-title-icon">📊</span>
                                Audited Financial Performance &amp; Trajectory
                            </h2>
                            <span class="cial-card-tag">Interactive Analytics</span>
                        </div>

                        <!-- 4 High-Impact KPI Glance Cards -->
                        <div class="fin-kpi-summary-grid">
                            <div class="fin-kpi-card">
                                <div class="fin-kpi-header">
                                    <span class="fin-kpi-title">Revenue (FY26)</span>
                                    <span class="fin-kpi-badge">Audited</span>
                                </div>
                                <div class="fin-kpi-val">₹1,219.96 Cr</div>
                                <div class="fin-kpi-sub">
                                    <span class="fin-pill-growth positive">+6.81% YoY</span>
                                    <span>FY 2025-26</span>
                                </div>
                            </div>

                            <div class="fin-kpi-card">
                                <div class="fin-kpi-header">
                                    <span class="fin-kpi-title">Operating EBITDA</span>
                                    <span class="fin-kpi-badge">Robust Scale</span>
                                </div>
                                <div class="fin-kpi-val">₹845.34 Cr</div>
                                <div class="fin-kpi-sub">
                                    <span class="fin-pill-growth positive">69.29% Margin</span>
                                    <span>High Cash Flow</span>
                                </div>
                            </div>

                            <div class="fin-kpi-card">
                                <div class="fin-kpi-header">
                                    <span class="fin-kpi-title">PAT (Net Profit)</span>
                                    <span class="fin-kpi-badge">After Tax</span>
                                </div>
                                <div class="fin-kpi-val">₹502.21 Cr</div>
                                <div class="fin-kpi-sub">
                                    <span class="fin-pill-growth positive">41.17% Margin</span>
                                    <span>Net Profit Record</span>
                                </div>
                            </div>

                            <div class="fin-kpi-card">
                                <div class="fin-kpi-header">
                                    <span class="fin-kpi-title">Diluted EPS</span>
                                    <span class="fin-kpi-badge">Per Share</span>
                                </div>
                                <div class="fin-kpi-val">₹10.50</div>
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
                            <canvas id="cial-fin-canvas"></canvas>
                        </div>
                    </div>

                    <!-- Card 6: Annual Reports & Statutory Disclosures -->
                    <div class="cial-card">
                        <div class="filing-badge-card">
                            <div class="filing-badge-left">
                                <div class="filing-icon">📑</div>
                                <div>
                                    <strong style="color: #0f172a; font-size: 0.98rem; display: block;">ANNUAL REPORTS &amp; STATUTORY DISCLOSURES</strong>
                                    <span style="font-size: 0.85rem; color: #64748b;">
                                        ✓ COCHIN INTERNATIONAL AIRPORT LTD (CIAL) — Audited annual statements, financial reports, sustainability filings, and corporate governance returns.
                                    </span>
                                </div>
                            </div>
                            <a href="https://www.cial.aero/Corporate/Financial-Report" target="_blank" rel="noopener noreferrer" class="cial-link-btn" style="font-size: 0.88rem; white-space: nowrap;">
                                View Financial Reports ↗
                            </a>
                        </div>
                    </div>

                    <!-- Card 7: Frequently Asked Questions -->
                    <div class="cial-card">
                        <div class="cial-card-header">
                            <h2 class="cial-card-title">
                                <span class="cial-card-title-icon">❓</span>
                                Frequently Asked Questions
                            </h2>
                            <span class="cial-card-tag">Investor Intelligence</span>
                        </div>

                        <div class="faq-accordion">
                            <div class="faq-item">
                                <div class="faq-question">
                                    <span>What makes CIAL unique among Indian infrastructure assets?</span>
                                    <span class="faq-arrow">▾</span>
                                </div>
                                <div class="faq-answer">
                                    CIAL is India's first airport built under a Public-Private Partnership (PPP) model with over 38,000 retail/NRI shareholders and the Government of Kerala. It is also the world's first fully solar-powered airport, generating 100% of its operating power through captive green solar generation.
                                </div>
                            </div>

                            <div class="faq-item">
                                <div class="faq-question">
                                    <span>What is the official ISIN and Depository status of CIAL shares?</span>
                                    <span class="faq-arrow">▾</span>
                                </div>
                                <div class="faq-answer">
                                    The official ISIN for Cochin International Airport Ltd is <strong>INE02KH01019</strong> with a face value of ₹10/- per equity share. The shares are fully dematerialized and eligible for settlement across both NSDL and CDSL depositories.
                                </div>
                            </div>

                            <div class="faq-item">
                                <div class="faq-question">
                                    <span>What is CIAL's dividend history?</span>
                                    <span class="faq-arrow">▾</span>
                                </div>
                                <div class="faq-answer">
                                    CIAL boasts one of the most generous and consistent dividend track records in the unlisted space, regularly declaring dividends exceeding 35% to 40% of face value backed by surging aero and non-aero net cash flows.
                                </div>
                            </div>

                            <div class="faq-item">
                                <div class="faq-question">
                                    <span>How are transactions in CIAL unlisted shares executed?</span>
                                    <span class="faq-arrow">▾</span>
                                </div>
                                <div class="faq-answer">
                                    Transactions are executed through compliant off-market depository transfers between buyer and seller Demat accounts via DIS slips or online CDSL Easiest / NSDL Speed-e, with strict Client Master Report (CMR) verification and bank settlement.
                                </div>
                            </div>

                            <div class="faq-item">
                                <div class="faq-question">
                                    <span>What are CIAL's primary revenue streams?</span>
                                    <span class="faq-arrow">▾</span>
                                </div>
                                <div class="faq-answer">
                                    Revenue streams comprise Aeronautical revenues (landing fees, parking fees, UDF/PSF) and high-margin Non-Aeronautical revenues (duty-free operations, retail leasing, F&amp;B concessions, solar power supply, cargo handling, and hotel hospitality).
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

                <!-- RIGHT COLUMN: Action Desk & Corporate Sidebar -->
                <div class="cial-sidebar-col">

                    <!-- 1. Corporate Identity Badge Card -->
                    <div class="sidebar-brand-card">
                        <div class="sidebar-logo-box">
                            <img src="../../assets/logos/cial.png" alt="CIAL Logo" class="sidebar-logo-img">
                        </div>
                        <div class="sidebar-brand-meta">
                            <span class="sidebar-scrip-tag">CIAL UNLISTED SHARES</span>
                            <span class="sidebar-sec-tag">Airport Infrastructure &amp; Green IPP</span>
                        </div>
                        <a href="https://www.cial.aero" target="_blank" rel="noopener noreferrer" class="sidebar-btn-web">
                            <span>🌐 Visit Official Website</span>
                            <span>↗</span>
                        </a>
                    </div>

                    <!-- 2. Direct Investor Execution Desk -->
                    <div class="sidebar-trade-card">
                        <div class="sidebar-trade-badge">DIRECT EXECUTION DESK</div>
                        <h3 class="sidebar-trade-title">Trade CIAL Unlisted Shares</h3>
                        <p class="sidebar-trade-desc">
                            Connect directly with our institutional investment desk for verified share lots, current transaction quotes, and off-market settlement assistance.
                        </p>

                        <div class="sidebar-actions-stack">
                            <a href="https://wa.me/919324546516?text=Hi%2C%20I%20am%20interested%20in%20buying%20or%20selling%20CIAL%20unlisted%20shares.%20Please%20share%20current%20rates%20and%20procedure." target="_blank" rel="noopener noreferrer" class="sidebar-btn-wa">
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
                            <span class="peers-icon">✈️</span>
                            <h4 class="peers-title">Infrastructure &amp; Aerospace Peers</h4>
                        </div>
                        <div class="peers-links">
                            <a href="../garudaaerospace/garudaaerospace.html" class="peer-link-item">
                                <span class="peer-name">Garuda Aerospace</span>
                                <span class="peer-arrow">↗</span>
                            </a>
                            <a href="../goashipyard/goashipyard.html" class="peer-link-item">
                                <span class="peer-name">Goa Shipyard Limited</span>
                                <span class="peer-arrow">↗</span>
                            </a>
                            <a href="../sterlitepower/sterlitepower.html" class="peer-link-item">
                                <span class="peer-name">Sterlite Power</span>
                                <span class="peer-arrow">↗</span>
                            </a>
                            <a href="../nayaraenergy/nayaraenergy.html" class="peer-link-item">
                                <span class="peer-name">Nayara Energy Limited</span>
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

    <!-- Dedicated Script for CIAL -->
    <script src="cial.js"></script>

    <!-- Global Interactive Scripts -->
    <script src="../../script.js"></script>
    <script src="../../chatbot-kb.js"></script>
    <script src="../../chatbot.js"></script>
</body>
</html>
"@

[System.IO.File]::WriteAllText((Join-Path (Get-Location).Path "scripts/cial/cial.html"), $html, $utf8NoBom)
Write-Host "Generated: scripts/cial/cial.html"
