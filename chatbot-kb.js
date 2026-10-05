/**
 * MEERA ASSOCIATES - CHATBOT KNOWLEDGE BASE (chatbot-kb.js)
 * Administrator / Knowledge Base configuration for Meera AI Assistant.
 * Edit this file to add companies, FAQs, processes, or contact information.
 */

window.MEERA_KB = {
    brand: {
        name: "Meera Associates",
        tagline: "Making Unlisted Share Transactions Simple & Hassle-Free",
        focus: "Unlisted Shares & Pre-IPO Shares",
        positioning: "Meera Associates assists buyers and sellers with the process of transacting in unlisted and pre-IPO shares.",
        disclaimer: "Information provided by Meera AI Assistant is for educational and procedural purposes only. It does not constitute investment advice, stock recommendations, or guaranteed returns. Please conduct independent research and due diligence."
    },

    contact: {
        phones: [
            { label: "Executive Desk", number: "+91 8983388881", tel: "+918983388881" },
            { label: "Advisory Desk", number: "+91 8888415222", tel: "+918888415222" },
            { label: "Registered Office", number: "+91 9028345588", tel: "+919028345588" }
        ],
        whatsapp: {
            number: "+91 89833 88881",
            display: "Chat on WhatsApp",
            link: "https://wa.me/918983388881?text=Hello%20Meera%20Associates,%20I%20am%20interested%20in%20Unlisted%20Shares%20assistance."
        },
        emails: [
            "contact.meeraassociates@gmail.com"
        ],
        address: "Meera Associates, Corporate Headquarters, Maharashtra, India",
        timings: "Monday – Saturday: 9:30 AM – 7:00 PM IST"
    },

    // Step-by-Step Buying Process (7 Steps)
    buyingProcess: [
        {
            step: "01",
            title: "Enquiry",
            desc: "Customer selects the company and enquires about availability and indicative pricing with our desk."
        },
        {
            step: "02",
            title: "Price Discovery",
            desc: "The applicable transaction price and available lot quantity are discussed based on prevailing private market order depth."
        },
        {
            step: "03",
            title: "Offer / Transaction Details",
            desc: "Formal transaction term sheet and deal confirmation details are provided to the buyer."
        },
        {
            step: "04",
            title: "KYC Verification",
            desc: "Collection and verification of required KYC documents (PAN, Aadhaar/ID proof, address verification)."
        },
        {
            step: "05",
            title: "Demat Details",
            desc: "Collection of buyer's Demat Client Master List (CML) with active status stamp to map the electronic beneficiary ID."
        },
        {
            step: "06",
            title: "Payment & Settlement",
            desc: "Funds are deposited via approved banking channels (RTGS/NEFT/IMPS) against transaction verification."
        },
        {
            step: "07",
            title: "Share Delivery",
            desc: "Shares are transferred via NSDL/CDSL off-market transfer directly into your Demat account, confirmed by official statement."
        }
    ],

    // Step-by-Step Selling Process (8 Steps)
    sellingProcess: [
        {
            step: "01",
            title: "Share / Company Details",
            desc: "Seller provides company name and total unlisted share quantity available for sale."
        },
        {
            step: "02",
            title: "Demat Holding Proof",
            desc: "Provide current Demat holding statement / CML verifying unencumbered ownership of shares."
        },
        {
            step: "03",
            title: "Price Discovery",
            desc: "Receive competitive liquidation valuation based on current institutional and private buyer demand."
        },
        {
            step: "04",
            title: "KYC Verification",
            desc: "Verification of seller's identity, PAN, and linked bank account for payout."
        },
        {
            step: "05",
            title: "Demat Verification",
            desc: "Review and verification of depository details and preparation of Delivery Instruction Slip (DIS / e-DIS)."
        },
        {
            step: "06",
            title: "Transaction Confirmation",
            desc: "Signing of transaction trade agreement and formal execution order."
        },
        {
            step: "07",
            title: "Off-Market Transfer",
            desc: "Transfer of agreed shares to Meera Associates designated clearing Demat beneficiary ID."
        },
        {
            step: "08",
            title: "Same-Day Settlement",
            desc: "Net transaction proceeds credited directly into seller's registered bank account within 24 hours of transfer confirmation."
        }
    ],

    // KYC & Demat Requirements
    kycDocuments: [
        { doc: "PAN Card", desc: "Mandatory permanent account number copy (self-attested) for all capital market transactions." },
        { doc: "Aadhaar / Passport", desc: "Valid government-issued photo identity and permanent residential address proof." },
        { doc: "Demat Client Master List (CML)", desc: "Signed/stamped CML with active DP ID & Client ID matching PAN." },
        { doc: "Cancelled Cheque / Bank Statement", desc: "Proof of linked bank account matching the Demat holder name for banking settlement." },
        { doc: "Board Resolution / Authority Letter", desc: "Applicable only for Corporate, HUF, or Partnership accounts." }
    ],

    // Available Companies Database
    companies: [
        {
            name: "National Stock Exchange of India (NSE)",
            aliases: ["nse", "nse india", "national stock exchange"],
            industry: "Financial Market Infrastructure & Stock Exchange",
            overview: "India's premier stock exchange and largest derivatives exchange globally by contract volume, operating sophisticated electronic trading across equity, debt, and derivative segments.",
            highlights: [
                "Dominant 90%+ market share in Indian equity derivatives.",
                "Robust transaction revenue model, clearing services, and index licensing (NIFTY).",
                "High return on equity with zero-debt capital structure."
            ],
            availableInfo: "Institutional and high-net-worth investor liquidity available in private market lots.",
            website: "https://www.nseindia.com"
        },
        {
            name: "Tata Technologies Limited",
            aliases: ["tata tech", "tata technologies", "tatatech"],
            industry: "Engineering, Research & Development (ER&D)",
            overview: "A global engineering services company offering product development and digital enterprise solutions primarily to the automotive, aerospace, and industrial heavy machinery sectors.",
            highlights: [
                "Strategic subsidiary of Tata Motors with marquee global OEM clients.",
                "Deep capabilities in Electric Vehicle (EV) platforms and software-defined vehicles.",
                "Global delivery presence across North America, Europe, and Asia-Pacific."
            ],
            availableInfo: "High trading interest and institutional liquidity in unlisted lots.",
            website: "https://www.tatatechnologies.com"
        },
        {
            name: "Reliance Retail Ventures Limited",
            aliases: ["reliance retail", "rrvl", "reliance", "jio mart"],
            industry: "Organized Retail & Omnichannel Commerce",
            overview: "The retail arm of Reliance Industries Limited and India's largest retailer by reach, scale, revenue, and profitability across grocery, consumer electronics, fashion, and lifestyle.",
            highlights: [
                "Network of 18,000+ physical stores spanning tier-1 to tier-4 cities.",
                "Strong digital commerce integration through JioMart and Ajio.",
                "Backed by global sovereign wealth funds and private equity leaders."
            ],
            availableInfo: "Off-market transaction lots available subject to daily price discovery.",
            website: "https://www.relianceretail.com"
        },
        {
            name: "HDB Financial Services Limited",
            aliases: ["hdb", "hdb financial", "hdb finance", "hdfc hdb"],
            industry: "Non-Banking Financial Company (NBFC)",
            overview: "A leading diversified retail-focused NBFC and a key subsidiary of HDFC Bank, catering to both retail consumers and micro, small, and medium enterprises (MSMEs).",
            highlights: [
                "Backed by HDFC Bank's unparalleled corporate governance and risk management.",
                "Expansive branch network of over 1,400 branches across India.",
                "Comprehensive lending portfolio including vehicle loans, consumer durables, and loan against property."
            ],
            availableInfo: "Regular off-market order flow and private trade interest.",
            website: "https://www.hdbfs.com"
        },
        {
            name: "Swiggy Limited",
            aliases: ["swiggy", "bundl technologies", "instamart"],
            industry: "Consumer Tech / Food Delivery & Quick Commerce",
            overview: "One of India's leading consumer convenience platforms, pioneering on-demand food delivery, quick commerce grocery fulfillment via Instamart, and dining services.",
            highlights: [
                "Duopoly position in India's booming hyper-local delivery market.",
                "Rapid scaling and margin improvement in quick-commerce (Instamart).",
                "Strong membership ecosystem with millions of Swiggy One subscribers."
            ],
            availableInfo: "Pre-IPO share liquidity available in private market blocks.",
            website: "https://www.swiggy.com"
        },
        {
            name: "BoAt (Imagine Marketing Limited)",
            aliases: ["boat", "imagine marketing", "boat lifestyle"],
            industry: "Consumer Electronics & Hearables",
            overview: "India's #1 digital-first audio and wearables brand, commanding market leadership in wireless earphones, headphones, soundbars, and smartwatches.",
            highlights: [
                "Dominant market share in India's True Wireless Stereo (TWS) segment.",
                "Expanding domestic manufacturing footprints under the Make-in-India initiative.",
                "High brand recall and consumer engagement among millennials and Gen-Z."
            ],
            availableInfo: "Periodic unlisted share lots available for institutional & retail buyers.",
            website: "https://www.boat-lifestyle.com"
        },
        {
            name: "Sterlite Power Transmission Limited",
            aliases: ["sterlite", "sterlite power"],
            industry: "Power Transmission Infrastructure",
            overview: "A leading private power transmission infrastructure developer and solutions provider operating across India and Brazil, delivering high-complexity transmission corridors.",
            highlights: [
                "Portfolio of multi-gigawatt transmission line assets.",
                "Specialized master system integration (MSI) and subsea power cable capabilities.",
                "Integral player in evacuating renewable green energy into national power grids."
            ],
            availableInfo: "Off-market trade facilitation available for buyers and sellers.",
            website: "https://www.sterlitepower.com"
        },
        {
            name: "Goa Shipyard Limited",
            aliases: ["goa shipyard", "gsl", "goa shipyard limited"],
            industry: "Defence Shipbuilding & Marine Engineering",
            isin: "INE178Z01013",
            faceValue: "₹10.00",
            overview: "Premier Miniratna Category-I Defence PSU under the Ministry of Defence, Government of India. Designs and builds advanced stealth frigates, offshore patrol vessels, and fast interceptor craft.",
            highlights: [
                "68+ years of maritime excellence, established in 1957; 200+ warships and 100+ interceptor boats constructed.",
                "FY 2025–26 Gross Revenue: ₹4,004.41 Cr (+25.53% YoY), Revenue from Operations: ₹3,764.30 Cr (+32.05% YoY).",
                "FY 2025–26 PAT: ₹331.45 Cr (+14.91% YoY), Gross Margin (EBITDA): ₹522.40 Cr, EPS: ₹28.47.",
                "Leadership: Shri Brajesh Kumar Upadhyay (CMD), Rear Admiral Nelson A. J. D'Souza (Director Operations), Shri Amit Satija (Govt Nominee Director)."
            ],
            availableInfo: "Direct depository transfer (NSDL / CDSL) and off-market liquidity facilitation available.",
            website: "https://www.goashipyard.in"
        },
        {
            name: "OYO (Oravel Stays Limited)",
            aliases: ["oyo", "oyo rooms", "oravel stays"],
            industry: "Hospitality & Travel Technology",
            overview: "A global hospitality technology platform connecting travelers with quality standardized budget and mid-scale hotels, vacation homes, and serviced accommodations.",
            highlights: [
                "Footprint spanning 35+ countries with significant presence in India, SE Asia, and Europe.",
                "Asset-light tech-driven patron onboarding model.",
                "Improving operational EBITDA and streamlined corporate structure."
            ],
            availableInfo: "Private secondary share transfers executed through standard off-market routes.",
            website: "https://www.oyorooms.com"
        },
        {
            name: "Hexaware Technologies Limited",
            aliases: ["hexaware", "hexaware tech"],
            industry: "IT Services & Digital Transformation",
            overview: "A global IT and digital solutions provider specializing in cloud migration, automation, artificial intelligence, and customer experience transformation across banking, healthcare, and insurance.",
            highlights: [
                "Backed by global private equity powerhouse Carlyle Group.",
                "Strong recurring revenue with blue-chip enterprise clients in US and Europe.",
                "High operating margins and consistent multi-year revenue growth."
            ],
            availableInfo: "Off-market transactions supported through Demat transfers.",
            website: "https://www.hexaware.com"
        },
        {
            name: "Studds Accessories Limited",
            aliases: ["studds", "studds helmets"],
            industry: "Automotive Safety & Motorcycle Accessories",
            overview: "The world's largest two-wheeler helmet manufacturer by volume, producing premium and utility motorcycle helmets and lifestyle riding gear under the STUDDS and SMK brands.",
            highlights: [
                "Export footprint in over 50 countries worldwide.",
                "State-of-the-art automated manufacturing facilities in Haryana, India.",
                "Strong balance sheet with consistent profitability and brand equity."
            ],
            availableInfo: "Available in private market lots through Meera Associates advisory desk.",
            website: "https://www.studds.com"
        },
        {
            name: "Merino Industries Limited",
            aliases: ["merino", "merino laminates"],
            industry: "Interior Infrastructure & Surface Decor",
            overview: "A premier manufacturer of decorative laminates, compact panels, solid surfaces, and pre-laminated boards with an international presence across 80+ nations.",
            highlights: [
                "Decades-long heritage and trusted brand recall in interior design.",
                "Vertically integrated manufacturing including agro-business operations.",
                "Consistent financial stability, low leverage, and institutional interest."
            ],
            availableInfo: "Unlisted shares transacted via standardized private depository routes.",
            website: "https://www.merinoindia.com"
        },
        {
            name: "Syngenta India Limited",
            aliases: ["syngenta", "syngenta india"],
            industry: "Agrochemicals & Crop Protection",
            overview: "An agricultural technology company providing innovative crop protection chemicals, seeds, and digital agronomy services to enhance farm productivity across India.",
            highlights: [
                "Subsidiary of Swiss-headquartered global agribusiness leader Syngenta AG.",
                "Extensive rural distribution network and proprietary crop care formulations.",
                "Long operating history and steady cash flow generation."
            ],
            availableInfo: "Facilitated through private depository transfer protocols.",
            website: "https://www.syngenta.co.in"
        }
    ],

    // Comprehensive FAQs
    faqs: [
        {
            id: "what-are-unlisted-shares",
            q: "What are unlisted shares?",
            keywords: ["what are unlisted", "define unlisted", "meaning of unlisted", "unlisted share kya hai", "unlisted share definition"],
            a: "Unlisted shares are equity shares of companies that are not currently traded or listed on public stock exchanges such as the NSE or BSE. These shares are transacted through private or off-market depository mechanisms between eligible buyers and sellers, subject to applicable regulatory guidelines, KYC, and depository procedures."
        },
        {
            id: "what-are-pre-ipo-shares",
            q: "What are pre-IPO shares?",
            keywords: ["pre ipo", "pre-ipo", "what is pre ipo", "pre ipo shares kya hota hai", "before ipo"],
            a: "Pre-IPO shares refer to equity shares of private or late-stage companies acquired before the company issues an Initial Public Offering (IPO) or lists on a public stock exchange. This allows investors to participate in established enterprises prior to public market trading, subject to customary lock-in periods and market risks."
        },
        {
            id: "how-to-buy",
            q: "How can I buy unlisted shares?",
            keywords: ["how to buy", "buy process", "purchase shares", "unlisted share kaise buy kare", "buying steps"],
            a: "Buying unlisted shares with Meera Associates follows a transparent 7-step process:\n1. Enquiry: Choose company & verify indicative pricing.\n2. Price Discovery: Confirm unit price & desired lot quantity.\n3. Offer Details: Review transaction terms.\n4. KYC Verification: Submit PAN & identity proof.\n5. Demat Details: Submit stamped Demat Client Master List (CML).\n6. Payment & Settlement: Wire funds via verified banking channels (RTGS/NEFT).\n7. Share Delivery: Shares are credited directly into your Demat account within 24 hours of settlement."
        },
        {
            id: "how-to-sell",
            q: "How can I sell unlisted shares?",
            keywords: ["how to sell", "sell process", "liquidate shares", "unlisted shares kaise beche", "selling steps"],
            a: "Selling unlisted shares involves:\n1. Submitting your holdings portfolio & Demat proof.\n2. Price Discovery: Receiving competitive liquidation pricing.\n3. KYC & Demat Verification: Verifying seller identity & bank details.\n4. Off-Market Share Transfer: Initiating Delivery Instruction Slip (DIS / e-DIS) to our clearing Demat account.\n5. Same-Day Settlement: Direct bank transfer payout credited directly into your bank account within 24 hours of transfer confirmation."
        },
        {
            id: "what-is-off-market",
            q: "What is an off-market transaction?",
            keywords: ["off market", "off-market", "otc", "over the counter", "off market transfer kya hai"],
            a: "An off-market transaction is a direct transfer of securities between two Demat accounts without routing through a public exchange order-matching engine. In India, off-market transfers are processed through national depositories (NSDL / CDSL) via Delivery Instruction Slips (DIS) or electronic CDSL easiest / NSDL SPEED-e portals."
        },
        {
            id: "what-is-price-discovery",
            q: "What is price discovery?",
            keywords: ["price discovery", "how is price decided", "rate kaise decide hota hai", "valuation process"],
            a: "Price discovery is the mechanism by which an indicative transaction price is determined between willing buyers and sellers. It is driven by prevailing supply and demand, lot volume, company financial performance, comparable industry valuations, and recent private secondary market trades. Indicative prices are never guaranteed."
        },
        {
            id: "do-i-need-demat",
            q: "Do I need a Demat account?",
            keywords: ["need demat", "demat account required", "demat jaruri hai", "without demat", "demat account"],
            a: "Yes. In accordance with SEBI guidelines, all unlisted equity shares must be held and transferred electronically in a Demat account with either NSDL or CDSL. Physical share transfers are no longer permissible. You will need a verified Demat Client Master List (CML) to transact."
        },
        {
            id: "what-documents-required",
            q: "What documents are required for KYC?",
            keywords: ["documents required", "kyc documents", "documents kya lagenge", "paperwork", "checklist"],
            a: "Standard required documentation includes:\n• Self-attested PAN Card (Mandatory)\n• Proof of Identity & Address (Aadhaar, Passport, or Voter ID)\n• Demat Client Master List (CML) with active status seal\n• Cancelled Cheque / Bank Statement matching Demat name\n• For Corporate/HUF: Board Resolution & Authorized Signatory list."
        },
        {
            id: "settlement-time",
            q: "How long does settlement take?",
            keywords: ["settlement time", "how long", "execution time", "kitna time lagta hai", "timeline"],
            a: "At Meera Associates, our target execution timeline is within 24 Hours upon verified receipt of funds and Demat CML for buyers, and same-day direct payout within 24 Hours upon confirmed depository share transfer for sellers."
        },
        {
            id: "how-shares-transferred",
            q: "How are unlisted shares transferred?",
            keywords: ["how are shares transferred", "transfer mechanism", "dis slip", "edis", "shares transfer kaise hote hai"],
            a: "Shares are transferred electronically between Demat accounts through NSDL or CDSL depositories. The transferring party submits an off-market Delivery Instruction Slip (DIS) or executes an online e-DIS authorization via CDSL Easiest / NSDL SPEED-e platforms specifying the recipient's DP ID and Client ID."
        },
        {
            id: "can-nris-transact",
            q: "Can NRIs transact in unlisted shares?",
            keywords: ["nri", "non resident", "can nris buy", "nri invest", "foreign investor"],
            a: "Yes, Non-Resident Indians (NRIs) can transact in unlisted shares in compliance with FEMA guidelines, RBI regulations, and the Foreign Direct Investment (FDI) sectoral caps. Transactions must be executed through an NRE/NRO Demat and bank account structure. Our advisory team assists with NRI documentation."
        },
        {
            id: "taxation-rules",
            q: "How is taxation handled for unlisted shares?",
            keywords: ["tax", "taxation", "capital gains", "stcg", "ltcg", "tax kaise lagta hai"],
            a: "Taxation on unlisted shares in India is governed by the Income Tax Act:\n• Short-Term Capital Gains (STCG): If held for 24 months or less, gains are taxed at applicable individual income tax slab rates.\n• Long-Term Capital Gains (LTCG): If held for more than 24 months, gains are generally taxed at 12.5% (as per recent Finance Act updates) without indexation benefits.\nSecurities Transaction Tax (STT) is not applicable on off-market trades. We recommend consulting your tax advisor for personalized computation."
        },
        {
            id: "guaranteed-returns",
            q: "Are unlisted shares guaranteed to generate returns?",
            keywords: ["guaranteed returns", "safe", "fixed profit", "return guarantee", "risk in unlisted"],
            a: "No. Equity investments in unlisted shares carry market risk and do NOT offer guaranteed returns. Values fluctuate based on business performance, broader market conditions, liquidity, and eventual listing valuation. Meera Associates does not offer guaranteed returns or speculative predictions. Investors should invest based on their risk appetite and research."
        },
        {
            id: "how-to-contact",
            q: "How can I contact Meera Associates?",
            keywords: ["contact meera", "phone number", "office address", "call us", "contact details", "helpline"],
            a: "You can reach Meera Associates directly via:\n• Direct Desk: +91 8983388881\n• Advisory Line: +91 8888415222\n• Office Landline: +91 9028345588\n• WhatsApp Support: Chat on WhatsApp or visit our Contact Us page\n• Email: contact.meeraassociates@gmail.com"
        }
    ]
};
