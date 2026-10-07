/**
 * ==============================================================================
 * MEERA ASSOCIATES - RESOURCES CENTRAL REPOSITORY (DATA CONFIGURATION)
 * ==============================================================================
 * 
 * ADMIN QUICK MANAGEMENT GUIDE:
 * ------------------------------------------------------------------------------
 * This file powers the 3 Resources subpages:
 * 1. BLOGS  (blogs.html & blog-detail.html)
 * 2. NEWS   (news.html)
 * 3. VIDEOS (videos.html)
 * 
 * HOW TO ADD / UPDATE CONTENT:
 * - TO ADD A BLOG POST: Add a new object to `resourcesData.blogs` array.
 * - TO ADD A NEWS ITEM: Add a new object to the top of `resourcesData.news` array.
 * - TO ADD A YOUTUBE VIDEO: Add a new object to `resourcesData.videos` with its YouTube video ID.
 * ==============================================================================
 */

const resourcesData = {
    // --------------------------------------------------------------------------
    // 1. BLOGS REPOSITORY
    // --------------------------------------------------------------------------
    blogs: [
        {
            id: "understanding-pre-ipo-valuations",
            title: "Understanding Pre-IPO & Unlisted Share Valuations in India: A Comprehensive Guide",
            category: "Unlisted Shares",
            image: "assets/resources/blog_valuations.jpg",
            date: "Sep 28, 2026",
            readTime: "7 min read",
            author: "Meera Associates Research Desk",
            featured: true,
            excerpt: "A deep dive into how private and unlisted equities are valued prior to IPO filings, examining discounted cash flows (DCF), peer multiples, and secondary market liquidity dynamics.",
            content: `
                <p class="lead-paragraph">In India's rapidly maturing capital markets, pre-IPO and unlisted shares have emerged as a premier asset class for high-net-worth individuals (HNIs), family offices, and discerning institutional investors. Unlike listed equities where prices are discovered continuously on stock exchange terminals, valuing unlisted companies requires a multi-dimensional analytical framework.</p>

                <h3>1. The Core Valuation Methodologies in Private Markets</h3>
                <p>When assessing off-market equities, professional equity analysts rely on three foundational pillars:</p>
                <ul>
                    <li><strong>Discounted Cash Flow (DCF) Modeling:</strong> Projecting future free cash flows to the firm (FCFF) discounted at the Weighted Average Cost of Capital (WACC), adjusted for illiquidity premiums typically ranging between 15% and 25%.</li>
                    <li><strong>Public Peer Group Multiples (P/E and EV/EBITDA):</strong> Benchmarking the unlisted entity against listed peers operating in the same sector, accounting for revenue scale, EBITDA margin differentials, and return on equity (ROE).</li>
                    <li><strong>Last Venture Funding Round Valuation:</strong> Utilizing the post-money valuation established by institutional venture capital (VC) or private equity (PE) lead investors in the most recent Series round.</li>
                </ul>

                <div class="blog-callout">
                    <div class="callout-icon">💡</div>
                    <div class="callout-text">
                        <strong>Institutional Principle:</strong> Unlisted share prices in the secondary grey market reflect real-time supply and demand among institutional holders and early ESOP sellers. Price discovery often leads public valuation multiples ahead of formal DRHP filings.
                    </div>
                </div>

                <h3>2. Key Financial Indicators to Scrutinize</h3>
                <p>Before deploying capital into unlisted shares, rigorous due diligence must be conducted across key audited statements:</p>
                <ol>
                    <li><strong>Revenue Run-Rate & Organic Growth CAGR:</strong> Look for sustainable, organic revenue growth over the past 3-5 fiscal years rather than one-time accounting gains.</li>
                    <li><strong>Path to Profitability & Free Cash Flow:</strong> In modern market cycles, institutional underwriters heavily favor companies with positive EBITDA or clearly defined breakeven timelines over pure cash-burn models.</li>
                    <li><strong>Cap Table Structure & ESOP Dilution:</strong> Evaluate promoter skin in the game, venture capital lock-in agreements, and the volume of fully diluted shares post-exercise of stock options.</li>
                    <li><strong>Contingent Liabilities & Legal Disclosures:</strong> Review notes to audited accounts for outstanding tax litigation or statutory claims that could impact final DRHP clearance with SEBI.</li>
                </ol>

                <h3>3. Liquidity Horizons and IPO Exit Timelines</h3>
                <p>Investing in unlisted equities should always be treated as a medium to long-term strategic allocation. Investors must evaluate the target company's DRHP filing timeline, statutory merchant banker appointments, and the regulatory 6-month pre-listing lock-in applicable to non-promoter shareholders under current SEBI regulations.</p>

                <h3>Conclusion</h3>
                <p>Pre-IPO equities offer the rare privilege of participating in India's leading enterprises before price expansion occurs upon public listing. By adhering to disciplined valuation metrics and transacting through trusted, institutional-grade facilitators like Meera Associates, investors can systematically mitigate private-market risks while positioning for generational wealth creation.</p>
            `
        },
        {
            id: "taxation-unlisted-shares-guide",
            title: "Taxation on Capital Gains from Unlisted Shares: Rules & Filing Strategies",
            category: "Taxation",
            image: "assets/resources/blog_taxation.jpg",
            date: "Sep 22, 2026",
            readTime: "6 min read",
            author: "Meera Associates Research Desk",
            featured: false,
            excerpt: "Understand STCG vs. LTCG tax rates on unlisted equities, holding period criteria, indexation status, advance tax deadlines, and set-off rules for Indian resident and NRI investors.",
            content: `
                <p class="lead-paragraph">Navigating the taxation of unlisted equities in India requires strict adherence to the provisions of the Income Tax Act, 1961. Because unlisted transactions occur off-market outside the purview of the Securities Transaction Tax (STT), specific tax rates and holding periods apply.</p>

                <h3>1. Classification: Short-Term vs. Long-Term Capital Gains</h3>
                <p>The classification of gains on unlisted shares depends strictly on the investor's holding period from the date of credit to the demat account:</p>
                <ul>
                    <li><strong>Short-Term Capital Gains (STCG):</strong> Applicable when unlisted shares are held for <strong>24 months or less</strong> prior to the date of transfer. STCG is added to total taxable income and taxed at the investor's applicable slab rate.</li>
                    <li><strong>Long-Term Capital Gains (LTCG):</strong> Applicable when unlisted shares are held for <strong>more than 24 months</strong>. Under rationalized tax provisions, LTCG on unlisted equities is taxed at <strong>12.5% without indexation benefits</strong> for resident individuals.</li>
                </ul>

                <div class="blog-callout">
                    <div class="callout-icon">📋</div>
                    <div class="callout-text">
                        <strong>Crucial Compliance Note:</strong> Because unlisted share trades are not subject to STT, the concessional listed rate of Section 112A does not apply until the shares are officially listed and traded on a recognized stock exchange (BSE/NSE).
                    </div>
                </div>

                <h3>2. Advance Tax Deadlines and Computation</h3>
                <p>Capital gains on unlisted share transfers trigger advance tax liabilities. Investors must deposit advance tax in accordance with standard quarterly tranches:</p>
                <ul>
                    <li>On or before June 15: 15% of estimated tax</li>
                    <li>On or before September 15: 45% of estimated tax</li>
                    <li>On or before December 15: 75% of estimated tax</li>
                    <li>On or before March 15: 100% of estimated tax</li>
                </ul>

                <h3>3. Set-Off and Carry Forward Provisions</h3>
                <p>Long-term capital losses from unlisted shares can be set off only against other long-term capital gains, and can be carried forward for up to 8 assessment years, provided the income tax return (ITR) is filed within statutory due dates.</p>

                <h3>Summary Recommendation</h3>
                <p>Maintaining meticulous documentation—including contract notes, bank debit statements, DIS counterfoils, and CMR client master reports—is critical for smooth tax assessments. Consult our advisory team to ensure seamless transaction records and tax-efficient portfolio positioning.</p>
            `
        },
        {
            id: "dematerialization-physical-shares-iepf",
            title: "Dematerialization of Physical Shares & IEPF Recovery: Complete Step-by-Step Roadmap",
            category: "Demat Processes",
            image: "assets/resources/blog_demat_iepf.jpg",
            date: "Sep 15, 2026",
            readTime: "8 min read",
            author: "Meera Associates Research Desk",
            featured: false,
            excerpt: "Millions in investor wealth remain locked in lost physical paper certificates or transferred to the IEPF. Here is the exact legal procedure to claim dividends and restore equity into modern Demat accounts.",
            content: `
                <p class="lead-paragraph">Physical share certificates represent a significant portion of historic Indian household wealth. However, under SEBI mandates, physical shares can no longer be transferred in paper format. Furthermore, if dividends remain unclaimed for seven consecutive years, both the unpaid dividends and underlying shares are statutorily transferred to the Investor Education and Protection Fund (IEPF).</p>

                <h3>1. Converting Physical Shares to Electronic Form (Dematerialization)</h3>
                <p>To convert physical paper certificates into electronic shares held securely in NSDL or CDSL:</p>
                <ol>
                    <li><strong>Submit Demat Request Form (DRF):</strong> Obtain and complete the DRF from your Depository Participant (DP), specifying folio number, certificate numbers, and distinctive numbers.</li>
                    <li><strong>Physical Certificate Submission:</strong> Surrender the original certificates marked 'SURRENDERED FOR DEMATERIALISATION' along with self-attested KYC documents.</li>
                    <li><strong>RTA Verification:</strong> The Registrar and Share Transfer Agent (RTA) verifies signatures, address, and name consistency before approving credit directly into your Demat account.</li>
                </ol>

                <div class="blog-callout">
                    <div class="callout-icon">⚖️</div>
                    <div class="callout-text">
                        <strong>Common Challenges Solved:</strong> Signature mismatches, name discrepancies after marriage or legal changes, lost original certificates requiring duplicate bond indemnities, and deceased shareholder succession claims.
                    </div>
                </div>

                <h3>2. Recovering Shares from the IEPF Authority (Form IEPF-5)</h3>
                <p>When shares and accumulated dividends have transferred to IEPF under Section 124(6) of the Companies Act, 2013:</p>
                <ul>
                    <li><strong>Filing E-Form IEPF-5:</strong> File the online claim through the Ministry of Corporate Affairs (MCA) portal.</li>
                    <li><strong>Submission of Verification Dossier:</strong> Submit the physical indemnity bond, advance stamped receipt, and original entitlement documents to the Nodal Officer of the company.</li>
                    <li><strong>Company Verification Report:</strong> The company's Nodal Officer submits a formal verification report to the IEPF Authority within 30 days.</li>
                    <li><strong>Direct Demat Credit:</strong> The IEPF Authority sanctions the release and transfers the shares directly to the claimant's verified Demat account, while accrued dividends are credited via NEFT/PFMS.</li>
                </ul>

                <h3>Professional Facilitation by Meera Associates</h3>
                <p>With four decades of direct operational expertise and thousands of successful recoveries, Meera Associates provides end-to-end legal assistance, liaising directly with RTAs, corporate secretaries, and the IEPF Authority to reclaim and dematerialize your family's rightful assets.</p>
            `
        },
        {
            id: "off-market-share-transfer-process",
            title: "How Off-Market Transactions Work: DIS Slips, Escrow, and CDSL/NSDL Settlement",
            category: "Off-Market Transactions",
            image: "assets/resources/blog_offmarket.jpg",
            date: "Sep 08, 2026",
            readTime: "5 min read",
            author: "Meera Associates Research Desk",
            featured: false,
            excerpt: "A transparent breakdown of how pre-IPO shares move between buyer and seller demat accounts via Delivery Instruction Slips (DIS), stamp duty compliance, and institutional escrow mechanisms.",
            content: `
                <p class="lead-paragraph">Unlike stock exchange trades which settle automatically via clearing corporations (ICCL/NSCCL), private market equity transactions are executed as bilateral off-market transfers through national depositories CDSL and NSDL. Understanding this settlement flow guarantees total security and peace of mind.</p>

                <h3>1. Key Components of an Off-Market Transfer</h3>
                <ul>
                    <li><strong>Client Master Report (CMR):</strong> The official depository document verifying the investor's Demat Account Number (BO ID / Client ID), Depository Participant (DP ID), and linked bank details.</li>
                    <li><strong>Delivery Instruction Slip (DIS):</strong> The physical or electronic authorization (via CDSL Easiest / NSDL Speed-e) directing the transfer of unlisted shares from the seller's account to the buyer's account.</li>
                    <li><strong>Reason Code for Transfer:</strong> Specifying off-market transfer reason codes such as 'Sale of Unlisted Securities' with verified consideration values.</li>
                    <li><strong>Government Stamp Duty:</strong> Statutory payment of 0.015% stamp duty levied on the transaction value as mandated under the Indian Stamp (Collection of Stamp-Duty through Stock Exchanges, Clearing Corporations and Depositories) Rules.</li>
                </ul>

                <h3>2. The Institutional Settlement Protocol</h3>
                <p>To eliminate counterparty default risks, professional firms enforce a strict escrow-style settlement process:</p>
                <ol>
                    <li><strong>Price & Quantity Lock-in:</strong> Both parties formalize the deal parameters through an institutional confirmation note.</li>
                    <li><strong>Fund Verification & Escrow Protection:</strong> Funds are routed through secure institutional banking channels to ensure simultaneous performance.</li>
                    <li><strong>DIS Submission & DP Execution:</strong> The seller's depository participant processes the transfer instruction using the buyer's validated CMR.</li>
                    <li><strong>Direct Demat Delivery (T+0 / T+1):</strong> The buyer receives instant SMS and email confirmation from CDSL/NSDL confirming credited holdings, visible in their standard broker app (Zerodha, Groww, ICICI Direct, HDFC Securities, etc.).</li>
                </ol>

                <p>Through Meera Associates, every transaction is backed by four decades of unblemished institutional integrity, ensuring 100% legal compliance and seamless digital depository delivery.</p>
            `
        },
        {
            id: "evaluating-private-market-companies",
            title: "Evaluating Private Market Companies: Key Financial Metrics Before IPO Filings",
            category: "Company Insights",
            image: "assets/resources/blog_company_eval.jpg",
            date: "Aug 29, 2026",
            readTime: "6 min read",
            author: "Meera Associates Research Desk",
            featured: false,
            excerpt: "What institutional investors look for in unlisted companies: revenue CAGR, EBITDA margins, promoter holding, ESOP dilution, and DRHP draft risk disclosures.",
            content: `
                <p class="lead-paragraph">Investing in unlisted companies requires a disciplined private equity mindset. Without daily ticker quotes or speculative intraday noise, successful investors evaluate foundational business moats and audited balance sheet strength.</p>

                <h3>1. The Quantitative Scorecard</h3>
                <ul>
                    <li><strong>Operating Cash Flow (CFO) vs. Net Profit:</strong> High reported accounting earnings mean little if the company consistently burns cash from operations due to bloated working capital or delayed receivables.</li>
                    <li><strong>EBITDA Margin Trajectory:</strong> Look for operating leverage where EBITDA margins expand faster than revenue growth as fixed overheads scale.</li>
                    <li><strong>Debt-to-Equity & Interest Coverage:</strong> Ensure the unlisted company is not excessively leveraged, particularly in high-interest-rate macroeconomic environments.</li>
                    <li><strong>Return on Capital Employed (ROCE):</strong> Superior businesses consistently deliver ROCE above 18-20%, demonstrating pricing power and capital allocation prowess.</li>
                </ul>

                <h3>2. Qualitative Moats and Governance Checks</h3>
                <p>Beyond the numbers, institutional investors examine corporate governance standards:</p>
                <ul>
                    <li><strong>Independent Board Composition:</strong> Presence of respected industry veterans and independent directors on audit and remuneration committees.</li>
                    <li><strong>Reputation of Statutory Auditors:</strong> Audits conducted by recognized Big Four or premier national chartered accounting firms provide essential verification of reported numbers.</li>
                    <li><strong>Related Party Transactions (RPT):</strong> Rigorously scrutinize transactions between the corporate entity and promoter-owned private firms.</li>
                </ul>

                <p>At Meera Associates, our research team performs exhaustive forensic balance sheet screenings before facilitating any unlisted equity to our institutional and private wealth network.</p>
            `
        },
        {
            id: "drhp-to-listing-journey-guide",
            title: "The DRHP to Listing Journey: What Happens Inside an Indian Mainboard IPO",
            category: "Private Markets",
            image: "assets/resources/blog_drhp_listing.jpg",
            date: "Aug 18, 2026",
            readTime: "7 min read",
            author: "Meera Associates Research Desk",
            featured: false,
            excerpt: "From Draft Red Herring Prospectus (DRHP) submission with SEBI to in-principle approval, RHP finalization, anchor allotment, and listing day discovery.",
            content: `
                <p class="lead-paragraph">The transition from an unlisted enterprise to a publicly traded corporation on the Bombay Stock Exchange (BSE) and National Stock Exchange (NSE) is a meticulous regulatory voyage governed by SEBI's Issue of Capital and Disclosure Requirements (ICDR) regulations.</p>

                <h3>Phase 1: DRHP Drafting and Filing</h3>
                <p>The company, alongside Merchant Bankers (Book Running Lead Managers), drafts the Draft Red Herring Prospectus (DRHP). This exhaustive document details the company's business model, audited financial statements for the past three fiscal years, capital structure, outstanding litigation, risk factors, and the proposed Objects of the Issue (fresh capital issue vs. Offer for Sale by existing shareholders).</p>

                <h3>Phase 2: Regulatory Review & In-Principle Approvals</h3>
                <p>SEBI and the stock exchanges review the DRHP, issuing observations and seeking clarificatory addenda. During this stage, the public has a 21-day window to submit comments. Once SEBI issues its final observation letter, the company has 12 months to open the public issue.</p>

                <h3>Phase 3: The Red Herring Prospectus (RHP) & Anchor Book</h3>
                <p>The RHP incorporates the formal price band and issue dates. One day prior to public opening, the Anchor Investor allocation opens for qualified institutional buyers (QIBs), establishing an initial pricing anchor and boosting retail confidence.</p>

                <h3>Phase 4: Bidding, Basis of Allotment & Listing</h3>
                <p>Following a 3-day bidding window, the basis of allotment is finalized, refunds/mandates are unblocked via UPI/ASBA, and shares are credited to successful allottees. On listing morning at 10:00 AM, the stock commences regular secondary trading.</p>

                <p>Investors holding pre-IPO shares prior to listing benefit from early price discovery, positioning their portfolios for significant listing day gains and long-term compound growth.</p>
            `
        }
    ],

    // --------------------------------------------------------------------------
    // 2. NEWS REPOSITORY (Latest First)
    // --------------------------------------------------------------------------
    news: [
        {
            id: "sebi-unlisted-secondary-trading-framework",
            headline: "SEBI Proposes Regulation of Grey Market for Unlisted Companies to Enhance Price Discovery",
            image: "assets/resources/news_sebi.jpg",
            summary: "Market regulator SEBI is preparing a regulatory framework for trading in unlisted and pre-IPO shares, aiming to introduce transparent price discovery, formal investor protections, and digital trade reporting.",
            date: "Sep 30, 2026",
            source: "Economic Times",
            sourceUrl: "https://economictimes.indiatimes.com/markets/ipos/fpos/sebi-proposes-regulation-of-grey-market-for-unlisted-companies-to-enhance-price-discovery-and-tax-revenue/articleshow/123442039.cms",
            category: "Unlisted Shares",
            readTime: "3 min read"
        },
        {
            id: "nse-unlisted-shares-pre-ipo-guide",
            headline: "Want NSE Shares Before the IPO? Here's How the Unlisted Market Works",
            image: "assets/resources/news_nse.jpg",
            summary: "With the National Stock Exchange (NSE) moving closer to its mega public listing, institutional and private investors evaluate buying unlisted shares through off-market transfers versus waiting for public bidding.",
            date: "Sep 28, 2026",
            source: "Economic Times",
            sourceUrl: "https://economictimes.indiatimes.com/markets/ipos/fpos/want-nse-shares-before-the-ipo-heres-how-the-unlisted-market-works/articleshow/133656338.cms",
            category: "Pre-IPO",
            readTime: "4 min read"
        },
        {
            id: "tata-capital-unlisted-shares-valuation",
            headline: "Tata Capital IPO: What Its Unlisted Share Trajectory Indicates for Investors",
            image: "assets/resources/news_volumes.jpg",
            summary: "Tata Capital launches its ₹17,200 crore issue, providing critical valuation signals for investors tracking unlisted shares and pre-IPO performance multiples across the NBFC sector.",
            date: "Sep 25, 2026",
            source: "Economic Times",
            sourceUrl: "https://economictimes.indiatimes.com/markets/ipos/fpos/tata-capital-to-open-ipo-for-retail-investors-on-october-6/articleshow/124162101.cms",
            category: "Companies",
            readTime: "4 min read"
        },
        {
            id: "zepto-pre-ipo-unlisted-valuation",
            headline: "Zepto Pre-IPO Shares See High Demand and Valuation Adjustments Ahead of Listing",
            image: "assets/resources/news_zepto.jpg",
            summary: "Quick-commerce unicorn Zepto navigates unlisted share price dynamics, SEBI pre-filing procedures, and private market liquidity as domestic institutions evaluate tech unicorn valuations.",
            date: "Sep 22, 2026",
            source: "Economic Times",
            sourceUrl: "https://economictimes.indiatimes.com/markets/stocks/news/zepto-shares-crash-30-in-unlisted-market-despite-sebi-nod-for-ipo-whats-cooking/articleshow/131418875.cms",
            category: "Pre-IPO",
            readTime: "3 min read"
        },
        {
            id: "boat-imagine-marketing-udrhp-filing",
            headline: "boAt Parent Files Updated UDRHP to Raise ₹1,500 Crore via Mainboard IPO",
            image: "assets/resources/news_defense.jpg",
            summary: "Wearables and audio brand Imagine Marketing (boAt) files updated pre-filing draft papers with SEBI, detailing a ₹500 crore fresh issue and ₹1,000 crore OFS, backed by a return to profitability.",
            date: "Sep 18, 2026",
            source: "Economic Times",
            sourceUrl: "https://economictimes.indiatimes.com/tech/startups/boats-parent-cuts-ipo-size-to-rs-1500-crore-shows-udrhp/articleshow/124894892.cms",
            category: "IPO",
            readTime: "3 min read"
        },
        {
            id: "hero-motors-ipo-drhp-valuation",
            headline: "Hero Motors Public Issue: Key DRHP Details, Pre-IPO Valuations and Issue Status",
            image: "assets/resources/news_hero.jpg",
            summary: "Hero Motors advances its initial public offering roadmap, seeing strong subscription demand and unofficial grey market interest to fund manufacturing capacity expansion and debt reduction.",
            date: "Sep 15, 2026",
            source: "Economic Times",
            sourceUrl: "https://economictimes.indiatimes.com/markets/ipos/fpos/hero-motors-ipo-day-3-gmp-at-7-check-subscription-status-and-key-details-should-you-subscribe/articleshow/134324730.cms",
            category: "Companies",
            readTime: "4 min read"
        },
        {
            id: "unlisted-shares-pre-ipo-essential-rules",
            headline: "3 Rules Every Investor Must Know Before Buying Unlisted Shares of Pre-IPO Companies",
            image: "assets/resources/news_rbi.jpg",
            summary: "Financial Express outlines essential due-diligence rules before purchasing unlisted shares of IPO-bound firms like Tata Capital and NSE, focusing on lock-in periods, liquidity, and intrinsic valuations.",
            date: "Sep 10, 2026",
            source: "Financial Express",
            sourceUrl: "https://www.financialexpress.com/market/ipo-news-investment-alert-three-rules-every-investor-must-know-before-buying-unlisted-shares-of-tata-capital-ipo-nse-ipo-3956291/",
            category: "Private Markets",
            readTime: "4 min read"
        },
        {
            id: "how-to-buy-unlisted-shares-guide",
            headline: "How to Buy Unlisted Shares of Pre-IPO Companies: Process, Due Diligence & Risks",
            image: "assets/resources/news_mca.jpg",
            summary: "A detailed institutional breakdown by LiveMint on how investors participate in pre-IPO equity, demat credit verification, off-market counterparty mechanisms, and balancing risk vs reward.",
            date: "Sep 05, 2026",
            source: "LiveMint",
            sourceUrl: "https://www.livemint.com/market/stock-market-news/how-to-buy-unlisted-shares-of-pre-ipo-companies-11626156030978.html",
            category: "Market Updates",
            readTime: "4 min read"
        }
    ],

    // --------------------------------------------------------------------------
    // 3. VIDEOS REPOSITORY (Official Meera Associates YouTube Channel)
    // Channel: https://youtube.com/@meeraassociates-j2z
    // --------------------------------------------------------------------------
    videos: [
        // ----------------------------------------------------------------------
        // SET 1: 3 Long Videos + 1 Short
        // ----------------------------------------------------------------------
        {
            id: "bfGEgWXLpK8",
            type: "long",
            title: "Inside JSR Dynamics: Nagpur's Defense Tech & Guided Weapons Pioneer",
            duration: "3:29",
            date: "Oct 2026",
            category: "Defense & Tech",
            description: "Comprehensive institutional review of JSR Dynamics, developing indigenous guided weapons, missile sub-systems, and aerospace hardware.",
            youtubeUrl: "https://www.youtube.com/watch?v=bfGEgWXLpK8"
        },
        {
            id: "AD8UBjdWxh0",
            type: "long",
            title: "InCred Capital Unlisted Shares Review | What Does InCred Capital Do?",
            duration: "3:10",
            date: "Sep 2026",
            category: "NBFC & Financials",
            description: "Detailed breakdown of InCred Capital's financial ecosystem, merchant banking footprint, wealth management AUM, and valuation multiples.",
            youtubeUrl: "https://www.youtube.com/watch?v=AD8UBjdWxh0"
        },
        {
            id: "t36saugd_d4",
            type: "long",
            title: "Indian Gold Metaverse Share Price | Gold-Tech Stock Analysis",
            duration: "3:26",
            date: "Sep 2026",
            category: "Technology",
            description: "Deep dive into Indian Gold Metaverse, evaluating digital bullion registry platforms, tokenized precious metals infrastructure, and demand.",
            youtubeUrl: "https://www.youtube.com/watch?v=t36saugd_d4"
        },
        {
            id: "MF44ImcIPic",
            type: "short",
            title: "Do Unlisted Shares Give Dividends? Payouts & Profit Rules 💰",
            duration: "0:45",
            date: "Oct 2026",
            category: "Dividends & Payouts",
            description: "Do unlisted companies pay dividends? Learn how payouts, corporate actions, and profit distributions work for unlisted equity holders.",
            youtubeUrl: "https://youtube.com/shorts/MF44ImcIPic?feature=share"
        },

        // ----------------------------------------------------------------------
        // SET 2: 3 Long Videos + 1 Short
        // ----------------------------------------------------------------------
        {
            id: "Zk-UwLQQgaA",
            type: "long",
            title: "Greenzo Energy Share Price | Green Hydrogen & Solar EPC",
            duration: "4:18",
            date: "Sep 2026",
            category: "Renewables & Solar",
            description: "Exploring Greenzo Energy's indigenous hydrogen electrolyzer innovations, expanding solar EPC pipeline, and pre-IPO valuation metrics.",
            youtubeUrl: "https://www.youtube.com/watch?v=Zk-UwLQQgaA"
        },
        {
            id: "LHUHCWqXshA",
            type: "long",
            title: "World's 1st Fully Solar Airport! CIAL Business Model & Unlisted Shares",
            duration: "3:39",
            date: "Sep 2026",
            category: "Infrastructure",
            description: "Analysis of Cochin International Airport Limited (CIAL), its historic 100% solar energy self-sufficiency, dividend track record, and liquidity.",
            youtubeUrl: "https://www.youtube.com/watch?v=LHUHCWqXshA"
        },
        {
            id: "Ul_j7yuh15w",
            type: "long",
            title: "Prisma AI Share Price | Visual AI & Deep Learning Stock",
            duration: "4:14",
            date: "Aug 2026",
            category: "Defense & Tech",
            description: "An overview of Prisma AI's computer vision algorithms, enterprise security analytics, behavioural surveillance deployments, and financials.",
            youtubeUrl: "https://www.youtube.com/watch?v=Ul_j7yuh15w"
        },
        {
            id: "FuB7xBiXixc",
            type: "short",
            title: "NRI Investment in Unlisted & Pre-IPO Shares: FEMA Rules 🌐",
            duration: "0:52",
            date: "Oct 2026",
            category: "NRI Advisory",
            description: "Can NRIs invest in Indian unlisted equities? FEMA compliance, NRE/NRO Demat account regulations, and repatriation guidelines explained.",
            youtubeUrl: "https://youtube.com/shorts/FuB7xBiXixc?feature=share"
        },

        // ----------------------------------------------------------------------
        // SET 3: 3 Long Videos + 1 Short
        // ----------------------------------------------------------------------
        {
            id: "43Fei-XOr6A",
            type: "long",
            title: "Hinduja Leyland Finance Share Price | Top Vehicle NBFC",
            duration: "4:37",
            date: "Aug 2026",
            category: "NBFC & Financials",
            description: "Evaluating Hinduja Leyland Finance's commercial vehicle financing book, branch distribution, asset quality ratios, and IPO preparations.",
            youtubeUrl: "https://www.youtube.com/watch?v=43Fei-XOr6A"
        },
        {
            id: "G5sez6qJ1kQ",
            type: "long",
            title: "Onix Renewable Share Price Today | Pre-IPO Review",
            duration: "3:39",
            date: "Aug 2026",
            category: "Renewables & Solar",
            description: "Detailed look at Onix Renewable's integrated wind and solar generation capacity, transmission connectivity, and pre-IPO trading interest.",
            youtubeUrl: "https://www.youtube.com/watch?v=G5sez6qJ1kQ"
        },
        {
            id: "nb3RZxsgaQM",
            type: "long",
            title: "Carrier Air Conditioning Share Price Today | Pre-IPO",
            duration: "4:02",
            date: "Aug 2026",
            category: "Consumer Durables",
            description: "HVAC industry market leader Carrier Air Conditioning: balance sheet health, institutional heritage, manufacturing capabilities, and trading dynamics.",
            youtubeUrl: "https://www.youtube.com/watch?v=nb3RZxsgaQM"
        },
        {
            id: "8wTUSUvhBK8",
            type: "short",
            title: "Volatility in Unlisted Shares: Risk & Price Movements Explained 📉",
            duration: "0:48",
            date: "Sep 2026",
            category: "Risk & Volatility",
            description: "How volatile are unlisted shares compared to public markets? Institutional analysis of liquidity, bid-ask spreads, and price stability.",
            youtubeUrl: "https://youtube.com/shorts/8wTUSUvhBK8?feature=share"
        },

        // ----------------------------------------------------------------------
        // SET 4: 3 Long Videos + 1 Short
        // ----------------------------------------------------------------------
        {
            id: "VEBVgBZyD-Y",
            type: "long",
            title: "Inox Clean Energy Pre-IPO Shares | How to Buy Safely",
            duration: "3:52",
            date: "Aug 2026",
            category: "Renewables & Solar",
            description: "Step-by-step institutional guide on understanding Inox Clean Energy's power generation portfolio, tariff stability, and off-market DIS transfer.",
            youtubeUrl: "https://www.youtube.com/watch?v=VEBVgBZyD-Y"
        },
        {
            id: "0zQ-m8UtV1s",
            type: "long",
            title: "Goa Shipyard Share Price Today | Defence PSU Stock",
            duration: "4:08",
            date: "Jul 2026",
            category: "Defense & Tech",
            description: "Defence public sector enterprise Goa Shipyard: order book execution for the Indian Navy & Coast Guard, and unlisted share value discovery.",
            youtubeUrl: "https://www.youtube.com/watch?v=0zQ-m8UtV1s"
        },
        {
            id: "3ZXpxKfiaME",
            type: "long",
            title: "Hero FinCorp Share Price Today | Pre-IPO Stock",
            duration: "4:10",
            date: "Jul 2026",
            category: "NBFC & Financials",
            description: "Examining Hero FinCorp's retail lending franchise, two-wheeler financing market leadership, SME loan book, and upcoming mega public issue.",
            youtubeUrl: "https://www.youtube.com/watch?v=3ZXpxKfiaME"
        },
        {
            id: "u1XOrgdxSyA",
            type: "short",
            title: "What Is Price Discovery in Unlisted Shares? How Pricing Works 📈",
            duration: "0:50",
            date: "Sep 2026",
            category: "Market Education",
            description: "Without a live stock exchange ticker, how are pre-IPO share prices determined? Valuation multiples, peer comparisons, and secondary deals.",
            youtubeUrl: "https://youtube.com/shorts/u1XOrgdxSyA?feature=share"
        },

        // ----------------------------------------------------------------------
        // SET 5: 3 Long Videos + 1 Short
        // ----------------------------------------------------------------------
        {
            id: "wYAjen3so68",
            type: "long",
            title: "Hero Motors Share Price Today | Pre-IPO Stock",
            duration: "4:48",
            date: "Jul 2026",
            category: "Auto & Engineering",
            description: "Auto-component and e-mobility powertrain specialist Hero Motors: global OEM partnerships, export margins, and listing roadmap.",
            youtubeUrl: "https://www.youtube.com/watch?v=wYAjen3so68"
        },
        {
            id: "ccBXVB-5d14",
            type: "long",
            title: "ASK Investment Share Price Today | PMS & AIF Stock",
            duration: "4:46",
            date: "Jul 2026",
            category: "NBFC & Financials",
            description: "Asset & wealth management powerhouse ASK Investment Managers: discretionary PMS growth, AIF deployments, and unlisted valuation multiples.",
            youtubeUrl: "https://www.youtube.com/watch?v=ccBXVB-5d14"
        },
        {
            id: "uvJ211ACW-Y",
            type: "long",
            title: "Zepto Share Price Today | Quick Commerce Pre-IPO",
            duration: "3:39",
            date: "Jun 2026",
            category: "Technology",
            description: "Quick-commerce unicorn Zepto: dark-store micro-fulfillment economics, GMV scaling, institutional funding, and domestic IPO roadmap.",
            youtubeUrl: "https://www.youtube.com/watch?v=uvJ211ACW-Y"
        },
        {
            id: "HqMcDMYlj9A",
            type: "short",
            title: "Why Do Big HNIs & Anchor Investors Choose Unlisted Shares? 💼",
            duration: "0:55",
            date: "Sep 2026",
            category: "HNI & Institutional",
            description: "Why family offices, private equity funds, and ultra-HNIs allocate heavily to late-stage pre-IPO equities before public listings.",
            youtubeUrl: "https://youtube.com/shorts/HqMcDMYlj9A?feature=share"
        },

        // ----------------------------------------------------------------------
        // SET 6: 3 Long Videos + 1 Short
        // ----------------------------------------------------------------------
        {
            id: "xYWFVTdmJlY",
            type: "long",
            title: "Indian Gas Exchange Share Price Today | Pre-IPO Stock",
            duration: "4:26",
            date: "Jun 2026",
            category: "Infrastructure",
            description: "India's premier automated gas delivery platform: natural gas trading volume expansions, monopoly market dynamics, and unlisted price movements.",
            youtubeUrl: "https://www.youtube.com/watch?v=xYWFVTdmJlY"
        },
        {
            id: "3C24-s3DXWM",
            type: "long",
            title: "Garuda Aerospace Share Price Today | Pre-IPO Drone Stock",
            duration: "3:39",
            date: "Jun 2026",
            category: "Defense & Tech",
            description: "Agri-drone and defense UAV pioneer Garuda Aerospace: DGCA type certifications, defense supply contracts, and pre-IPO valuation metrics.",
            youtubeUrl: "https://www.youtube.com/watch?v=3C24-s3DXWM"
        },
        {
            id: "pft7YBLy9ug",
            type: "long",
            title: "HDFC Securities Share Price Today | Pre-IPO Stock",
            duration: "3:36",
            date: "May 2026",
            category: "NBFC & Financials",
            description: "HDFC Group's equity broking powerhouse: active trader base, digital investment platforms, dividend payouts, and unlisted market demand.",
            youtubeUrl: "https://www.youtube.com/watch?v=pft7YBLy9ug"
        },
        {
            id: "njOnyFt8koM",
            type: "short",
            title: "What Are Unlisted Shares? Pre-IPO & Private Market Basics 📚",
            duration: "0:45",
            date: "Aug 2026",
            category: "Unlisted Basics",
            description: "A clear beginner's guide to unlisted shares, private equity market fundamentals, and how retail investors can safely participate.",
            youtubeUrl: "https://youtube.com/shorts/njOnyFt8koM?feature=share"
        },

        // ----------------------------------------------------------------------
        // SET 7: 3 Long Videos + 1 Short
        // ----------------------------------------------------------------------
        {
            id: "0zQ-m8UtV1s",
            type: "long",
            title: "Mohan Meakin Limited | Heritage Brewery & FMCG Analysis",
            duration: "4:15",
            date: "May 2026",
            category: "Consumer Durables",
            description: "Heritage FMCG brand Mohan Meakin (Old Monk, Golden Eagle): zero debt balance sheet, real estate assets, and steady unlisted market demand.",
            youtubeUrl: "https://www.youtube.com/watch?v=0zQ-m8UtV1s"
        },
        {
            id: "AD8UBjdWxh0",
            type: "long",
            title: "Manipal Housing Finance (MHFSL) Unlisted Shares Review",
            duration: "3:50",
            date: "May 2026",
            category: "NBFC & Financials",
            description: "Affordable housing finance provider backed by the Manipal Group: loan book asset quality, net interest margins, and pre-IPO share trade rates.",
            youtubeUrl: "https://www.youtube.com/watch?v=AD8UBjdWxh0"
        },
        {
            id: "bfGEgWXLpK8",
            type: "long",
            title: "Goodluck Defence & Aerospace Unlisted Share Valuation",
            duration: "4:25",
            date: "Apr 2026",
            category: "Defense & Tech",
            description: "High-precision forged defense components, aerospace sub-assemblies, artillery programs, and unlisted secondary market order depth.",
            youtubeUrl: "https://www.youtube.com/watch?v=bfGEgWXLpK8"
        },
        {
            id: "LJUMBeM4ekU",
            type: "short",
            title: "What Should You Know Before Investing in Pre-IPO Shares? ⚠️",
            duration: "0:58",
            date: "Aug 2026",
            category: "Due Diligence",
            description: "Essential checklist before buying unlisted shares: DRHP filings, lock-in periods, promoter holding, and authentic DIS Demat transfers.",
            youtubeUrl: "https://youtube.com/shorts/LJUMBeM4ekU?feature=share"
        },

        // ----------------------------------------------------------------------
        // SET 8: 3 Long Videos + 1 Short
        // ----------------------------------------------------------------------
        {
            id: "wYAjen3so68",
            type: "long",
            title: "Tata Technologies Pre-IPO Journey & Lessons for Investors",
            duration: "4:50",
            date: "Apr 2026",
            category: "Auto & Engineering",
            description: "A retrospective case study on Tata Technologies: ER&D growth, anchor institutional book building, and historic listing day returns for unlisted holders.",
            youtubeUrl: "https://www.youtube.com/watch?v=wYAjen3so68"
        },
        {
            id: "ccBXVB-5d14",
            type: "long",
            title: "SBI Funds Management Unlisted Shares & AMC Economics",
            duration: "3:58",
            date: "Apr 2026",
            category: "NBFC & Financials",
            description: "India's largest asset management company: recurring equity SIP inflows, AUM market share, profitability margins, and upcoming mega IPO.",
            youtubeUrl: "https://www.youtube.com/watch?v=ccBXVB-5d14"
        },
        {
            id: "xYWFVTdmJlY",
            type: "long",
            title: "National Stock Exchange (NSE) Unlisted Shares Monopoly Analysis",
            duration: "4:32",
            date: "Mar 2026",
            category: "Infrastructure",
            description: "The world's largest derivatives exchange: high return on equity, market share dominance, clearing corporation revenues, and off-market block lots.",
            youtubeUrl: "https://www.youtube.com/watch?v=xYWFVTdmJlY"
        },
        {
            id: "HqMcDMYlj9A",
            type: "short",
            title: "Why Big HNIs & Anchor Investors Choose Pre-IPO Equities 🚀",
            duration: "0:55",
            date: "Aug 2026",
            category: "Wealth Advisory",
            description: "Strategic capital allocation, entry valuation discipline, and how institutional investors evaluate exit multiples before IPO day.",
            youtubeUrl: "https://youtube.com/shorts/HqMcDMYlj9A?feature=share"
        }
    ]
};

// Expose globally for both vanilla scripts and module bundlers if needed
if (typeof window !== 'undefined') {
    window.resourcesData = resourcesData;
}
if (typeof module !== 'undefined' && module.exports) {
    module.exports = resourcesData;
}
