# Generator for Sunday Proptech Limited
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
    <title>Sunday Proptech Limited - Unlisted Shares & Details | Meera Associates</title>
    <meta name="description" content="Explore Sunday Proptech Limited unlisted shares, PRISM-backed hotel acquisitions, OYO strategic ecosystem, corporate specifications, board of directors, and ISIN INE1DBV01024 at Meera Associates.">
    <!-- Google Fonts: Plus Jakarta Sans -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../../styles.css">
    <link rel="stylesheet" href="../../chatbot.css">
    <link rel="icon" type="image/png" href="../../assets/meera_associates_logo.png">

    <!-- Dedicated Scoped Styling for Sunday Proptech -->
    <link rel="stylesheet" href="sundayproptech.css">
</head>
<body>
    <!-- Mouse Light Follower -->
    <div id="mouse-light-follower"></div>

    <!-- 1. NAVIGATION HEADER -->
$headerSnippet

    <!-- 2. HIGH-IMPACT HERO COMMAND BAR -->
    <section class="sunday-hero">
        <div class="sunday-hero-container">
            <!-- Breadcrumbs -->
            <nav class="sunday-breadcrumbs" aria-label="Breadcrumb">
                <a href="../../index.html">Home</a>
                <span class="crumb-sep">/</span>
                <a href="../../unlisted-shares.html">Unlisted Shares</a>
                <span class="crumb-sep">/</span>
                <span>Sunday Proptech</span>
            </nav>

            <!-- Hero Badge -->
            <div class="sunday-hero-badge">
                <span class="pulse-dot"></span>
                Scrip #17 • Technology &amp; PropTech Directory
            </div>

            <!-- Hero Title & Subtitle -->
            <h1 class="sunday-hero-title">Sunday Proptech Limited</h1>
            <p class="sunday-hero-subtitle">
                High-growth digital real estate and premium hospitality asset acquisition platform, backed by PRISM and strategic OYO ecosystem integration.
            </p>

            <!-- 4-KPI Metric Strip in Hero -->
            <div class="sunday-metrics-strip">
                <div class="metric-card">
                    <span class="metric-label">ISIN NUMBER</span>
                    <div class="metric-val">
                        <button type="button" class="isin-copy-badge" id="copy-isin-btn" title="Click to copy ISIN">
                            <span>INE1DBV01024</span>
                            <span class="copy-hint" id="copy-status-text">📋 Copy</span>
                        </button>
                    </div>
                    <span class="metric-sub">NSDL &amp; CDSL Demat</span>
                </div>

                <div class="metric-card">
                    <span class="metric-label">FACE VALUE</span>
                    <div class="metric-val highlight">₹1.00</div>
                    <span class="metric-sub">Per Equity Share</span>
                </div>

                <div class="metric-card">
                    <span class="metric-label">SECTOR</span>
                    <div class="metric-val">Technology</div>
                    <span class="metric-sub">Digital PropTech &amp; Hospitality</span>
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
    <main class="sunday-page-wrap">
        <div class="sunday-body-container">
            <div class="sunday-content-grid">
                
                <!-- LEFT COLUMN: Main Specifications & Corporate Details -->
                <div class="sunday-main-col">

                    <!-- Card 1: Master Corporate Specifications -->
                    <div class="sunday-card">
                        <div class="sunday-card-header">
                            <h2 class="sunday-card-title">
                                <span class="sunday-card-title-icon">🏛️</span>
                                Corporate Master Specifications
                            </h2>
                            <span class="sunday-card-tag">Statutory Profile</span>
                        </div>

                        <div class="sunday-table-responsive">
                            <table class="sunday-table">
                                <tbody>
                                    <tr>
                                        <td class="spec-label">Company Name</td>
                                        <td class="spec-value"><strong>Sunday Proptech Limited</strong></td>
                                    </tr>
                                    <tr>
                                        <td class="spec-label">Corporate Identification Number (CIN)</td>
                                        <td class="spec-value"><code>U70109DL2018PLC337323</code></td>
                                    </tr>
                                    <tr>
                                        <td class="spec-label">International Securities Identification Number (ISIN)</td>
                                        <td class="spec-value">
                                            <button type="button" class="isin-copy-badge table-isin-badge" id="table-copy-isin-btn" title="Click to copy ISIN">
                                                <span>INE1DBV01024</span>
                                                <span class="copy-hint" id="table-copy-status">📋 Copy</span>
                                            </button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="spec-label">Face Value (FV)</td>
                                        <td class="spec-value"><strong>Rs. 1/- per equity share</strong></td>
                                    </tr>
                                    <tr>
                                        <td class="spec-label">Date of Incorporation</td>
                                        <td class="spec-value">2018 (Next-generation PropTech asset acquisition)</td>
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
                                        <td class="spec-label">Key Promoters &amp; Backing</td>
                                        <td class="spec-value">Oravel Stays Ltd (OYO Strategic Partner) &amp; PRISM Consortium</td>
                                    </tr>
                                    <tr>
                                        <td class="spec-label">Registered Office Address</td>
                                        <td class="spec-value">44, 2nd Floor, Regal Building, Connaught Place, Central Delhi, Delhi - 110001</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <!-- Card 2: Board of Directors & Leadership -->
                    <div class="sunday-card">
                        <div class="sunday-card-header">
                            <h2 class="sunday-card-title">
                                <span class="sunday-card-title-icon">👥</span>
                                Board of Directors
                            </h2>
                            <span class="sunday-card-tag">Corporate Governance</span>
                        </div>

                        <div class="directors-grid">
                            <!-- Director 1 -->
                            <div class="director-card">
                                <div class="director-check">✓</div>
                                <div class="director-info">
                                    <span class="director-name">Mr. Ritesh Agarwal</span>
                                    <span class="director-role">FOUNDER &amp; CEO / NON-EXECUTIVE DIRECTOR</span>
                                </div>
                            </div>

                            <!-- Director 2 -->
                            <div class="director-card">
                                <div class="director-check">✓</div>
                                <div class="director-info">
                                    <span class="director-name">Mr. Saurav Agarwal</span>
                                    <span class="director-role">DIRECTOR</span>
                                </div>
                            </div>

                            <!-- Director 3 -->
                            <div class="director-card">
                                <div class="director-check">✓</div>
                                <div class="director-info">
                                    <span class="director-name">Mr. Vinod Sood</span>
                                    <span class="director-role">DIRECTOR</span>
                                </div>
                            </div>

                            <!-- Director 4 -->
                            <div class="director-card">
                                <div class="director-check">✓</div>
                                <div class="director-info">
                                    <span class="director-name">Mr. Rakesh Kumar</span>
                                    <span class="director-role">DIRECTOR</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Card 3: Strategic Moats & Expansion Architecture -->
                    <div class="sunday-card">
                        <div class="sunday-card-header">
                            <h2 class="sunday-card-title">
                                <span class="sunday-card-title-icon">🛡️</span>
                                Strategic Moats &amp; Ecosystem Alignment
                            </h2>
                            <span class="sunday-card-tag">Competitive Advantages</span>
                        </div>

                        <div class="moats-grid">
                            <!-- Moat 1 -->
                            <div class="moat-card">
                                <div class="moat-icon">💰</div>
                                <h3 class="moat-title">PRISM Consortium Institutional Backing</h3>
                                <p class="moat-desc">
                                    Backed by institutional consortium funding led by InCred and Analah, providing deep growth capital for rapid acquisitions of prime hospitality real estate assets.
                                </p>
                            </div>

                            <!-- Moat 2 -->
                            <div class="moat-card">
                                <div class="moat-icon">🌐</div>
                                <h3 class="moat-title">OYO Global Distribution Synergy</h3>
                                <p class="moat-desc">
                                    Direct algorithmic integration into OYO's enterprise booking infrastructure, corporate client accounts, and 100M+ international loyalty member base.
                                </p>
                            </div>

                            <!-- Moat 3 -->
                            <div class="moat-card">
                                <div class="moat-icon">🏨</div>
                                <h3 class="moat-title">Premium Hotel Portfolio Rollout</h3>
                                <p class="moat-desc">
                                    Aggressive multi-city expansion acquiring 12+ premium hotel properties across FY26, targeting high-yield 4-star leisure, heritage, and business corridors.
                                </p>
                            </div>

                            <!-- Moat 4 -->
                            <div class="moat-card">
                                <div class="moat-icon">⚡</div>
                                <h3 class="moat-title">Proprietary AI Yield Engine</h3>
                                <p class="moat-desc">
                                    Automated dynamic room rate pricing, channel allocation algorithms, and demand prediction models maximizing RevPAR and operating cash flow margins.
                                </p>
                            </div>
                        </div>
                    </div>

                    <!-- Card 4: Products, Hotel Verticals & Tech Solutions -->
                    <div class="sunday-card">
                        <div class="sunday-card-header">
                            <h2 class="sunday-card-title">
                                <span class="sunday-card-title-icon">📦</span>
                                Portfolio Brands &amp; PropTech Solutions
                            </h2>
                            <span class="sunday-card-tag">Business Verticals</span>
                        </div>

                        <div class="subsections-tri-grid">
                            <!-- Sub-Card 1 -->
                            <div class="sub-feature-card">
                                <div class="sub-feature-head">
                                    <span class="sub-feature-icon">🏨</span>
                                    <h3 class="sub-feature-title">Sunday Hotels Portfolio</h3>
                                </div>
                                <ul class="sub-feature-list">
                                    <li>Upscale &amp; Boutique Hotel Operations</li>
                                    <li>Curated Urban &amp; Leisure Experiences</li>
                                    <li>Premium F&amp;B and Banquet Facilities</li>
                                    <li>Loyalty &amp; Corporate Travel Partnerships</li>
                                </ul>
                            </div>

                            <!-- Sub-Card 2 -->
                            <div class="sub-feature-card">
                                <div class="sub-feature-head">
                                    <span class="sub-feature-icon">🏢</span>
                                    <h3 class="sub-feature-title">Hospitality Asset Management</h3>
                                </div>
                                <ul class="sub-feature-list">
                                    <li>Turnkey Hotel Asset Leasing</li>
                                    <li>Distressed Asset Turnaround &amp; Re-branding</li>
                                    <li>Institutional Co-Investment Syndicates</li>
                                    <li>CAPEX Modernization &amp; Interiors</li>
                                </ul>
                            </div>

                            <!-- Sub-Card 3 -->
                            <div class="sub-feature-card">
                                <div class="sub-feature-head">
                                    <span class="sub-feature-icon">📱</span>
                                    <h3 class="sub-feature-title">PropTech Operations Stack</h3>
                                </div>
                                <ul class="sub-feature-list">
                                    <li>Cloud-Native Property Management System</li>
                                    <li>Automated Direct OTA Booking Sync</li>
                                    <li>AI-Driven Energy &amp; Maintenance Controls</li>
                                    <li>Real-Time Financial Dashboard &amp; Audit</li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <!-- Card 5: News & Market Updates -->
                    <div class="sunday-card">
                        <div class="sunday-card-header">
                            <h2 class="sunday-card-title">
                                <span class="sunday-card-title-icon">📰</span>
                                News &amp; Market Developments
                            </h2>
                            <span class="sunday-card-tag">Market Updates</span>
                        </div>

                        <div class="news-cards-grid">
                            <div class="news-card">
                                <div>
                                    <span class="news-card-badge">Expansion Strategy</span>
                                    <h3 class="news-card-title">PRISM-backed Sunday PropTech to acquire 12 hotels in FY26 expansion push</h3>
                                    <p class="news-card-desc">
                                        Sunday PropTech announced aggressive expansion plans to acquire 12 operational hotel assets across major leisure and commercial hubs in FY26, strengthening its asset-light hospitality footprint.
                                    </p>
                                </div>
                                <a href="https://www.business-standard.com/industry/news/sunday-proptech-oyo-assets-hotel-acquisition-plan-prism-backed-expansion-125101501027_1.html" target="_blank" rel="noopener noreferrer" class="news-link-btn">
                                    Read Article at Business Standard ↗
                                </a>
                            </div>

                            <div class="news-card">
                                <div>
                                    <span class="news-card-badge">Institutional Funding</span>
                                    <h3 class="news-card-title">InCred, Analah consortium invests ₹50 cr in PRISM-backed Sunday PropTech</h3>
                                    <p class="news-card-desc">
                                        A high-profile consortium comprising InCred and Analah closed a ₹50 crore strategic investment into Sunday PropTech to fuel rapid tech scaling and hotel acquisitions.
                                    </p>
                                </div>
                                <a href="https://www.business-standard.com/companies/news/incred-analah-consortium-invests-rs50cr-prism-sunday-proptech-125092301095_1.html" target="_blank" rel="noopener noreferrer" class="news-link-btn">
                                    Read Article at Business Standard ↗
                                </a>
                            </div>
                        </div>
                    </div>

                    <!-- Card 6: Frequently Asked Questions -->
                    <div class="sunday-card">
                        <div class="sunday-card-header">
                            <h2 class="sunday-card-title">
                                <span class="sunday-card-title-icon">❓</span>
                                Frequently Asked Questions
                            </h2>
                            <span class="sunday-card-tag">Investor Intelligence</span>
                        </div>

                        <div class="faq-accordion">
                            <div class="faq-item">
                                <div class="faq-question">
                                    <span>What is the core business model of Sunday Proptech Limited?</span>
                                    <span class="faq-arrow">▾</span>
                                </div>
                                <div class="faq-answer">
                                    Sunday Proptech operates a tech-enabled hospitality asset acquisition and management platform. Backed by PRISM and OYO ecosystem integration, it acquires, leases, and upgrades premium hotel properties to deliver optimized yields and guest experiences.
                                </div>
                            </div>

                            <div class="faq-item">
                                <div class="faq-question">
                                    <span>What is the official ISIN and Depository status of Sunday Proptech?</span>
                                    <span class="faq-arrow">▾</span>
                                </div>
                                <div class="faq-answer">
                                    The official ISIN for Sunday Proptech Limited is <strong>INE1DBV01024</strong> with a face value of ₹1/- per equity share. The shares are fully dematerialized and eligible for settlement across both NSDL and CDSL depositories.
                                </div>
                            </div>

                            <div class="faq-item">
                                <div class="faq-question">
                                    <span>Who are the institutional investors behind Sunday Proptech?</span>
                                    <span class="faq-arrow">▾</span>
                                </div>
                                <div class="faq-answer">
                                    Sunday Proptech is backed by the PRISM consortium, alongside marquee institutional investors including InCred Financial Services and Analah Capital, supporting its accelerated hotel acquisition roadmap.
                                </div>
                            </div>

                            <div class="faq-item">
                                <div class="faq-question">
                                    <span>How are Sunday Proptech unlisted shares transacted?</span>
                                    <span class="faq-arrow">▾</span>
                                </div>
                                <div class="faq-answer">
                                    Transactions are facilitated via verified off-market depository transfers directly between buyer and seller Demat accounts using Delivery Instruction Slips (DIS) or speed-e / CDSL easiest systems with full Client Master Report (CMR) verification.
                                </div>
                            </div>

                            <div class="faq-item">
                                <div class="faq-question">
                                    <span>What synergies exist between Sunday Proptech and OYO?</span>
                                    <span class="faq-arrow">▾</span>
                                </div>
                                <div class="faq-answer">
                                    Sunday Proptech benefits from OYO founder Ritesh Agarwal's leadership, OYO's global marketing and booking distribution channels, enterprise customer network, and bulk procurement advantages across hospitality amenities.
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

                <!-- RIGHT COLUMN: Action Desk & Corporate Sidebar -->
                <div class="sunday-sidebar-col">

                    <!-- 1. Corporate Identity Badge Card -->
                    <div class="sidebar-brand-card">
                        <div class="sidebar-logo-box">
                            <img src="../../assets/logos/sunday-proptech.svg" alt="Sunday Proptech Logo" class="sidebar-logo-img">
                        </div>
                        <div class="sidebar-brand-meta">
                            <span class="sidebar-scrip-tag">SUNDAY PROPTECH UNLISTED</span>
                            <span class="sidebar-sec-tag">PropTech &amp; Premium Hospitality</span>
                        </div>
                        <a href="https://www.sundayproptech.com/" target="_blank" rel="noopener noreferrer" class="sidebar-btn-web">
                            <span>🌐 Visit Official Website</span>
                            <span>↗</span>
                        </a>
                    </div>

                    <!-- 2. Direct Investor Execution Desk -->
                    <div class="sidebar-trade-card">
                        <div class="sidebar-trade-badge">DIRECT EXECUTION DESK</div>
                        <h3 class="sidebar-trade-title">Trade Sunday Proptech Shares</h3>
                        <p class="sidebar-trade-desc">
                            Connect directly with our institutional investment desk for verified share lots, current transaction quotes, and off-market settlement assistance.
                        </p>

                        <div class="sidebar-actions-stack">
                            <a href="https://wa.me/919324546516?text=Hi%2C%20I%20am%20interested%20in%20buying%20or%20selling%20Sunday%20Proptech%20unlisted%20shares.%20Please%20share%20current%20rates%20and%20procedure." target="_blank" rel="noopener noreferrer" class="sidebar-btn-wa">
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
                            <span class="peers-icon">🏨</span>
                            <h4 class="peers-title">PropTech &amp; Consumer Peers</h4>
                        </div>
                        <div class="peers-links">
                            <a href="../oyo/oyo.html" class="peer-link-item">
                                <span class="peer-name">OYO (Oravel Stays Ltd)</span>
                                <span class="peer-arrow">↗</span>
                            </a>
                            <a href="../infobayai/infobayai.html" class="peer-link-item">
                                <span class="peer-name">InfoBay AI</span>
                                <span class="peer-arrow">↗</span>
                            </a>
                            <a href="../proyuga/proyuga.html" class="peer-link-item">
                                <span class="peer-name">Proyuga Advanced Tech</span>
                                <span class="peer-arrow">↗</span>
                            </a>
                            <a href="../mavericksimulation/mavericksimulation.html" class="peer-link-item">
                                <span class="peer-name">Maverick Simulation</span>
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

    <!-- Dedicated Script for Sunday Proptech -->
    <script src="sundayproptech.js"></script>

    <!-- Global Interactive Scripts -->
    <script src="../../script.js"></script>
    <script src="../../chatbot-kb.js"></script>
    <script src="../../chatbot.js"></script>
</body>
</html>
"@

[System.IO.File]::WriteAllText((Join-Path (Get-Location).Path "scripts/sundayproptech/sundayproptech.html"), $html, $utf8NoBom)
Write-Host "Generated: scripts/sundayproptech/sundayproptech.html"
