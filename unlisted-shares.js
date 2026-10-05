/**
 * MEERA ASSOCIATES - UNLISTED SHARES DIRECTORY
 * Interactive directory for 78 unlisted companies with search,
 * industry filtering, A-Z sorting, company detail modal,
 * and pre-populated enquiry form.
 */

document.addEventListener('DOMContentLoaded', () => {
    // 78 UNLISTED COMPANIES DATA
    const companiesData = [
        // --- REFERENCE SET 1 (36 COMPANIES) ---
        {
            id: 'pxil',
            name: 'Power Exchange India Limited',
            shortName: 'PXIL',
            category: 'Energy',
            logo: 'assets/logos/pxil.png',
            industry: 'Electronic Platform for Trading',
            about: 'Meera Associates is a trusted broker and dealer of Power Exchange India Limited (PXIL) Unlisted Share. PXIL is a premier power market infrastructure institution in India, providing an electronic platform for trading electricity and related products.',
            highlights: ['Promoted by NSE and NCDEX', 'Day-Ahead Spot (DAS) & Term-Ahead (TAM) Market', 'Renewable Energy Certificate (REC) Trading', 'ISIN: INE03N601010'],
            overview: 'First institutionally promoted power exchange in India, operating an electronic trading platform for power generators, distribution companies (DISCOMs), and industrial consumers.'
        },
        {
            id: 'ncdex',
            name: 'National Commodity & Derivatives Exchange Ltd (NCDEX)',
            shortName: 'NCDEX',
            category: 'Financial Services',
            logo: 'assets/logos/ncdex.png',
            industry: 'Commodity Exchange',
            about: 'Meera Associates is a trusted broker and dealer of National Commodity & Derivatives Exchange Limited (NCDEX) Unlisted Shares. National Commodity & Derivatives Exchange Limited (NCDEX) is an Indian online commodity and derivatives exchange based in India.',
            highlights: ['ISIN: INE127G01010', 'Commodity Futures & Options in Goods', 'Benchmark Agri & Non-Agri Commodities', 'Promoted by Mr. NCDEX (Est. 2003)'],
            overview: 'NCDEX serves as an efficient platform for Price Discovery and Price Risk Management. The larger NCDEX Group provides integrated market infrastructure including Clearing & Settlement services, Repository services, and an e-Auction Platform.'
        },
        {
            id: 'sterlite-power',
            name: 'Sterlite Power Transmission Ltd.',
            shortName: 'Sterlite Power',
            category: 'Energy',
            logo: 'assets/logos/sterlite-power.png',
            industry: 'Developing Power Transmission Infrastructure',
            about: 'Sterlite Power is a leading integrated power transmission developer and solutions provider globally, and Meera Associates is a trusted broker and dealer of Sterlite Power Transmission Limited Unlisted Share. The company has been serving investors in the unlisted shares market since 1985.',
            highlights: ['ISIN: INE110V01015 (FV: ₹2/-)', 'Promoters: Pravin Agarwal / Pratik Pravin Agarwal', 'Conductors, Cables & Optical Ground Wire (OPGW)', 'Established 1984 | Multi-Award Winning'],
            overview: 'Sterlite Power is uniquely positioned to solve the toughest challenges of energy delivery located at the intersection of constraints around time, space and capital, delivering 24x7 power infrastructure across India and Brazil.'
        },
        {
            id: 'nerl',
            name: 'National E-Repository Ltd. (NeRL)',
            shortName: 'NeRL',
            category: 'Financial Services',
            logo: 'assets/logos/nerl.png',
            industry: 'Electronic Warehouse Receipts',
            about: 'National E-Repository Limited (NeRL) provides a secure digital platform for issuing and managing electronic Negotiable Warehouse Receipts (eNWRs).',
            highlights: ['Promoted by key financial exchanges and banks', 'Regulated under WDRA regulatory framework', 'Enables transparent commodity collateral finance'],
            overview: 'NeRL dematerializes physical agricultural and commodity warehouse receipts, enabling instantaneous digital pledging and reduced financial risk for lenders.'
        },
        {
            id: 'anugraha',
            name: 'Anugraha Valve Castings Limited',
            shortName: 'Anugraha Valve',
            category: 'Manufacturing',
            logo: 'assets/logos/anugraha.png',
            industry: 'Manufacturing and Exporting (Valve Castings)',
            about: 'Anugraha Valve Castings Limited is one of India\'s leading steel foundries based in Coimbatore, specializing in high-integrity industrial valve castings conforming to ASTM and EN specifications.',
            highlights: ['ISIN: INE629Z01015 (FV: ₹10/-)', 'FY26 EPS: ₹73.87 | PAT: ₹26.05 Cr (+34.49% YoY)', 'Exporting 6,000+ MT steel & alloy castings', 'Est. 1992 | Promoters: R Baskaran & Family'],
            overview: 'Operates multiple state-of-the-art foundries and machine shops in Coimbatore, supplying critical valve castings ranging from 0.5" to 32" to major global valve manufacturers.'
        },
        {
            id: 'snapdeal',
            name: 'Snapdeal',
            shortName: 'Snapdeal',
            category: 'Consumer',
            logo: 'assets/logos/snapdeal.png',
            industry: 'E-Commerce & Digital Commerce',
            about: 'Snapdeal is one of India’s established e-commerce marketplaces focused on value-lifestyle merchandise across Tier-2, Tier-3, and semi-urban markets.',
            highlights: ['Millions of active transacting customers', 'Value-conscious merchandise catalog', 'Asset-light marketplace logistics network'],
            overview: 'Snapdeal connects regional manufacturers directly with consumers, providing affordable fashion, home decor, lifestyle, and consumer essentials.'
        },
        {
            id: 'rrp-s4e',
            name: 'RRP-S4E Innovation Pvt. Ltd.',
            shortName: 'RRP S4E',
            category: 'Technology',
            logo: 'assets/logos/rrp-s4e.png',
            industry: 'Electro-Optics & Defense Surveillance',
            about: 'RRP-S4E Innovation develops and manufactures advanced electro-optics, thermal imaging equipment, and surveillance systems for defense and aerospace forces.',
            highlights: ['Indigenous defense electro-optics engineering', 'Advanced night-vision and thermal weapon sights', 'Partnerships with domestic and international defense primes'],
            overview: 'RRP-S4E provides indigenous sensor payloads, observation platforms, and optronics supporting India’s strategic defense self-reliance.'
        },
        {
            id: 'goodluck',
            name: 'Goodluck Defence & Aerospace Pvt. Ltd.',
            shortName: 'Goodluck Defence',
            category: 'Manufacturing',
            logo: 'assets/logos/goodluck.png',
            industry: 'Defense Forgings & Aerospace Components',
            about: 'A specialized aerospace and defense manufacturing subsidiary of Goodluck India, producing critical forged and precision-machined alloy components.',
            highlights: ['High-spec alloy open and closed die forgings', 'Approved supplier for missile, space, and naval defense programs', 'Advanced metallographic testing infrastructure'],
            overview: 'Goodluck Defence engineers critical shells, motor casings, launch tubes, and forged structural elements meeting stringent defense tolerances.'
        },
        {
            id: 'rite-water',
            name: 'Rite Water Solutions (India) Limited',
            shortName: 'Rite Water',
            category: 'Healthcare',
            logo: 'assets/logos/rite-water.png',
            industry: 'Water Purification & CleanTech Solutions',
            about: 'Rite Water Solutions is an environmental engineering company delivering clean drinking water solutions, wastewater treatment, and advanced desalination systems.',
            highlights: ['Over 2,500 community clean drinking water installations', 'Patented chemical-free fluoride and arsenic removal technology', 'Active participant in Jal Jeevan Mission projects'],
            overview: 'Rite Water designs community water purification kiosks, solar-powered treatment plants, and smart IoT water quality monitoring networks.'
        },
        {
            id: 'pharmed',
            name: 'Pharmed Limited',
            shortName: 'Pharmed',
            category: 'Healthcare',
            logo: 'assets/logos/pharmed.png',
            industry: 'Pharmaceuticals & Nutraceutical Formulations',
            about: 'Pharmed Limited is a specialty pharmaceutical and clinical nutrition formulation company with trusted market brands in orthopedics, gynecology, and pediatrics.',
            highlights: ['Pioneer in bone health and clinical nutritional formulations', 'Prescription-led physician network across India', 'WHO-GMP compliant manufacturing standards'],
            overview: 'Pharmed manufactures and markets evidence-based pharmaceutical therapies focused on improving quality of life across key clinical disciplines.'
        },
        {
            id: 'greenzo',
            name: 'Greenzo Energy India Ltd.',
            shortName: 'Greenzo Energy',
            category: 'Energy',
            logo: 'assets/logos/greenzo.png',
            industry: 'Green Hydrogen & Renewable Energy EPC',
            about: 'Greenzo Energy is an indigenous green hydrogen solutions developer, manufacturing PEM electrolyzers and executing utility-scale renewable energy EPC contracts.',
            highlights: ['Indigenous state-of-the-art electrolyzer manufacturing plant', 'Large order book in renewable EPC and hydrogen systems', 'Industrial decarbonization solutions'],
            overview: 'Greenzo focuses on reducing levelized cost of green hydrogen through localized balance-of-plant engineering, solar integration, and high-efficiency electrolyzer stacks.'
        },
        {
            id: 'incred-capital',
            name: 'InCred Capital Financial Services',
            shortName: 'InCred Capital',
            category: 'Financial Services',
            logo: 'assets/logos/incred-capital.png',
            industry: 'Institutional Equities & Investment Banking',
            about: 'InCred Capital is the institutional equities, investment banking, and ultra-high-net-worth wealth advisory arm of the diversified financial powerhouse InCred Group.',
            highlights: ['Comprehensive equity research and sales trading desk', 'Cross-border M&A and capital syndication advisory', 'Multi-asset family office wealth management platform'],
            overview: 'InCred Capital provides bespoke financial advisory, institutional syndication, and private market equity distribution services to corporations and family offices.'
        },
        {
            id: 'msei',
            name: 'Metropolitan Stock Exchange of India Ltd. (MSE)',
            shortName: 'MSE',
            category: 'Financial Services',
            logo: 'assets/logos/msei.png',
            industry: 'National Securities Exchange',
            about: 'Metropolitan Stock Exchange of India (MSE) is a SEBI-recognized national stock exchange providing trading platforms for capital market, currency, and debt segments.',
            highlights: ['Nationwide recognized stock exchange license', 'High-speed electronic trade execution engine', 'Institutional corporate shareholding base'],
            overview: 'MSE offers trading, clearing, and risk-management infrastructure adhering to SEBI guidelines across equities, equity derivatives, and currency pairs.'
        },
        {
            id: 'motilal-oswal',
            name: 'Motilal Oswal Home Finance Ltd.',
            shortName: 'Motilal Oswal Home Fin',
            category: 'Financial Services',
            logo: 'assets/logos/motilal-oswal.png',
            industry: 'Affordable Housing Finance',
            about: 'Motilal Oswal Home Finance Limited (MOHFL) is a housing finance institution providing retail home loans to low and middle-income families across urban and semi-urban India.',
            highlights: ['Backed by Motilal Oswal Financial Services Group', 'Broad distribution branch network across Tier-2 to Tier-4 regions', 'Prudent underwriting and robust portfolio risk quality'],
            overview: 'MOHFL enables home ownership by financing home purchases, self-construction, and property improvements with long-tenure structured mortgages.'
        },
        {
            id: 'apollo-green',
            name: 'Apollo Green Energy Ltd.',
            shortName: 'Apollo Green',
            category: 'Energy',
            logo: 'assets/logos/apollo-green.png',
            industry: 'Solar EPC & Clean Energy Solutions',
            about: 'Apollo Green Energy is an engineering and contracting company executing utility-scale solar PV installations, industrial rooftop solar, and renewable balance of system.',
            highlights: ['Substantial executed portfolio of ground-mounted solar plants', 'Turnkey engineering, procurement, and construction (EPC)', 'Comprehensive operations & lifecycle maintenance'],
            overview: 'Apollo Green Energy develops clean solar energy assets for commercial, industrial, and government clients, fostering India’s clean energy adoption.'
        },
        {
            id: 'hpx',
            name: 'Hindustan Power Exchange (HPX)',
            shortName: 'HPX',
            category: 'Energy',
            logo: 'assets/logos/hpx.png',
            industry: 'Power Exchange & Power Contracts',
            about: 'Hindustan Power Exchange is India’s next-generation electricity exchange, promoted by PTC India, Bombay Stock Exchange (BSE), and ICICI Bank.',
            highlights: ['Institutional backing from PTC India, BSE, and ICICI Bank', 'Modern high-frequency power matching platform', 'Active Day-Ahead, Term-Ahead, and Green Power contracts'],
            overview: 'HPX enables competitive market-based power trading, lowering procurement costs for distribution utilities and open-access consumers.'
        },
        {
            id: 'goa-shipyard',
            name: 'Goa Shipyard Ltd.',
            shortName: 'Goa Shipyard',
            category: 'Infrastructure',
            logo: 'assets/logos/goa-shipyard.png',
            industry: 'Defense Shipbuilding & Marine Engineering',
            about: 'Goa Shipyard Limited (GSL) is a premier Miniratna Category-I defence public sector undertaking under the Ministry of Defence, building modern warships, stealth frigates, and patrol vessels.',
            highlights: ['Miniratna Category-I Defence PSU (ISIN: INE178Z01013)', 'FY26 Revenue from Ops: ₹3,764.30 Cr (+32.05% YoY) | PAT: ₹331.45 Cr', '200+ Ships delivered & state-of-the-art in-house CAD/CAM design bureau'],
            overview: 'GSL designs, constructs, and repairs advanced naval combatants, coast guard interceptor craft, and specialized support vessels.'
        },
        {
            id: 'sterlite-grid-5',
            name: 'Sterlite Grid 5 Limited',
            shortName: 'Sterlite Grid 5',
            category: 'Energy',
            logo: 'assets/logos/sterlite-grid-5.png',
            industry: 'Interstate Power Transmission Concession',
            about: 'Sterlite Grid 5 Limited is a specialized power transmission special purpose vehicle created to build, operate, and maintain high-voltage interstate power links.',
            highlights: ['Regulated long-term tariff structure', 'High operational availability above 99.5%', 'Key component of the national grid corridor'],
            overview: 'The concession manages extra-high voltage lines and substations, ensuring reliable cross-regional electricity transmission under CERC regulations.'
        },
        {
            id: 'trl-krosaki',
            name: 'TRL Krosaki Refractories Limited',
            shortName: 'TRL Krosaki',
            category: 'Manufacturing',
            logo: 'assets/logos/trl-krosaki.svg',
            industry: 'Industrial Refractories & Thermal Ceramics',
            about: 'TRL Krosaki Refractories is a leading refractory manufacturer in India, serving steel, cement, glass, and non-ferrous metal industries.',
            highlights: ['Joint venture partnership with Krosaki Harima Corporation, Japan', 'Comprehensive range of basic, silica, and alumina refractories', 'Advanced high-temperature R&D center'],
            overview: 'The company manufactures high-performance heat-resistant refractory bricks, monolithics, and taphole clays crucial for continuous steelmaking.'
        },
        {
            id: 'hella-infra',
            name: 'Hella Infra Market',
            shortName: 'Infra.Market',
            category: 'Infrastructure',
            logo: 'assets/logos/hella-infra.svg',
            industry: 'Construction Materials & B2B Tech',
            about: 'Hella Infra Market (Infra.Market) is an integrated construction materials company using technology to supply concrete, steel, tiles, and chemicals.',
            highlights: ['Technology-driven multi-category construction supply chain', 'Private-label building product manufacturing', 'Extensive client base across leading real estate and infrastructure EPCs'],
            overview: 'Infra.Market operates private manufacturing lines and automated logistics to optimize construction procurement, quality control, and timely delivery.'
        },
        {
            id: 'rapido',
            name: 'Rapido',
            shortName: 'Rapido',
            category: 'Technology',
            logo: 'assets/logos/rapido.svg',
            industry: 'Mobility & Urban Logistics Platform',
            about: 'Rapido is India’s largest bike-taxi and auto-rickshaw aggregator platform, providing cost-effective micro-mobility and on-demand intra-city rides.',
            highlights: ['Millions of daily app bookings across 100+ cities', 'Leading bike-taxi and three-wheeler ride network', 'Expanding zero-commission driver subscription model'],
            overview: 'Rapido leverages proprietary mapping and dispatch algorithms to deliver affordable first-and-last-mile connectivity and hyper-local parcel delivery.'
        },
        {
            id: 'ppfas',
            name: 'Parag Parikh Financial Advisory Services',
            shortName: 'PPFAS',
            category: 'Financial Services',
            logo: 'assets/logos/ppfas.svg',
            industry: 'Asset Management & Value Investing',
            about: 'PPFAS (sponsor of Parag Parikh Mutual Fund) is a boutique asset management firm renowned for its disciplined long-term value investing philosophy.',
            highlights: ['Pioneered global equity diversification for Indian investors', 'High skin-in-the-game management alignment', 'Long-term compounding track record'],
            overview: 'PPFAS manages domestic and international equity mutual fund schemes adhering to strict behavioral finance and intrinsic value selection criteria.'
        },
        {
            id: 'indofil',
            name: 'Indofil Industries Limited',
            shortName: 'Indofil',
            category: 'Manufacturing',
            logo: 'assets/logos/indofil.svg',
            industry: 'Agrochemicals & Specialty Chemicals',
            about: 'Indofil Industries is an established manufacturer of agrochemicals, crop protection formulations, and specialty industrial chemicals with global exports.',
            highlights: ['Extensive portfolio of fungicides, insecticides, and herbicides', 'Manufacturing facilities in Dahej and Thane', 'Export footprint spanning over 100 countries'],
            overview: 'Indofil develops agricultural input solutions protecting food security and manufactures polymer emulsions for coatings, textiles, and leather.'
        },
        {
            id: 'polymatech',
            name: 'Polymatech Electronics Ltd.',
            shortName: 'Polymatech',
            category: 'Manufacturing',
            logo: 'assets/logos/polymatech.svg',
            industry: 'Semiconductor Chips & Opto-Semiconductors',
            about: 'Polymatech Electronics is India’s first indigenous opto-semiconductor chip manufacturer, packaging and producing advanced LED chips and medical sensors.',
            highlights: ['Cleanroom semiconductor manufacturing in Tamil Nadu', 'High-luminance optoelectronic chips and luminaires', 'Pioneering domestic semiconductor packaging (OSAT)'],
            overview: 'Polymatech manufactures specialized chips for automotive lighting, biological illumination, UV sterilization, and high-efficiency digital displays.'
        },
        {
            id: 'taparia-tools',
            name: 'Taparia Tools Limited',
            shortName: 'Taparia Tools',
            category: 'Manufacturing',
            logo: 'assets/logos/taparia-tools.svg',
            industry: 'Hand Tools & Industrial Hardware',
            about: 'Taparia Tools is an iconic Indian brand in precision hand tools, manufacturing pliers, spanners, screwdrivers, sockets, and hammers since 1969.',
            highlights: ['Household brand name in industrial hand tools', 'Extensive pan-India dealer and distributor network', 'High technical specifications and forge quality'],
            overview: 'Taparia Tools manufactures thousands of precision forged hand tool variants for mechanics, industrial engineering, carpentry, and electrical work.'
        },
        {
            id: 'oyo',
            name: 'Oravel Stays Limited (OYO)',
            shortName: 'OYO',
            category: 'Consumer',
            logo: 'assets/logos/oyo.svg',
            industry: 'Hospitality Tech & Budget Lodging',
            about: 'Oravel Stays Limited (OYO) is a global travel tech platform empowering small hotels and vacation homes with full-stack revenue management technology.',
            highlights: ['Tens of thousands of hotels and storefronts globally', 'Proprietary hotel management software and consumer app', 'Dominant presence in India, Southeast Asia, and Europe'],
            overview: 'OYO operates asset-light franchise lodging, standardizing budget travel accommodation with automated check-in, pricing algorithms, and customer service.'
        },
        {
            id: 'api-holdings',
            name: 'API Holdings Limited',
            shortName: 'PharmEasy / API Holdings',
            category: 'Healthcare',
            logo: 'assets/logos/api-holdings.svg',
            industry: 'Digital Healthcare & Pharmacy Distribution',
            about: 'API Holdings is the parent company of PharmEasy, Thyrocare, and RetailIO, delivering a comprehensive digital healthcare and pharmaceutical supply platform.',
            highlights: ['India’s leading digital healthcare brand PharmEasy', 'Nationwide pathology testing network through Thyrocare', 'Largest B2B pharmaceutical distribution chain (RetailIO)'],
            overview: 'API Holdings connects patients, diagnostic labs, pharmacies, and doctors, fulfilling medicine deliveries, teleconsultations, and lab tests.'
        },
        {
            id: 'nayara-energy',
            name: 'Nayara Energy Limited',
            shortName: 'Nayara Energy',
            category: 'Energy',
            logo: 'assets/logos/nayara-energy.svg',
            industry: 'Refining & Petrochemicals',
            about: 'Nayara Energy is a downstream energy company owning India’s second-largest single-site oil refinery at Vadinar, Gujarat, and over 6,000 retail fuel outlets.',
            highlights: ['20 MMTPA high-complexity deep conversion refinery', 'Over 6,000 retail fuel dispensing stations across India', 'Port and captive power infrastructure at Vadinar'],
            overview: 'Nayara refines crude oil into high-grade transport fuels and petrochemical intermediates, catering to domestic mobility and export markets.'
        },
        {
            id: 'sbi-funds',
            name: 'SBI Funds Management Ltd.',
            shortName: 'SBI Mutual Fund',
            category: 'Financial Services',
            logo: 'assets/logos/sbi-funds.svg',
            industry: 'Asset Management & Mutual Funds',
            about: 'SBI Funds Management is India’s largest asset management company, a joint venture between State Bank of India (SBI) and Amundi Asset Management.',
            highlights: ['Largest AUM in the Indian mutual fund industry', 'Vast institutional and retail distribution reach via SBI branches', 'Comprehensive suite of equity, debt, and passive ETF schemes'],
            overview: 'SBI Funds Management manages retail investments, institutional mandates, and offshore funds with disciplined fiduciary governance.'
        },
        {
            id: 'care-health',
            name: 'Care Health Insurance',
            shortName: 'Care Health',
            category: 'Financial Services',
            logo: 'assets/logos/care-health.svg',
            industry: 'Standalone Health Insurance',
            about: 'Care Health Insurance (formerly Religare Health Insurance) is a leading standalone health insurer offering retail, corporate, and critical illness policies.',
            highlights: ['Fast-growing standalone health insurance player', 'Cashless hospitalization network with over 20,000 healthcare providers', 'High claim-settlement ratio and digital policy underwriting'],
            overview: 'Care Health provides health cover, maternity protection, top-up plans, and international travel insurance across India.'
        },
        {
            id: 'hero-fincorp',
            name: 'Hero FinCorp Limited',
            shortName: 'Hero FinCorp',
            category: 'Financial Services',
            logo: 'assets/logos/hero-fincorp.svg',
            industry: 'Non-Banking Financial Company (NBFC)',
            about: 'Hero FinCorp is the diversified retail and SME financing arm of the Hero Group, offering two-wheeler loans, personal loans, and working capital finance.',
            highlights: ['Sponsor backing from Hero MotoCorp Group', 'Nationwide touchpoints across Hero dealerships and independent branches', 'Diversified retail lending portfolio and MSME credit'],
            overview: 'Hero FinCorp finances consumer asset purchases, used cars, SME machinery loans, and retail credit cards with fast digital onboarding.'
        },
        {
            id: 'mohan-meakin',
            name: 'Mohan Meakin Limited',
            shortName: 'Mohan Meakin',
            category: 'Consumer',
            logo: 'assets/logos/mohan-meakin.svg',
            industry: 'Beverages, Distilleries & Food Products',
            about: 'Mohan Meakin is one of India’s oldest heritage liquor and brewing companies, established in 1855 and famous for iconic brands including Old Monk.',
            highlights: ['Over 160 years of heritage brewing and distilling history', 'Manufacturer of the globally famous Old Monk Rum', 'Diversified presence in malt breakfast cereals and fruit juices'],
            overview: 'Mohan Meakin operates distilleries, breweries, and food processing units, serving domestic consumers and export markets worldwide.'
        },
        {
            id: 'frick-india',
            name: 'Frick India',
            shortName: 'Frick India',
            category: 'Manufacturing',
            logo: 'assets/logos/frick-india.svg',
            industry: 'Industrial Refrigeration & Cold Chain',
            about: 'Frick India is a pioneer manufacturer of industrial refrigeration equipment, screw compressors, and cold chain solutions in India since 1962.',
            highlights: ['Market leader in industrial refrigeration compressor packages', 'Integrated turnkey cold storage and food preservation systems', 'Modern manufacturing facilities in Faridabad'],
            overview: 'Frick India manufactures screw and reciprocating compressor packages, evaporative condensers, and air cooling units for food processing and chemical plants.'
        },
        {
            id: 'hdfc-securities',
            name: 'HDFC Securities',
            shortName: 'HDFC Securities',
            category: 'Financial Services',
            logo: 'assets/logos/hdfc-securities.svg',
            industry: 'Retail & Institutional Equity Brokerage',
            about: 'HDFC Securities is a leading retail brokerage and wealth distribution subsidiary of HDFC Bank, serving millions of investors across India.',
            highlights: ['Wholly owned subsidiary of HDFC Bank', 'Pioneer 3-in-1 integrated Demat, Trading, and Bank accounts', 'Next-gen mobile trading applications (HDFC SKY)'],
            overview: 'HDFC Securities offers trading in equities, derivatives, mutual funds, IPOs, bonds, and international equities with institutional research backing.'
        },
        {
            id: 'shakti-infra',
            name: 'Shakti Infra Pvt. Ltd.',
            shortName: 'Shakti Infra',
            category: 'Infrastructure',
            logo: 'assets/logos/shakti-infra.svg',
            industry: 'Civil Engineering & Infrastructure EPC',
            about: 'Shakti Infra is an infrastructure construction and civil engineering firm specializing in highways, irrigation structures, bridges, and commercial developments.',
            highlights: ['Decade-long execution track record in public works', 'Heavy earthmoving and mechanized road construction fleet', 'Strict quality and safety execution standards'],
            overview: 'Shakti Infra constructs transport and water management infrastructure, partnering with state and central agencies on national highway projects.'
        },
        {
            id: 'ncl-buildtek',
            name: 'NCL Buildtek Limited',
            shortName: 'NCL Buildtek',
            category: 'Manufacturing',
            logo: 'assets/logos/ncl-buildtek.svg',
            industry: 'Building Materials & Architectural Products',
            about: 'NCL Buildtek (formerly NCL Alltek & Seccolor) manufactures architectural building materials, uPVC windows, doors, paints, and putties.',
            highlights: ['Pioneer in color-coated steel window systems (Seccolor)', 'Integrated production of acrylic wall putty, paints, and mortars', 'State-of-the-art uPVC profile extrusion plant'],
            overview: 'NCL Buildtek supplies residential and commercial builders with premium fenestration solutions, dry-mix mortars, and architectural coatings.'
        },

        // --- REFERENCE SET 2 (42 COMPANIES) ---
        {
            id: 'csk',
            name: 'Chennai Super Kings',
            shortName: 'CSK',
            category: 'Consumer',
            logo: 'assets/logos/csk.svg',
            industry: 'Sports Entertainment & Franchise',
            about: 'Chennai Super Kings Cricket Limited operates the Chennai Super Kings IPL franchise, one of the most successful and valuable cricket teams in the world.',
            highlights: ['5-time Indian Premier League (IPL) Champions', 'Huge passionate global fan base and brand equity', 'Revenue from BCCI media rights, sponsorships, and merchandising'],
            overview: 'CSK generates revenue through central media broadcasting rights, stadium ticketing, corporate sponsorships, and branded consumer merchandise.'
        },
        {
            id: 'bira91',
            name: 'B9 Beverages Limited',
            shortName: 'Bira 91',
            category: 'Consumer',
            logo: 'assets/logos/bira91.svg',
            industry: 'Craft Beer & Premium Beverages',
            about: 'B9 Beverages is the creator of Bira 91, India’s leading fast-growing craft beer brand known for quirky branding and flavorful craft brews.',
            highlights: ['Category creator in Indian premium craft beer', 'Multiple breweries across India and international markets', 'Strong brand equity among young urban consumers'],
            overview: 'B9 Beverages brews, markets, and distributes bottled and canned craft beers across India, the US, UK, and Asia Pacific.'
        },
        {
            id: 'merino',
            name: 'Merino Industries Limited',
            shortName: 'Merino Industries',
            category: 'Manufacturing',
            logo: 'assets/logos/merino.svg',
            industry: 'Decorative Laminates & Interior Surfaces',
            about: 'Merino Industries is a premier manufacturer of decorative laminates, compact boards, ply, and architectural panels for interior spaces.',
            highlights: ['One of India’s largest decorative laminate exporters', 'Integrated potato farming and agro-food processing division', 'State-of-the-art manufacturing plants in Hapur and Rohad'],
            overview: 'Merino offers thousands of decorative surface designs, specialty compact laminates, and solid surfaces for residential and commercial architecture.'
        },
        {
            id: 'mkcl',
            name: 'MKCL / Maharashtra Knowledge Corporation Ltd.',
            shortName: 'MKCL',
            category: 'Technology',
            logo: 'assets/logos/mkcl.svg',
            industry: 'Educational Technology & Digital Governance',
            about: 'MKCL was promoted by the Department of Higher & Technical Education, Government of Maharashtra, to develop digital educational programs and e-governance systems.',
            highlights: ['Creators of MS-CIT, empowering over 15 million learners', 'Statewide network of thousands of authorized learning centers', 'Proprietary digital assessment and examination engines'],
            overview: 'MKCL pioneers digital literacy, vocational certifications, recruitment tests, and e-governance frameworks across educational institutions.'
        },
        {
            id: 'capgemini',
            name: 'Capgemini Technology Services India Ltd.',
            shortName: 'Capgemini India',
            category: 'Technology',
            logo: 'assets/logos/capgemini.svg',
            industry: 'IT Services, Consulting & Digital Transformation',
            about: 'Capgemini Technology Services India is the largest operating subsidiary of the global Capgemini Group, delivering software engineering, cloud, and AI consulting.',
            highlights: ['Over 150,000 engineers and professionals in India', 'Global center of excellence for cloud, AI, and cybersecurity', 'Serving Fortune 500 enterprises worldwide'],
            overview: 'The Indian arm provides high-value end-to-end digital transformation, systems integration, application maintenance, and technology engineering.'
        },
        {
            id: 'cial',
            name: 'Cochin International Airport Ltd. (CIAL)',
            shortName: 'CIAL',
            category: 'Infrastructure',
            logo: 'assets/logos/cial.svg',
            industry: 'Airport Infrastructure & Aviation',
            about: 'Cochin International Airport Limited (CIAL) is India’s first greenfield airport built under public-private partnership and the world’s first fully solar-powered airport.',
            highlights: ['World’s first 100% solar-powered international airport', 'Pioneer of the PPP infrastructure model in India', 'Consistent profitability and dividend payment track record'],
            overview: 'CIAL operates Kerala’s busiest airport handling millions of domestic and international passengers with world-class terminals and duty-free retail.'
        },
        {
            id: 'midland-micro',
            name: 'Midland Microfinance',
            shortName: 'Midland Microfinance',
            category: 'Financial Services',
            logo: 'assets/logos/midland-micro.svg',
            industry: 'Microfinance & Financial Inclusion',
            about: 'Midland Microfinance Limited is an NBFC-MFI dedicated to extending collateral-free microcredit to women entrepreneurs in rural and semi-urban India.',
            highlights: ['Robust presence across Northern and Central India', 'Technology-driven cashless loan disbursement and collection', 'Strong social impact and borrower empowerment metrics'],
            overview: 'Midland Microfinance finances income-generating micro-enterprises, dairy farming, and small trade through joint liability group lending.'
        },
        {
            id: 'utkarsh-sfb',
            name: 'Utkarsh Small Finance Bank',
            shortName: 'Utkarsh SFB',
            category: 'Financial Services',
            logo: 'assets/logos/utkarsh-sfb.svg',
            industry: 'Small Finance Banking & Retail Credit',
            about: 'Utkarsh Small Finance Bank provides comprehensive retail banking, micro-loans, MSME credit, and deposit products across underbanked regions.',
            highlights: ['RBI-licensed Small Finance Bank', 'Deep branch network in Uttar Pradesh, Bihar, and Jharkhand', 'Integrated retail savings, fixed deposits, and micro-loans'],
            overview: 'Utkarsh SFB bridges credit gaps by mobilizing retail deposits and providing doorstep financial services to micro-enterprises and smallholders.'
        },
        {
            id: 'indian-potash',
            name: 'Indian Potash Limited',
            shortName: 'Indian Potash',
            category: 'Manufacturing',
            logo: 'assets/logos/indian-potash.svg',
            industry: 'Fertilizers, Agro-Nutrients & Sugar',
            about: 'Indian Potash Limited (IPL) is a premier fertilizer marketing and manufacturing company, playing a foundational role in India’s Green Revolution.',
            highlights: ['Largest importer and distributor of Muriate of Potash (MOP)', 'Integrated sugar mills and distillery co-generation plants', 'Trusted partner to millions of Indian farmers'],
            overview: 'IPL imports and manufactures potassic, phosphatic, and nitrogenous fertilizers, ensuring balanced plant nutrition across every agricultural state.'
        },
        {
            id: 'versuni',
            name: 'Versuni (Home Solutions Limited)',
            shortName: 'Versuni',
            category: 'Consumer',
            logo: 'assets/logos/versuni.svg',
            industry: 'Domestic Appliances & Kitchen Solutions',
            about: 'Versuni (formerly Philips Domestic Appliances) designs and manufactures world-renowned home and kitchen appliances under the Philips and Preethi brands.',
            highlights: ['Market leader in air fryers, garment steamers, and mixer grinders', 'Home to trusted household brands Philips and Preethi', 'R&D and manufacturing facility in Chennai'],
            overview: 'Versuni invents intuitive household appliances spanning coffee makers, air purification, fabric care, and food preparation.'
        },
        {
            id: 'assam-carbon',
            name: 'Assam Carbon Products Ltd.',
            shortName: 'Assam Carbon',
            category: 'Manufacturing',
            logo: 'assets/logos/assam-carbon.svg',
            industry: 'Carbon & Graphite Industrial Components',
            about: 'Assam Carbon Products manufactures specialized carbon and graphite products including carbon brushes, mechanical seals, and railway current collectors.',
            highlights: ['Technical heritage with Morgan Advanced Materials', 'Key supplier to Indian Railways and electrical motor OEMs', 'ISO 9001 and ISO 14001 certified manufacturing plants in Guwahati'],
            overview: 'Assam Carbon provides wear-resistant electrical carbon blocks, vanes, and seals for power generators, locomotives, and industrial machinery.'
        },
        {
            id: 'manipal-payment',
            name: 'Manipal Payment',
            shortName: 'Manipal Payment',
            category: 'Financial Services',
            logo: 'assets/logos/manipal-payment.svg',
            industry: 'Payment Processing & Financial Cards',
            about: 'Manipal Payment (part of Manipal Technologies) manufactures and personalizes smart cards, biometric payment terminals, and secure transaction systems.',
            highlights: ['Major provider of banking EMV chip cards in India', 'Certified Visa, Mastercard, and RuPay card personalization facilities', 'Secure financial hardware and transit ticketing solutions'],
            overview: 'Manipal Payment enables banking institutions, fintechs, and metro transit networks with secure payment credentials and processing hardware.'
        },
        {
            id: 'milton-cycle',
            name: 'Milton Cycle Industries Limited',
            shortName: 'Milton Cycle',
            category: 'Manufacturing',
            logo: 'assets/logos/milton-cycle.svg',
            industry: 'Bicycle Components & Precision Tubing',
            about: 'Milton Cycle Industries is an established engineering company manufacturing bicycle components, chains, precision ERW steel tubes, and sheet metal parts.',
            highlights: ['Decades of manufacturing excellence in Sonepat, Haryana', 'Key component supplier to leading Indian bicycle brands', 'Precision cold-drawn steel tube manufacturing'],
            overview: 'Milton Cycle manufactures durable frames, forks, rims, and engineered metal tubular assemblies for the domestic and export bicycle markets.'
        },
        {
            id: 'schneider-electric',
            name: 'Schneider Electric India',
            shortName: 'Schneider Electric',
            category: 'Energy',
            logo: 'assets/logos/schneider-electric.svg',
            industry: 'Energy Management & Industrial Automation',
            about: 'Schneider Electric India is a market leader in digital energy management, medium and low voltage electrical switchgear, and smart grid automation.',
            highlights: ['Over 30 state-of-the-art smart factories and distribution centers in India', 'Leader in green data center power and building automation', 'Substantial domestic manufacturing under Make in India'],
            overview: 'Schneider Electric delivers integrated IoT-enabled energy distribution, circuit breakers, UPS systems, and factory automation software.'
        },
        {
            id: 'elofic',
            name: 'Elofic Industries',
            shortName: 'Elofic Industries',
            category: 'Manufacturing',
            logo: 'assets/logos/elofic.svg',
            industry: 'Automotive & Industrial Filtration',
            about: 'Elofic Industries is one of India’s largest filtration companies, manufacturing oil, air, fuel, and cabin filters alongside automotive lubricants.',
            highlights: ['Over 70 years of filtration engineering history', 'OEM supplier to major automobile manufacturers', 'Six modern production facilities with global exports'],
            overview: 'Elofic engineers high-efficiency filtration media protecting vehicle engines, heavy commercial transport, and industrial machinery.'
        },
        {
            id: 'hella-lighting',
            name: 'Hella India Lighting Limited',
            shortName: 'Hella India Lighting',
            category: 'Manufacturing',
            logo: 'assets/logos/hella-lighting.svg',
            industry: 'Automotive Lighting & Electronics',
            about: 'Hella India Lighting manufactures high-technology automotive lighting solutions, LED headlights, auxiliary lamps, and electrical safety systems.',
            highlights: ['Part of the global FORVIA HELLA automotive group', 'State-of-the-art lighting plant in Derabassi, Punjab', 'Tier-1 supplier to commercial vehicle and tractor OEMs'],
            overview: 'The company designs innovative LED lighting, signaling electronics, and daytime running lights enhancing road safety in commercial transport.'
        },
        {
            id: 'india-carbon',
            name: 'India Carbon Limited',
            shortName: 'India Carbon',
            category: 'Manufacturing',
            logo: 'assets/logos/india-carbon.svg',
            industry: 'Calcined Petroleum Coke & Carbon Paste',
            about: 'India Carbon Limited is Asia’s pioneer producer of Calcined Petroleum Coke (CPC) and Electrode Carbon Paste, vital for aluminum smelting and steel making.',
            highlights: ['Asia’s first calcined petroleum coke manufacturing facility', 'Pivotal supplier to domestic aluminum smelters and foundries', 'Long-standing industrial presence in Guwahati and Budge Budge'],
            overview: 'India Carbon upgrades raw petroleum coke into high-purity carbon materials utilized in graphite electrodes and anode paste.'
        },
        {
            id: 'philips-india',
            name: 'Philips India Limited',
            shortName: 'Philips India',
            category: 'Manufacturing',
            logo: 'assets/logos/philips-india.svg',
            industry: 'Health Technology & Medical Systems',
            about: 'Philips India is a leading health technology company improving people’s health and well-being through diagnostic imaging, ultrasound, and patient monitoring.',
            highlights: ['Pioneer in hospital diagnostic imaging systems (MRI, CT, X-ray)', 'Major healthcare R&D software innovation campus in Bengaluru', 'Trusted personal health and grooming portfolio'],
            overview: 'Philips India delivers clinical imaging suites, sleep & respiratory care equipment, and consumer healthcare technology across the subcontinent.'
        },
        {
            id: 'icl-fincorp',
            name: 'ICL Fincorp Limited',
            shortName: 'ICL Fincorp',
            category: 'Financial Services',
            logo: 'assets/logos/icl-fincorp.svg',
            industry: 'Gold Loans & Non-Banking Finance',
            about: 'ICL Fincorp is a prominent non-banking financial company offering gold loans, property loans, vehicle finance, and investment products.',
            highlights: ['Extensive branch network across South and Western India', 'Rapid, transparent gold loan evaluation and disbursement', 'Strong retail customer deposit base'],
            overview: 'ICL Fincorp provides quick collateralized retail credit against gold jewelry, supporting traders, farmers, and small business owners.'
        },
        {
            id: 'martin-harris',
            name: 'Martin and Harris Laboratories Ltd.',
            shortName: 'Martin & Harris',
            category: 'Healthcare',
            logo: 'assets/logos/martin-harris.svg',
            industry: 'Pharmaceutical Formulations & Therapeutics',
            about: 'Martin and Harris Laboratories is an established pharmaceutical manufacturer with proprietary drug formulations across cardiology, diabetes, and analgesics.',
            highlights: ['Decades of trusted medical formulation presence', 'Modern GMP-compliant manufacturing facilities in Roorkee', 'Broad doctor prescription franchise in semi-urban India'],
            overview: 'The company produces tablets, capsules, liquids, and topical therapeutic products distributed across thousands of retail pharmacies.'
        },
        {
            id: 'rrp-electronics',
            name: 'RRP Electronics Limited',
            shortName: 'RRP Electronics',
            category: 'Technology',
            logo: 'assets/logos/rrp-electronics.svg',
            industry: 'Semiconductor OSAT & Advanced Packaging',
            about: 'RRP Electronics is pioneering private semiconductor outsourced assembly and testing (OSAT) and chip packaging facilities in Maharashtra.',
            highlights: ['Pioneering Maharashtra’s first major semiconductor packaging plant', 'Technical collaboration with global semiconductor consortiums', 'Focus on automotive, industrial, and defense chip packaging'],
            overview: 'RRP Electronics packages microchips, memory modules, and power semiconductors, accelerating India’s domestic silicon manufacturing ecosystem.'
        },
        {
            id: 'signify',
            name: 'Signify Innovations (I) Ltd.',
            shortName: 'Signify India',
            category: 'Manufacturing',
            logo: 'assets/logos/signify.svg',
            industry: 'Connected LED Lighting & IoT Luminaires',
            about: 'Signify Innovations India (formerly Philips Lighting India) is the world leader in connected LED lighting systems, smart city luminaires, and home lighting.',
            highlights: ['Market leader in professional and consumer LED lighting', 'Smart street lighting systems in major Indian smart cities', 'State-of-the-art lighting manufacturing in Vadodara and Noida'],
            overview: 'Signify provides energy-efficient LED luminaires, connected IoT lighting systems (Interact), and consumer smart lighting (Philips Hue).'
        },
        {
            id: 'incred-financial',
            name: 'InCred Financial Services Ltd.',
            shortName: 'InCred Financial',
            category: 'Financial Services',
            logo: 'assets/logos/incred-financial.svg',
            industry: 'Retail & MSME Lending NBFC',
            about: 'InCred Financial Services is an innovative technology-driven NBFC providing retail personal loans, student education loans, and SME business finance.',
            highlights: ['Unicorn status in India’s financial technology lending landscape', 'Proprietary AI-driven algorithmic credit underwriting', 'Diverse asset book across education, consumer, and MSME credit'],
            overview: 'InCred Financial uses data analytics to deliver quick digital credit approvals to students heading abroad and small businesses requiring growth capital.'
        },
        {
            id: 'gh2-solar',
            name: 'GH2 Solar',
            shortName: 'GH2 Solar',
            category: 'Energy',
            logo: 'assets/logos/gh2-solar.svg',
            industry: 'Green Hydrogen & Solar Power Systems',
            about: 'GH2 Solar focuses on the development and engineering of solar-powered green hydrogen production facilities, decentralized microgrids, and solar farms.',
            highlights: ['Pioneering green hydrogen generation pilot installations', 'Turnkey solar PV engineering and off-grid power solutions', 'Decarbonization partner for commercial industrial estates'],
            overview: 'GH2 Solar builds integrated solar-electrolyzer installations, enabling clean industrial power and emission-free hydrogen energy.'
        },
        {
            id: 'san-eng',
            name: 'San Engineering and Locomotive Co. Limited',
            shortName: 'San Engineering',
            category: 'Manufacturing',
            logo: 'assets/logos/san-eng.svg',
            industry: 'Locomotives, Rail Shunters & Heavy Gears',
            about: 'San Engineering and Locomotive Co. designs and manufactures diesel-hydraulic locomotives, rail shunters, heavy-duty gearboxes, and rail maintenance cars.',
            highlights: ['Specialist locomotive builder for industrial yards, ports, and steel plants', 'In-house heavy precision gear cutting and transmission design', 'Trusted engineering partner to Indian Railways and thermal plants'],
            overview: 'The company manufactures custom industrial locomotives, track maintenance self-propelled vehicles, and marine gearboxes in Bengaluru.'
        },
        {
            id: 'fino-paytech',
            name: 'Fino Paytech',
            shortName: 'Fino Paytech',
            category: 'Financial Services',
            logo: 'assets/logos/fino-paytech.svg',
            industry: 'Fintech & Last-Mile Banking Infrastructure',
            about: 'Fino Paytech is a pioneer in last-mile digital banking, biometric micro-ATMs, and payment technology, and is the parent promoter of Fino Payments Bank.',
            highlights: ['Pioneer in biometric financial inclusion in rural India', 'Extensive merchant business correspondent network', 'Promoter of publicly listed Fino Payments Bank'],
            overview: 'Fino Paytech develops software, hardware, and field networks enabling seamless domestic remittances, micro-ATMs, and AePS banking.'
        },
        {
            id: 'ramaraju-mills',
            name: 'Ramaraju Surgical Cotton Mills Limited',
            shortName: 'Ramaraju Mills',
            category: 'Manufacturing',
            logo: 'assets/logos/ramaraju-mills.svg',
            industry: 'Medical Textiles & Surgical Cotton',
            about: 'Part of the Ramco Group, Ramaraju Surgical Cotton Mills manufactures high-grade bleached absorbent cotton, surgical dressings, and specialty yarns.',
            highlights: ['Part of the prestigious South Indian Ramco industrial group', 'One of India’s largest producers of medical surgical cotton', 'State-of-the-art spinning mills in Rajapalayam, Tamil Nadu'],
            overview: 'The company manufactures medical gauze, bandages, absorbent surgical cotton rolls, and fine counts of cotton yarn for healthcare and textiles.'
        },
        {
            id: 'roop-ultrasonix',
            name: 'Roop Ultrasonix Limited',
            shortName: 'Roop Ultrasonix',
            category: 'Manufacturing',
            logo: 'assets/logos/roop-ultrasonix.svg',
            industry: 'Ultrasonic Cleaning & Welding Systems',
            about: 'Roop Ultrasonix is Asia’s leading designer and manufacturer of ultrasonic cleaning equipment, ultrasonic plastic/metal welders, and NDT instruments.',
            highlights: ['Over 35 years of specialized ultrasonic acoustic engineering', 'Supplying precision cleaning systems to automotive, medical, and jewelry sectors', 'Global export footprint across Europe, Americas, and Asia'],
            overview: 'Roop Ultrasonix builds automated multi-stage ultrasonic wash systems, plastic joiners, and ultrasonic non-destructive testing transducers.'
        },
        {
            id: 'sri-vishnu-shankar',
            name: 'Sri Vishnu Shankar Mill Limited',
            shortName: 'Vishnu Shankar Mill',
            category: 'Manufacturing',
            logo: 'assets/logos/sri-vishnu-shankar.svg',
            industry: 'Textiles & Fine Cotton Yarn Spinning',
            about: 'Sri Vishnu Shankar Mill is a premier spinning enterprise of the Ramco Group, producing premium combed cotton yarn for domestic and international markets.',
            highlights: ['Member of the renowned Ramco Group', 'Ultra-modern automated ring spinning machinery', 'Exporting superfine combed yarn to global weaving hubs'],
            overview: 'The mill manufactures high-grade combed compact yarns, slub yarns, and gassed mercerized counts for premium apparel weavers.'
        },
        {
            id: 'mil-industries',
            name: 'MIL Industries Limited',
            shortName: 'MIL Industries',
            category: 'Manufacturing',
            logo: 'assets/logos/mil-industries.svg',
            industry: 'Corrosion Protection & Rubber Lining',
            about: 'MIL Industries specializes in custom rubber linings, PTFE linings, and anti-corrosive coatings for chemical, fertilizer, and thermal power plants.',
            highlights: ['Technical pioneer in chemical resistance and elastomer lining', 'Approved vendor for heavy chemical and nuclear plants', 'Modern manufacturing unit in Ambattur, Chennai'],
            overview: 'MIL Industries designs and applies heavy-duty rubber and fluoropolymer linings to storage tanks, pressure vessels, pipes, and pumps.'
        },
        {
            id: 'lava-intl',
            name: 'Lava International Ltd.',
            shortName: 'Lava International',
            category: 'Technology',
            logo: 'assets/logos/lava-intl.svg',
            industry: 'Smartphones & Consumer Electronics',
            about: 'Lava International is a leading Indian multinational mobile handset and electronics company, designing smartphones, tablets, and wearable devices.',
            highlights: ['One of India’s premier homegrown mobile device brands', 'Large integrated manufacturing and SMT assembly campus in Noida', 'Extensive service center network across India and emerging markets'],
            overview: 'Lava engineers indigenous smartphones (Agni and Blaze series), feature phones, smartwatches, and wireless audio with in-house hardware design.'
        },
        {
            id: 'hicks-thermometers',
            name: 'Hicks Thermometers (I) Ltd.',
            shortName: 'Hicks Thermometers',
            category: 'Healthcare',
            logo: 'assets/logos/hicks-thermometers.svg',
            industry: 'Medical Diagnostic Devices',
            about: 'Hicks Thermometers is an iconic Indian brand in fever thermometry and home diagnostics, producing digital thermometers, BP monitors, and glucometers.',
            highlights: ['Household brand name in body temperature measurement since 1962', 'Manufactures mercury-free glass, digital, and infrared thermometers', 'Certified ISO 13485 medical device production facility in Aligarh'],
            overview: 'Hicks supplies hospitals, clinicians, and households with certified vital-sign monitoring devices, blood pressure monitors, and medical consumables.'
        },
        {
            id: 'transline-tech',
            name: 'Transline Technologies Limited',
            shortName: 'Transline Tech',
            category: 'Technology',
            logo: 'assets/logos/transline-tech.svg',
            industry: 'System Integration & Smart Governance Tech',
            about: 'Transline Technologies is a master system integrator delivering automated fare collection, smart city surveillance, biometric e-passports, and RFID systems.',
            highlights: ['Key systems integrator for national metro transit and highway tolling', 'Implemented major smart city and traffic monitoring projects', 'Pioneer in Aadhaar biometric authentication hardware deployment'],
            overview: 'Transline integrates complex IoT hardware, artificial intelligence surveillance, toll plazas, and digital identification infrastructure for government agencies.'
        },
        {
            id: 'es-electric',
            name: 'E&S Electric Limited',
            shortName: 'E&S Electric',
            category: 'Manufacturing',
            logo: 'assets/logos/es-electric.svg',
            industry: 'Electrical Switchgear & Power Distribution',
            about: 'E&S Electric manufactures electrical control panels, vacuum circuit breakers, and power distribution switchboards for industrial and utility installations.',
            highlights: ['Complete range of medium and low voltage switchboards', 'Type-tested panels compliant with latest IEC/IS standards', 'Engineering solutions for process plants and renewable farms'],
            overview: 'E&S Electric manufactures motor control centers, power distribution panels, and compact secondary substations for heavy industry.'
        },
        {
            id: 'empire-spices',
            name: 'Empire Spices and Foods Ltd.',
            shortName: 'Ramdev Spices',
            category: 'Consumer',
            logo: 'assets/logos/empire-spices.svg',
            industry: 'Packaged Spices & Food Ingredients',
            about: 'Empire Spices and Foods (known for the Ramdev brand) is a leading processor and manufacturer of pure spices, blended masalas, and instant mixes.',
            highlights: ['Famous household brand Ramdev Masala across Western India', 'State-of-the-art cryogenic spice grinding technology', 'Global export footprint to the Indian diaspora'],
            overview: 'The company packages turmeric, coriander, chili, blended curry powders, and snack mixes under strict hygienic international food standards.'
        },
        {
            id: 'inox-leasing',
            name: 'Inox Leasing and Finance Limited',
            shortName: 'Inox Leasing',
            category: 'Financial Services',
            logo: 'assets/logos/inox-leasing.svg',
            industry: 'Investment Holding & Financial Services',
            about: 'Inox Leasing and Finance is the primary holding company of the multi-billion-dollar INOX Group, with strategic equity interests across industrial gases, cinema exhibition, and renewables.',
            highlights: ['Core holding company of the renowned INOX Group', 'Substantial equity holdings in group operating companies', 'Decades of strong corporate governance and asset compounding'],
            overview: 'Inox Leasing holds cornerstone investments in INOX Air Products, Inox India (INOXCVA), and other group ventures, providing treasury management.'
        },
        {
            id: 'kannur-airport',
            name: 'Kannur International Airport',
            shortName: 'KIAL',
            category: 'Infrastructure',
            logo: 'assets/logos/kannur-airport.svg',
            industry: 'Aviation & Airport Infrastructure',
            about: 'Kannur International Airport (KIAL) is Kerala’s fourth international airport, built to serve the Malabar region and the large Non-Resident Keralite population in the Gulf.',
            highlights: ['Modern greenfield airport with a 3,050-meter runway', 'Equipped with LEED gold-standard terminal facilities', 'Major cargo and passenger gateway for Northern Kerala'],
            overview: 'KIAL handles scheduled international and domestic flights, connecting the Malabar diaspora with Middle Eastern and metropolitan destinations.'
        },
        {
            id: 'mohindra-fasteners',
            name: 'Mohindra Fasteners Limited',
            shortName: 'Mohindra Fasteners',
            category: 'Manufacturing',
            logo: 'assets/logos/mohindra-fasteners.svg',
            industry: 'High-Tensile Industrial Fasteners',
            about: 'Mohindra Fasteners is an established manufacturer of high-tensile precision fasteners, automotive bolts, studs, and specialized cold-forged hardware.',
            highlights: ['Extensive cold-forging and thread-rolling facilities in Haryana', 'Tier-1 supplier to commercial vehicle, automotive, and tractor OEMs', 'Exporting high-tensile bolts to Europe and North America'],
            overview: 'The company manufactures critical chassis, engine, and structural fasteners engineered to withstand extreme vibrations and shear loads.'
        },
        {
            id: 'divyajyoti-finlease',
            name: 'Divyajyoti Finlease',
            shortName: 'Divyajyoti Finlease',
            category: 'Financial Services',
            logo: 'assets/logos/divyajyoti-finlease.svg',
            industry: 'Non-Banking Financial Services',
            about: 'Divyajyoti Finlease is an RBI-registered NBFC offering structured business finance, working capital support, and retail loan products.',
            highlights: ['Customized credit solutions for SMEs and entrepreneurs', 'Prudent collateral management and fast processing turnaround', 'Disciplined lending underwriting'],
            overview: 'Divyajyoti Finlease assists small and medium enterprises with loan against property, business expansion loans, and bill discounting.'
        },
        {
            id: 'zepto',
            name: 'Zepto Limited',
            shortName: 'Zepto',
            category: 'Consumer',
            logo: 'assets/logos/zepto.svg',
            industry: 'Quick Commerce & On-Demand Delivery',
            about: 'Zepto is India’s fastest-growing quick-commerce unicorn delivering groceries, fresh produce, and daily household essentials within 10 minutes.',
            highlights: ['Pioneer of hyper-speed 10-minute grocery delivery in India', 'Hundreds of automated dark stores across major metropolitan cities', 'Expanding rapidly into electronics, beauty, and consumer tech (Zepto Cafe/Superstore)'],
            overview: 'Zepto utilizes dense networks of micro-warehouses and proprietary inventory algorithms to fulfill millions of rapid urban household orders monthly.'
        },
        {
            id: 'boat',
            name: 'Imagine Marketing Limited',
            shortName: 'boAt',
            category: 'Consumer',
            logo: 'assets/logos/boat.svg',
            industry: 'Personal Audio & Smart Wearables',
            about: 'Imagine Marketing Limited (boAt) is India’s number one personal audio and wearable electronics brand, renowned for trendy, affordable headphones, earphones, and smartwatches.',
            highlights: ['Market leader in true wireless stereo (TWS) earphones and smartwatches in India', 'Huge youth brand affinity and powerful digital community', 'Rapidly scaling domestic manufacturing under Make in India'],
            overview: 'boAt designs and markets stylish audio gear, bluetooth speakers, fast-charging cables, and fitness smartwatches through omnichannel distribution.'
        },
        {
            id: 'matrix-gas',
            name: 'Matrix Gas & Renewables Ltd.',
            shortName: 'Matrix Gas',
            category: 'Energy',
            logo: 'assets/logos/matrix-gas.svg',
            industry: 'Natural Gas Aggregation & Green Hydrogen',
            about: 'Matrix Gas & Renewables is a prominent player in natural gas marketing, city gas distribution supply, and green hydrogen electrolyzer ventures.',
            highlights: ['Fast-growing gas aggregator supplying industrial consumers', 'Strategic winner in India’s PLI scheme for green hydrogen electrolyzer manufacturing', 'Integrated clean fuel supply infrastructure'],
            overview: 'Matrix Gas sources, transports, and delivers regasified liquefied natural gas (RLNG) and is actively developing solar-powered green hydrogen ecosystems.'
        }
    ];

    // State Variables
    let currentSearchQuery = '';
    let currentCategory = 'all';
    let currentSortOrder = 'az'; // 'az' or 'za'

    // DOM Elements
    const gridContainer = document.getElementById('company-grid');
    const searchInput = document.getElementById('company-search-input');
    const filterButtons = document.querySelectorAll('.filter-pill');
    const sortSelect = document.getElementById('company-sort-select');
    const counterDisplay = document.getElementById('company-counter');
    const noResultsMsg = document.getElementById('no-results-msg');

    // Modals
    const detailModal = document.getElementById('company-detail-modal');
    const detailModalClose = document.getElementById('detail-modal-close');
    const enquiryModal = document.getElementById('unlisted-enquiry-modal');
    const enquiryModalClose = document.getElementById('enquiry-modal-close');
    const enquiryForm = document.getElementById('unlisted-enquiry-form');
    const enquiryCompanyInput = document.getElementById('enquiry-company-name');
    const enquirySuccessMsg = document.getElementById('enquiry-success-message');

    // Hero / Info Banner CTA buttons
    const heroEnquireBtn = document.getElementById('hero-enquire-btn');
    const bannerEnquireBtn = document.getElementById('banner-enquire-btn');

    // Render Function
    function renderCompanies() {
        if (!gridContainer) return;

        // 1. Filter by category
        let filtered = companiesData.filter(comp => {
            if (currentCategory === 'all') return true;
            return comp.category.toLowerCase() === currentCategory.toLowerCase();
        });

        // 2. Filter by search query
        if (currentSearchQuery.trim() !== '') {
            const query = currentSearchQuery.toLowerCase().trim();
            filtered = filtered.filter(comp => {
                return comp.name.toLowerCase().includes(query) ||
                       comp.shortName.toLowerCase().includes(query) ||
                       comp.category.toLowerCase().includes(query) ||
                       comp.industry.toLowerCase().includes(query);
            });
        }

        // 3. Sort
        filtered.sort((a, b) => {
            const nameA = a.name.toLowerCase();
            const nameB = b.name.toLowerCase();
            if (currentSortOrder === 'az') {
                return nameA.localeCompare(nameB);
            } else {
                return nameB.localeCompare(nameA);
            }
        });

        // Update Counter
        if (counterDisplay) {
            counterDisplay.textContent = `Showing ${filtered.length} of ${companiesData.length} Companies`;
        }

        // Empty State
        if (filtered.length === 0) {
            gridContainer.innerHTML = '';
            if (noResultsMsg) noResultsMsg.style.display = 'block';
            return;
        } else {
            if (noResultsMsg) noResultsMsg.style.display = 'none';
        }

        // Render Cards
        gridContainer.innerHTML = filtered.map(comp => `
            <div class="company-card" data-id="${comp.id}">
                <div class="card-logo-container">
                    <img src="${comp.logo}" alt="${comp.name} Logo" class="company-logo-img" loading="lazy" onerror="this.onerror=null; this.src='assets/logos/${comp.id}.svg';">
                </div>
                <div class="card-body">
                    <span class="card-category-tag">${comp.category}</span>
                    <h3 class="company-card-name" title="${comp.name}">${comp.name}</h3>
                </div>
                <div class="card-actions">
                    <button type="button" class="btn-card-details" data-id="${comp.id}">VIEW DETAILS</button>
                    <button type="button" class="btn-card-enquire" data-company="${comp.name}">ENQUIRE</button>
                </div>
            </div>
        `).join('');

        // Attach listeners to newly created card elements
        attachCardListeners();
    }

    // Dedicated Script Profile Pages Mapping (organized in dedicated company subfolders)
    const companyScriptPages = {
        'greenzo': 'scripts/greenzoenergy/greenzoenergy.html',
        'incred-capital': 'scripts/incredcapital/incredcapital.html',
        'sterlite-power': 'scripts/sterlitepower/sterlitepower.html',
        'pxil': 'scripts/pxil/pxil.html',
        'ncdex': 'scripts/ncdex/ncdex.html',
        'pharmed': 'scripts/pharmed/pharmed.html',
        'goa-shipyard': 'scripts/goashipyard/goashipyard.html',
        'rite-water': 'scripts/ritewater/ritewater.html',
        'anugraha': 'scripts/anugrahavalve/anugrahavalve.html'
    };

    // Attach Click Handlers to Cards and Buttons
    function attachCardListeners() {
        const cards = gridContainer.querySelectorAll('.company-card');
        cards.forEach(card => {
            card.addEventListener('click', (e) => {
                // If user clicked enquire button specifically, handled by button listener
                if (e.target.classList.contains('btn-card-enquire')) return;
                
                const id = card.getAttribute('data-id');
                if (companyScriptPages[id]) {
                    window.location.href = companyScriptPages[id];
                    return;
                }
                const comp = companiesData.find(c => c.id === id);
                if (comp) openDetailModal(comp);
            });
        });

        const detailBtns = gridContainer.querySelectorAll('.btn-card-details');
        detailBtns.forEach(btn => {
            btn.addEventListener('click', (e) => {
                e.stopPropagation();
                const id = btn.getAttribute('data-id');
                if (companyScriptPages[id]) {
                    window.location.href = companyScriptPages[id];
                    return;
                }
                const comp = companiesData.find(c => c.id === id);
                if (comp) openDetailModal(comp);
            });
        });

        const enquireBtns = gridContainer.querySelectorAll('.btn-card-enquire');
        enquireBtns.forEach(btn => {
            btn.addEventListener('click', (e) => {
                e.stopPropagation();
                const companyName = btn.getAttribute('data-company');
                openEnquiryModal(companyName);
            });
        });
    }

    // Open Detail Modal
    function openDetailModal(comp) {
        if (!detailModal) return;

        document.getElementById('modal-detail-logo').src = comp.logo;
        document.getElementById('modal-detail-logo').alt = comp.name;
        document.getElementById('modal-detail-name').textContent = comp.name;
        document.getElementById('modal-detail-industry').textContent = comp.industry;
        document.getElementById('modal-detail-category').textContent = comp.category;
        document.getElementById('modal-detail-about').textContent = comp.about;
        document.getElementById('modal-detail-overview').textContent = comp.overview;

        const highlightsList = document.getElementById('modal-detail-highlights');
        if (highlightsList && comp.highlights) {
            highlightsList.innerHTML = comp.highlights.map(h => `<li><span class="highlight-bullet">✓</span> ${h}</li>`).join('');
        }

        const modalEnquireBtn = document.getElementById('modal-detail-enquire-btn');
        if (modalEnquireBtn) {
            modalEnquireBtn.onclick = () => {
                closeDetailModal();
                openEnquiryModal(comp.name);
            };
        }

        detailModal.classList.add('active');
        document.body.style.overflow = 'hidden';
    }

    function closeDetailModal() {
        if (!detailModal) return;
        detailModal.classList.remove('active');
        document.body.style.overflow = '';
    }

    // Open Enquiry Modal
    function openEnquiryModal(companyName, defaultMessage) {
        if (!enquiryModal) return;

        if (enquirySuccessMsg) {
            enquirySuccessMsg.style.display = 'none';
        }
        if (enquiryForm) {
            enquiryForm.style.display = 'block';
            enquiryForm.reset();
            if (enquiryCompanyInput) {
                enquiryCompanyInput.value = companyName || 'Unlisted Shares Enquiry';
            }
            if (defaultMessage) {
                const messageInput = document.getElementById('enquiry-user-message');
                if (messageInput) messageInput.value = defaultMessage;
            }
        }

        enquiryModal.classList.add('active');
        document.body.style.overflow = 'hidden';
    }

    function closeEnquiryModal() {
        if (!enquiryModal) return;
        enquiryModal.classList.remove('active');
        document.body.style.overflow = '';
    }

    // Search Input Listener
    if (searchInput) {
        searchInput.addEventListener('input', (e) => {
            currentSearchQuery = e.target.value;
            renderCompanies();
        });
    }

    // Filter Pills Listener
    filterButtons.forEach(btn => {
        btn.addEventListener('click', () => {
            filterButtons.forEach(b => b.classList.remove('active'));
            btn.classList.add('active');
            currentCategory = btn.getAttribute('data-category');
            renderCompanies();
        });
    });

    // Sort Dropdown Listener
    if (sortSelect) {
        sortSelect.addEventListener('change', (e) => {
            currentSortOrder = e.target.value;
            renderCompanies();
        });
    }

    // Modal Close Buttons & Backdrop Clicks
    if (detailModalClose) {
        detailModalClose.addEventListener('click', closeDetailModal);
    }
    if (detailModal) {
        detailModal.addEventListener('click', (e) => {
            if (e.target === detailModal) closeDetailModal();
        });
    }

    if (enquiryModalClose) {
        enquiryModalClose.addEventListener('click', closeEnquiryModal);
    }
    if (enquiryModal) {
        enquiryModal.addEventListener('click', (e) => {
            if (e.target === enquiryModal) closeEnquiryModal();
        });
    }

    // Close on Escape Key
    document.addEventListener('keydown', (e) => {
        if (e.key === 'Escape') {
            closeDetailModal();
            closeEnquiryModal();
        }
    });

    // Form Submission
    if (enquiryForm) {
        enquiryForm.addEventListener('submit', (e) => {
            e.preventDefault();

            // Success Display
            if (enquiryForm) enquiryForm.style.display = 'none';
            if (enquirySuccessMsg) {
                enquirySuccessMsg.style.display = 'block';
            }
        });
    }

    // Hero & Banner Enquire Buttons
    if (heroEnquireBtn) {
        heroEnquireBtn.addEventListener('click', () => {
            openEnquiryModal('General Unlisted Shares Enquiry');
        });
    }

    if (bannerEnquireBtn) {
        bannerEnquireBtn.addEventListener('click', () => {
            openEnquiryModal('General Unlisted Shares Enquiry');
        });
    }

    // Initial Render
    renderCompanies();

    // Check for incoming query params or hash to auto-open enquiry modal (e.g. from Services tab)
    function handleIncomingEnquiryRoute() {
        try {
            const urlParams = new URLSearchParams(window.location.search);
            const actionParam = (urlParams.get('action') || urlParams.get('type') || '').toLowerCase();
            const hash = (window.location.hash || '').toLowerCase();

            if (actionParam === 'buy' || hash === '#inquire-buy' || hash === '#buy') {
                setTimeout(() => {
                    openEnquiryModal('Buy Pre-IPO & Unlisted Shares Desk', 'Looking to buy unlisted shares. Please share current availability, lot sizes, and pricing.');
                }, 200);
            } else if (actionParam === 'sell' || hash === '#inquire-sell' || hash === '#sell') {
                setTimeout(() => {
                    openEnquiryModal('Sell Unlisted Shares Desk', 'Looking to liquidate unlisted shares holdings. Please share current market valuation quote and off-market settlement process.');
                }, 200);
            } else if (hash === '#enquire' || actionParam === 'enquire') {
                setTimeout(() => {
                    openEnquiryModal('General Unlisted Shares Enquiry');
                }, 200);
            }
        } catch (e) {
            console.error('Error handling route params:', e);
        }
    }

    handleIncomingEnquiryRoute();
    window.addEventListener('hashchange', handleIncomingEnquiryRoute);
});
