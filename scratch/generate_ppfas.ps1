# Generator for PPFAS (Parag Parikh Financial Advisory Services Limited)
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
    <title>PPFAS Unlisted Shares & Details | Meera Associates</title>
    <meta name="description" content="Explore Parag Parikh Financial Advisory Services Limited (PPFAS) unlisted shares, corporate master specifications, mutual fund sponsorship, audited disclosures, and ISIN INE0FGC01012 at Meera Associates.">
    <!-- Google Fonts: Plus Jakarta Sans -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../../styles.css">
    <link rel="stylesheet" href="../../chatbot.css">
    <link rel="icon" type="image/png" href="../../assets/meera_associates_logo.png">

    <!-- Dedicated Scoped Styling for PPFAS -->
    <link rel="stylesheet" href="ppfas.css">
</head>
<body>
    <!-- Mouse Light Follower -->
    <div id="mouse-light-follower"></div>

    <!-- 1. NAVIGATION HEADER -->
$headerSnippet

    <!-- 2. HIGH-IMPACT HERO COMMAND BAR -->
    <section class="ppfas-hero">
        <div class="ppfas-hero-container">
            <!-- Breadcrumbs -->
            <nav class="ppfas-breadcrumbs" aria-label="Breadcrumb">
                <a href="../../index.html">Home</a>
                <span class="crumb-sep">/</span>
                <a href="../../unlisted-shares.html">Unlisted Shares</a>
                <span class="crumb-sep">/</span>
                <span>PPFAS</span>
            </nav>

            <!-- Hero Badge -->
            <div class="ppfas-hero-badge">
                <span class="pulse-dot"></span>
                Scrip #16 • Financial Services Directory
            </div>

            <!-- Hero Title & Subtitle -->
            <h1 class="ppfas-hero-title">Parag Parikh Financial Advisory Services Ltd (PPFAS)</h1>
            <p class="ppfas-hero-subtitle">
                Sponsor and asset management parent behind India's premier value-investing mutual fund house, delivering long-term compounding and disciplined global wealth management.
            </p>

            <!-- 4-KPI Metric Strip in Hero -->
            <div class="ppfas-metrics-strip">
                <div class="metric-card">
                    <span class="metric-label">ISIN NUMBER</span>
                    <div class="metric-val">
                        <button type="button" class="isin-copy-badge" id="copy-isin-btn" title="Click to copy ISIN">
                            <span>INE0FGC01012</span>
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
                    <div class="metric-val">Asset Mgmt</div>
                    <span class="metric-sub">Mutual Fund Sponsor &amp; PMS</span>
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
    <main class="ppfas-page-wrap">
        <div class="ppfas-body-container">
            <div class="ppfas-content-grid">
                
                <!-- LEFT COLUMN: Main Specifications & Corporate Details -->
                <div class="ppfas-main-col">

                    <!-- Card 1: Master Corporate Specifications -->
                    <div class="ppfas-card">
                        <div class="ppfas-card-header">
                            <h2 class="ppfas-card-title">
                                <span class="ppfas-card-title-icon">🏛️</span>
                                Corporate Master Specifications
                            </h2>
                            <span class="ppfas-card-tag">Statutory Profile</span>
                        </div>

                        <div class="ppfas-table-responsive">
                            <table class="ppfas-table">
                                <tbody>
                                    <tr>
                                        <td class="spec-label">Company Name</td>
                                        <td class="spec-value"><strong>Parag Parikh Financial Advisory Services Limited (PPFAS)</strong></td>
                                    </tr>
                                    <tr>
                                        <td class="spec-label">Corporate Identification Number (CIN)</td>
                                        <td class="spec-value"><code>U67190MH1992PLC068970</code></td>
                                    </tr>
                                    <tr>
                                        <td class="spec-label">International Securities Identification Number (ISIN)</td>
                                        <td class="spec-value">
                                            <button type="button" class="isin-copy-badge table-isin-badge" id="table-copy-isin-btn" title="Click to copy ISIN">
                                                <span>INE0FGC01012</span>
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
                                        <td class="spec-value">1992 (Over 3 decades of value-investing leadership)</td>
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
                                        <td class="spec-label">Key Promoters &amp; Leadership</td>
                                        <td class="spec-value">Neil Parag Parikh and Sahil Parikh</td>
                                    </tr>
                                    <tr>
                                        <td class="spec-label">Registered Office Address</td>
                                        <td class="spec-value">81/82, 8th Floor, Sakhar Bhavan, Ramnath Goenka Marg, 230, Nariman Point, Mumbai - 400021</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <!-- Card 2: Board of Directors & Leadership -->
                    <div class="ppfas-card">
                        <div class="ppfas-card-header">
                            <h2 class="ppfas-card-title">
                                <span class="ppfas-card-title-icon">👥</span>
                                Board of Directors
                            </h2>
                            <span class="ppfas-card-tag">Corporate Governance</span>
                        </div>

                        <div class="directors-grid">
                            <!-- Director 1 -->
                            <div class="director-card">
                                <div class="director-check">✓</div>
                                <div class="director-info">
                                    <span class="director-name">Mr. Neil Parag Parikh</span>
                                    <span class="director-role">CHAIRMAN, EXECUTIVE DIRECTOR</span>
                                </div>
                            </div>

                            <!-- Director 2 -->
                            <div class="director-card">
                                <div class="director-check">✓</div>
                                <div class="director-info">
                                    <span class="director-name">Mr. Rajeev Thakkar</span>
                                    <span class="director-role">EXECUTIVE DIRECTOR &amp; CIO</span>
                                </div>
                            </div>

                            <!-- Director 3 -->
                            <div class="director-card">
                                <div class="director-check">✓</div>
                                <div class="director-info">
                                    <span class="director-name">Mr. Sahil Parikh</span>
                                    <span class="director-role">NON-EXECUTIVE DIRECTOR</span>
                                </div>
                            </div>

                            <!-- Director 4 -->
                            <div class="director-card">
                                <div class="director-check">✓</div>
                                <div class="director-info">
                                    <span class="director-name">Mr. Dipti Neelakantan</span>
                                    <span class="director-role">INDEPENDENT DIRECTOR</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Card 3: Strategic Moats & Institutional Edge -->
                    <div class="ppfas-card">
                        <div class="ppfas-card-header">
                            <h2 class="ppfas-card-title">
                                <span class="ppfas-card-title-icon">🛡️</span>
                                Strategic Moats &amp; Asset Management Architecture
                            </h2>
                            <span class="ppfas-card-tag">Investment Philosophy</span>
                        </div>

                        <div class="moats-grid">
                            <!-- Moat 1 -->
                            <div class="moat-card">
                                <div class="moat-icon">💎</div>
                                <h3 class="moat-title">Disciplined Value Investing</h3>
                                <p class="moat-desc">
                                    Decades-long adherence to fundamental value metrics inspired by Benjamin Graham and Warren Buffett, prioritizing capital preservation alongside compounding.
                                </p>
                            </div>

                            <!-- Moat 2 -->
                            <div class="moat-card">
                                <div class="moat-icon">📈</div>
                                <h3 class="moat-title">Parag Parikh Flexi Cap Scale</h3>
                                <p class="moat-desc">
                                    Sponsors India's flagship flexi-cap fund with industry-leading retail investor loyalty, exceptional long-term alpha, and high cash-buffer discipline.
                                </p>
                            </div>

                            <!-- Moat 3 -->
                            <div class="moat-card">
                                <div class="moat-icon">🌐</div>
                                <h3 class="moat-title">Global Portfolio Diversification</h3>
                                <p class="moat-desc">
                                    Pioneered offshore equity exposure for Indian retail investors, holding world-leading tech giants to hedge currency risks and enhance returns.
                                </p>
                            </div>

                            <!-- Moat 4 -->
                            <div class="moat-card">
                                <div class="moat-icon">🤝</div>
                                <h3 class="moat-title">Skin In The Game Alignment</h3>
                                <p class="moat-desc">
                                    Promoters, fund managers, and executive leadership maintain substantial personal wealth invested in the very schemes they manage, ensuring zero distributor bias.
                                </p>
                            </div>
                        </div>
                    </div>

                    <!-- Card 4: Products, Advisory & Investment Solutions -->
                    <div class="ppfas-card">
                        <div class="ppfas-card-header">
                            <h2 class="ppfas-card-title">
                                <span class="ppfas-card-title-icon">📦</span>
                                Investment Solutions &amp; Asset Offerings
                            </h2>
                            <span class="ppfas-card-tag">Core Solutions</span>
                        </div>

                        <div class="subsections-tri-grid">
                            <!-- Sub-Card 1 -->
                            <div class="sub-feature-card">
                                <div class="sub-feature-head">
                                    <span class="sub-feature-icon">📊</span>
                                    <h3 class="sub-feature-title">PPFAS Mutual Fund</h3>
                                </div>
                                <ul class="sub-feature-list">
                                    <li>Parag Parikh Flexi Cap Fund</li>
                                    <li>Parag Parikh Tax Saver Fund (ELSS)</li>
                                    <li>Parag Parikh Conservative Hybrid Fund</li>
                                    <li>Parag Parikh Liquid &amp; Dynamic Asset Schemes</li>
                                </ul>
                            </div>

                            <!-- Sub-Card 2 -->
                            <div class="sub-feature-card">
                                <div class="sub-feature-head">
                                    <span class="sub-feature-icon">💼</span>
                                    <h3 class="sub-feature-title">Portfolio Management Services</h3>
                                </div>
                                <ul class="sub-feature-list">
                                    <li>Discretionary Portfolio Advisory for HNIs</li>
                                    <li>Long-term Equity Wealth Compounding</li>
                                    <li>Disciplined Risk-Adjusted Allocation</li>
                                    <li>Transparent Fee &amp; Custody Structure</li>
                                </ul>
                            </div>

                            <!-- Sub-Card 3 -->
                            <div class="sub-feature-card">
                                <div class="sub-feature-head">
                                    <span class="sub-feature-icon">🏛️</span>
                                    <h3 class="sub-feature-title">Institutional Advisory</h3>
                                </div>
                                <ul class="sub-feature-list">
                                    <li>Family Office Asset Structuring</li>
                                    <li>Capital Allocation &amp; Preservation Modeling</li>
                                    <li>Global Equities Research Insights</li>
                                    <li>Fiduciary Wealth Management</li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <!-- Card 5: News & Market Updates -->
                    <div class="ppfas-card">
                        <div class="ppfas-card-header">
                            <h2 class="ppfas-card-title">
                                <span class="ppfas-card-title-icon">📰</span>
                                News &amp; Market Developments
                            </h2>
                            <span class="ppfas-card-tag">Market Updates</span>
                        </div>

                        <div class="news-cards-grid">
                            <div class="news-card">
                                <div>
                                    <span class="news-card-badge">Leadership Transition</span>
                                    <h3 class="news-card-title">PPFAS Mutual Fund announces resignation of Chief Financial Officer</h3>
                                    <p class="news-card-desc">
                                        PPFAS Mutual Fund notified unitholders and stock exchanges of executive succession following the CFO's resignation, maintaining institutional governance continuity.
                                    </p>
                                </div>
                                <a href="https://economictimes.indiatimes.com/mf/mf-news/ppfas-mutual-fund-announces-resignation-of-chief-financial-officer/articleshow/124249051.cms?from=mdr" target="_blank" rel="noopener noreferrer" class="news-link-btn">
                                    Read Article at Economic Times ↗
                                </a>
                            </div>

                            <div class="news-card">
                                <div>
                                    <span class="news-card-badge">Fund Attribute Notice</span>
                                    <h3 class="news-card-title">PPFAS Mutual Fund announces change in fundamental attribute of Parag Parikh Flexi Cap Fund</h3>
                                    <p class="news-card-desc">
                                        The fund house announced fundamental attribute enhancements to its flagship flexi-cap scheme in full accordance with regulatory SEBI framework updates.
                                    </p>
                                </div>
                                <a href="https://economictimes.indiatimes.com/mf/mf-news/ppfas-mutual-fund-announces-change-in-fundamental-attribute-of-parag-parikh-flexi-cap-fund/articleshow/124228574.cms?from=mdr" target="_blank" rel="noopener noreferrer" class="news-link-btn">
                                    Read Article at Economic Times ↗
                                </a>
                            </div>
                        </div>
                    </div>

                    <!-- Card 6: Annual Reports & Financial Disclosures -->
                    <div class="ppfas-card">
                        <div class="filing-badge-card">
                            <div class="filing-badge-left">
                                <div class="filing-icon">📑</div>
                                <div>
                                    <strong style="color: #0f172a; font-size: 0.98rem; display: block;">ANNUAL REPORTS &amp; STATUTORY DISCLOSURES</strong>
                                    <span style="font-size: 0.85rem; color: #64748b;">
                                        ✓ PARAG PARIKH FINANCIAL ADVISORY SERVICES LTD — Audited annual statements, balance sheets, cash flow statements, and statutory filings.
                                    </span>
                                </div>
                            </div>
                            <a href="https://www.ppfas.com/investor-desk/financials/" target="_blank" rel="noopener noreferrer" class="ppfas-link-btn" style="font-size: 0.88rem; white-space: nowrap;">
                                View Financial Reports ↗
                            </a>
                        </div>
                    </div>

                    <!-- Card 7: Frequently Asked Questions -->
                    <div class="ppfas-card">
                        <div class="ppfas-card-header">
                            <h2 class="ppfas-card-title">
                                <span class="ppfas-card-title-icon">❓</span>
                                Frequently Asked Questions
                            </h2>
                            <span class="ppfas-card-tag">Investor Intelligence</span>
                        </div>

                        <div class="faq-accordion">
                            <div class="faq-item">
                                <div class="faq-question">
                                    <span>What is the relationship between PPFAS Limited and PPFAS Mutual Fund?</span>
                                    <span class="faq-arrow">▾</span>
                                </div>
                                <div class="faq-answer">
                                    Parag Parikh Financial Advisory Services Limited (PPFAS) is the principal sponsor and holding company of PPFAS Asset Management Private Limited (the AMC that manages PPFAS Mutual Fund) and PPFAS Trustee Company Private Limited.
                                </div>
                            </div>

                            <div class="faq-item">
                                <div class="faq-question">
                                    <span>What is the official ISIN and Depository status of PPFAS unlisted shares?</span>
                                    <span class="faq-arrow">▾</span>
                                </div>
                                <div class="faq-answer">
                                    The official ISIN for PPFAS Limited is <strong>INE0FGC01012</strong> with a face value of ₹10/- per equity share. The shares are fully dematerialized and eligible for settlement across both NSDL and CDSL depositories.
                                </div>
                            </div>

                            <div class="faq-item">
                                <div class="faq-question">
                                    <span>How are transactions in PPFAS unlisted shares executed?</span>
                                    <span class="faq-arrow">▾</span>
                                </div>
                                <div class="faq-answer">
                                    Trades in PPFAS unlisted shares are facilitated via verified off-market depository transfers between buyer and seller Demat accounts through Delivery Instruction Slips (DIS) or speed-e / CDSL easiest electronic transfers, backed by Client Master Report (CMR) verification.
                                </div>
                            </div>

                            <div class="faq-item">
                                <div class="faq-question">
                                    <span>What key drivers support the valuation of PPFAS Limited?</span>
                                    <span class="faq-arrow">▾</span>
                                </div>
                                <div class="faq-answer">
                                    Valuation drivers include exponential AUM growth across PPFAS Mutual Fund schemes, exceptional retail investor retention, sustained investment management fees, robust balance sheet reserves, and strong brand equity anchored in fiduciary value investing.
                                </div>
                            </div>

                            <div class="faq-item">
                                <div class="faq-question">
                                    <span>What documents are required to buy or sell PPFAS unlisted shares?</span>
                                    <span class="faq-arrow">▾</span>
                                </div>
                                <div class="faq-answer">
                                    Investors need an active Demat account (NSDL or CDSL), Client Master Report (CMR) with digitally verified stamp, PAN card copy, and bank verification details for seamless NEFT/RTGS transaction settlement.
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

                <!-- RIGHT COLUMN: Action Desk & Corporate Sidebar -->
                <div class="ppfas-sidebar-col">

                    <!-- 1. Corporate Identity Badge Card -->
                    <div class="sidebar-brand-card">
                        <div class="sidebar-logo-box">
                            <img src="../../assets/logos/ppfas.svg" alt="PPFAS Logo" class="sidebar-logo-img">
                        </div>
                        <div class="sidebar-brand-meta">
                            <span class="sidebar-scrip-tag">PPFAS UNLISTED SHARES</span>
                            <span class="sidebar-sec-tag">Asset Management &amp; Financial Advisory</span>
                        </div>
                        <a href="https://amc.ppfas.com/" target="_blank" rel="noopener noreferrer" class="sidebar-btn-web">
                            <span>🌐 Visit Official AMC Website</span>
                            <span>↗</span>
                        </a>
                    </div>

                    <!-- 2. Direct Investor Execution Desk -->
                    <div class="sidebar-trade-card">
                        <div class="sidebar-trade-badge">DIRECT EXECUTION DESK</div>
                        <h3 class="sidebar-trade-title">Trade PPFAS Unlisted Shares</h3>
                        <p class="sidebar-trade-desc">
                            Connect directly with our institutional investment desk for verified share lots, current transaction quotes, and off-market settlement assistance.
                        </p>

                        <div class="sidebar-actions-stack">
                            <a href="https://wa.me/919324546516?text=Hi%2C%20I%20am%20interested%20in%20buying%20or%20selling%20PPFAS%20unlisted%20shares.%20Please%20share%20current%20rates%20and%20procedure." target="_blank" rel="noopener noreferrer" class="sidebar-btn-wa">
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
                            <h4 class="peers-title">Financial Services Peers</h4>
                        </div>
                        <div class="peers-links">
                            <a href="../incredcapital/incredcapital.html" class="peer-link-item">
                                <span class="peer-name">InCred Financial Services</span>
                                <span class="peer-arrow">↗</span>
                            </a>
                            <a href="../motilaloswalhf/motilaloswalhf.html" class="peer-link-item">
                                <span class="peer-name">Motilal Oswal Home Finance</span>
                                <span class="peer-arrow">↗</span>
                            </a>
                            <a href="../hdfcsecurities/hdfcsecurities.html" class="peer-link-item">
                                <span class="peer-name">HDFC Securities</span>
                                <span class="peer-arrow">↗</span>
                            </a>
                            <a href="../plindia/plindia.html" class="peer-link-item">
                                <span class="peer-name">PL Capital (Prabhudas Lilladher)</span>
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

    <!-- Dedicated Script for PPFAS -->
    <script src="ppfas.js"></script>

    <!-- Global Interactive Scripts -->
    <script src="../../script.js"></script>
    <script src="../../chatbot-kb.js"></script>
    <script src="../../chatbot.js"></script>
</body>
</html>
"@

[System.IO.File]::WriteAllText((Join-Path (Get-Location).Path "scripts/ppfas/ppfas.html"), $html, $utf8NoBom)
Write-Host "Generated: scripts/ppfas/ppfas.html"
