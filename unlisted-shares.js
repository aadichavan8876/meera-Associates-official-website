/**
 * MEERA ASSOCIATES - UNLISTED SHARES DIRECTORY
 * Official Directory Sequence (#1 to #99)
 * Source: Official Meera Associates Directory
 * Official Directory • All trades subject to confirmation
 */

document.addEventListener('DOMContentLoaded', () => {
    // 99 UNLISTED COMPANIES DATA IN EXACT OFFICIAL PRICE LIST SEQUENCE
    const companiesData = [
        {
            id: 'ncdex',
            seqNo: 1,
            name: 'National Commodity & Derivatives Exchange Ltd (NCDEX)',
            shortName: 'NCDEX',
            isin: 'INE127G01010',
            category: 'Financial Services',
            industry: 'Commodity Exchange & Derivatives',
            logo: 'assets/logos/ncdex.png',
            about: 'Meera Associates is a trusted broker and dealer of National Commodity & Derivatives Exchange Ltd (NCDEX) Unlisted Shares. Official Scrip #1 in the Official Directory with ISIN INE127G01010. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE127G01010', 'Official Scrip: #1', 'Sector: Financial Services'],
            overview: 'Institutional allocation and private equity facilitation for National Commodity & Derivatives Exchange Ltd (NCDEX), operating in the Commodity Exchange & Derivatives sector. All trades subject to confirmation.'
        },
        {
            id: 'hpx',
            seqNo: 2,
            name: 'Hindustan Power Exchange Ltd (HPX)',
            shortName: 'HPX',
            isin: 'INE07WD01012',
            category: 'Energy',
            industry: 'Power Trading & Electricity Exchange',
            logo: 'assets/logos/hpx.png',
            about: 'Meera Associates is a trusted broker and dealer of Hindustan Power Exchange Ltd (HPX) Unlisted Shares. Official Scrip #2 in the Official Directory with ISIN INE07WD01012. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE07WD01012', 'Official Scrip: #2', 'Sector: Energy'],
            overview: 'Institutional allocation and private equity facilitation for Hindustan Power Exchange Ltd (HPX), operating in the Power Trading & Electricity Exchange sector. All trades subject to confirmation.'
        },
        {
            id: 'pxil',
            seqNo: 3,
            name: 'Power Exchange India Limited (PXIL)',
            shortName: 'PXIL',
            isin: 'INE03N601010',
            category: 'Energy',
            industry: 'Electronic Platform for Power Trading',
            logo: 'assets/logos/pxil.png',
            about: 'Meera Associates is a trusted broker and dealer of Power Exchange India Limited (PXIL) Unlisted Shares. Official Scrip #3 in the Official Directory with ISIN INE03N601010. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE03N601010', 'Official Scrip: #3', 'Sector: Energy'],
            overview: 'Institutional allocation and private equity facilitation for Power Exchange India Limited (PXIL), operating in the Electronic Platform for Power Trading sector. All trades subject to confirmation.'
        },
        {
            id: 'care-health',
            seqNo: 4,
            name: 'Care Health Insurance Ltd',
            shortName: 'Care Health',
            isin: 'INE119J01011',
            category: 'Financial Services',
            industry: 'Health Insurance & Underwriting',
            logo: 'assets/logos/care-health.svg',
            about: 'Meera Associates is a trusted broker and dealer of Care Health Insurance Ltd Unlisted Shares. Official Scrip #4 in the Official Directory with ISIN INE119J01011. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE119J01011', 'Official Scrip: #4', 'Sector: Financial Services'],
            overview: 'Institutional allocation and private equity facilitation for Care Health Insurance Ltd, operating in the Health Insurance & Underwriting sector. All trades subject to confirmation.'
        },
        {
            id: 'msei',
            seqNo: 5,
            name: 'Metropolitan Stock Exchange of India Ltd (MSE)',
            shortName: 'MSEI',
            isin: 'INE312K01010',
            category: 'Financial Services',
            industry: 'Stock & Derivatives Exchange',
            logo: 'assets/logos/msei.png',
            about: 'Meera Associates is a trusted broker and dealer of Metropolitan Stock Exchange of India Ltd (MSE) Unlisted Shares. Official Scrip #5 in the Official Directory with ISIN INE312K01010. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE312K01010', 'Official Scrip: #5', 'Sector: Financial Services'],
            overview: 'Institutional allocation and private equity facilitation for Metropolitan Stock Exchange of India Ltd (MSE), operating in the Stock & Derivatives Exchange sector. All trades subject to confirmation.'
        },
        {
            id: 'indofil',
            seqNo: 6,
            name: 'Indofil Industries Ltd',
            shortName: 'Indofil',
            isin: 'INE071I01016',
            category: 'Manufacturing',
            industry: 'Agrochemicals & Crop Protection',
            logo: 'assets/logos/indofil.svg',
            about: 'Meera Associates is a trusted broker and dealer of Indofil Industries Ltd Unlisted Shares. Official Scrip #6 in the Official Directory with ISIN INE071I01016. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE071I01016', 'Official Scrip: #6', 'Sector: Manufacturing'],
            overview: 'Institutional allocation and private equity facilitation for Indofil Industries Ltd, operating in the Agrochemicals & Crop Protection sector. All trades subject to confirmation.'
        },
        {
            id: 'sterlite-electric',
            seqNo: 7,
            name: 'Sterlite Electric Ltd (Sterlite Power)',
            shortName: 'Sterlite Power',
            isin: 'INE110V01015',
            category: 'Energy',
            industry: 'Power Transmission Infrastructure',
            logo: 'assets/logos/sterlite-power.png',
            about: 'Meera Associates is a trusted broker and dealer of Sterlite Electric Ltd (Sterlite Power) Unlisted Shares. Official Scrip #7 in the Official Directory with ISIN INE110V01015. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE110V01015', 'Official Scrip: #7', 'Sector: Energy'],
            overview: 'Institutional allocation and private equity facilitation for Sterlite Electric Ltd (Sterlite Power), operating in the Power Transmission Infrastructure sector. All trades subject to confirmation.'
        },
        {
            id: 'sterlite-grid-5',
            seqNo: 8,
            name: 'Sterlite Grid 5 Ltd',
            shortName: 'Sterlite Grid 5',
            isin: 'INE03QT01027',
            category: 'Infrastructure',
            industry: 'Power Transmission Grid Projects',
            logo: 'assets/logos/sterlite-grid-5.png',
            about: 'Meera Associates is a trusted broker and dealer of Sterlite Grid 5 Ltd Unlisted Shares. Official Scrip #8 in the Official Directory with ISIN INE03QT01027. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE03QT01027', 'Official Scrip: #8', 'Sector: Infrastructure'],
            overview: 'Institutional allocation and private equity facilitation for Sterlite Grid 5 Ltd, operating in the Power Transmission Grid Projects sector. All trades subject to confirmation.'
        },
        {
            id: 'orbis-financial',
            seqNo: 9,
            name: 'Orbis Financial Ltd',
            shortName: 'Orbis Financial',
            isin: 'INE155K01013',
            category: 'Financial Services',
            industry: 'Custody & Clearing Services',
            logo: 'assets/logos/orbis.png',
            about: 'Meera Associates is a trusted broker and dealer of Orbis Financial Ltd Unlisted Shares. Official Scrip #9 in the Official Directory with ISIN INE155K01013. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE155K01013', 'Official Scrip: #9', 'Sector: Financial Services'],
            overview: 'Institutional allocation and private equity facilitation for Orbis Financial Ltd, operating in the Custody & Clearing Services sector. All trades subject to confirmation.'
        },
        {
            id: 'nayara-energy',
            seqNo: 10,
            name: 'Nayara Energy Ltd',
            shortName: 'Nayara Energy',
            isin: 'INE011A01019',
            category: 'Energy',
            industry: 'Oil Refining & Fuel Retail',
            logo: 'assets/logos/nayara-energy.svg',
            about: 'Meera Associates is a trusted broker and dealer of Nayara Energy Ltd Unlisted Shares. Official Scrip #10 in the Official Directory with ISIN INE011A01019. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE011A01019', 'Official Scrip: #10', 'Sector: Energy'],
            overview: 'Institutional allocation and private equity facilitation for Nayara Energy Ltd, operating in the Oil Refining & Fuel Retail sector. All trades subject to confirmation.'
        },
        {
            id: 'oyo',
            seqNo: 11,
            name: 'OYO Rooms (Oravel Stays Ltd)',
            shortName: 'OYO',
            isin: 'INE561T01021',
            category: 'Consumer',
            industry: 'Hospitality & Travel Tech Platform',
            logo: 'assets/logos/oyo.svg',
            about: 'Meera Associates is a trusted broker and dealer of OYO Rooms (Oravel Stays Ltd) Unlisted Shares. Official Scrip #11 in the Official Directory with ISIN INE561T01021. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE561T01021', 'Official Scrip: #11', 'Sector: Consumer'],
            overview: 'Institutional allocation and private equity facilitation for OYO Rooms (Oravel Stays Ltd), operating in the Hospitality & Travel Tech Platform sector. All trades subject to confirmation.'
        },
        {
            id: 'hdfc-securities',
            seqNo: 12,
            name: 'HDFC Securities Pvt. Ltd.',
            shortName: 'HDFC Securities',
            isin: 'INE700G01014',
            category: 'Financial Services',
            industry: 'Equity Broking & Wealth Distribution',
            logo: 'assets/logos/hdfc-securities.svg',
            about: 'Meera Associates is a trusted broker and dealer of HDFC Securities Pvt. Ltd. Unlisted Shares. Official Scrip #12 in the Official Directory with ISIN INE700G01014. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE700G01014', 'Official Scrip: #12', 'Sector: Financial Services'],
            overview: 'Institutional allocation and private equity facilitation for HDFC Securities Pvt. Ltd., operating in the Equity Broking & Wealth Distribution sector. All trades subject to confirmation.'
        },
        {
            id: 'nerl',
            seqNo: 13,
            name: 'National E-Repository Ltd (NeRL)',
            shortName: 'NeRL',
            isin: 'INE878X01013',
            category: 'Financial Services',
            industry: 'Electronic Warehouse Receipts',
            logo: 'assets/logos/nerl.png',
            about: 'Meera Associates is a trusted broker and dealer of National E-Repository Ltd (NeRL) Unlisted Shares. Official Scrip #13 in the Official Directory with ISIN INE878X01013. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE878X01013', 'Official Scrip: #13', 'Sector: Financial Services'],
            overview: 'Institutional allocation and private equity facilitation for National E-Repository Ltd (NeRL), operating in the Electronic Warehouse Receipts sector. All trades subject to confirmation.'
        },
        {
            id: 'motilal-oswal-hf',
            seqNo: 14,
            name: 'Motilal Oswal Home Finance Ltd',
            shortName: 'Motilal Oswal HF',
            isin: 'INE658R01011',
            category: 'Financial Services',
            industry: 'Housing Finance & Mortgage Loans',
            logo: 'assets/logos/motilal-oswal.png',
            about: 'Meera Associates is a trusted broker and dealer of Motilal Oswal Home Finance Ltd Unlisted Shares. Official Scrip #14 in the Official Directory with ISIN INE658R01011. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE658R01011', 'Official Scrip: #14', 'Sector: Financial Services'],
            overview: 'Institutional allocation and private equity facilitation for Motilal Oswal Home Finance Ltd, operating in the Housing Finance & Mortgage Loans sector. All trades subject to confirmation.'
        },
        {
            id: 'frick-india',
            seqNo: 15,
            name: 'Frick India Ltd',
            shortName: 'Frick India',
            isin: 'INE499C01012',
            category: 'Manufacturing',
            industry: 'Industrial Refrigeration Equipment',
            logo: 'assets/logos/frick-india.svg',
            about: 'Meera Associates is a trusted broker and dealer of Frick India Ltd Unlisted Shares. Official Scrip #15 in the Official Directory with ISIN INE499C01012. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE499C01012', 'Official Scrip: #15', 'Sector: Manufacturing'],
            overview: 'Institutional allocation and private equity facilitation for Frick India Ltd, operating in the Industrial Refrigeration Equipment sector. All trades subject to confirmation.'
        },
        {
            id: 'ppfas',
            seqNo: 16,
            name: 'Parag Parikh Financial Advisory Services Ltd (PPFAS)',
            shortName: 'PPFAS',
            isin: 'INE0FGC01012',
            category: 'Financial Services',
            industry: 'Asset Management & Financial Advisory',
            logo: 'assets/logos/ppfas.svg',
            about: 'Meera Associates is a trusted broker and dealer of Parag Parikh Financial Advisory Services Ltd (PPFAS) Unlisted Shares. Official Scrip #16 in the Official Directory with ISIN INE0FGC01012. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE0FGC01012', 'Official Scrip: #16', 'Sector: Financial Services'],
            overview: 'Institutional allocation and private equity facilitation for Parag Parikh Financial Advisory Services Ltd (PPFAS), operating in the Asset Management & Financial Advisory sector. All trades subject to confirmation.'
        },
        {
            id: 'sunday-proptech',
            seqNo: 17,
            name: 'Sunday Proptech Limited',
            shortName: 'Sunday Proptech',
            isin: 'INE1DBV01016',
            category: 'Technology',
            industry: 'Digital Real Estate Tech Platforms',
            logo: 'assets/logos/sunday-proptech.svg',
            about: 'Meera Associates is a trusted broker and dealer of Sunday Proptech Limited Unlisted Shares. Official Scrip #17 in the Official Directory with ISIN INE1DBV01016. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE1DBV01016', 'Official Scrip: #17', 'Sector: Technology'],
            overview: 'Institutional allocation and private equity facilitation for Sunday Proptech Limited, operating in the Digital Real Estate Tech Platforms sector. All trades subject to confirmation.'
        },
        {
            id: 'carrier-aircon',
            seqNo: 18,
            name: 'Carrier Aircon & Refrigeration Ltd',
            shortName: 'Carrier',
            isin: 'INE040I01011',
            category: 'Consumer',
            industry: 'HVAC, Air Conditioning & Cold Chain',
            logo: 'assets/logos/carrier.svg',
            about: 'Meera Associates is a trusted broker and dealer of Carrier Aircon & Refrigeration Ltd Unlisted Shares. Official Scrip #18 in the Official Directory with ISIN INE040I01011. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE040I01011', 'Official Scrip: #18', 'Sector: Consumer'],
            overview: 'Institutional allocation and private equity facilitation for Carrier Aircon & Refrigeration Ltd, operating in the HVAC, Air Conditioning & Cold Chain sector. All trades subject to confirmation.'
        },
        {
            id: 'cial',
            seqNo: 19,
            name: 'Cochin International Airport Ltd (CIAL)',
            shortName: 'CIAL',
            isin: 'INE02KH01019',
            category: 'Infrastructure',
            industry: 'Airport Operations & 100% Solar Power',
            logo: 'assets/logos/cial.svg',
            about: 'Meera Associates is a trusted broker and dealer of Cochin International Airport Ltd (CIAL) Unlisted Shares. Official Scrip #19 in the Official Directory with ISIN INE02KH01019. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE02KH01019', 'Official Scrip: #19', 'Sector: Infrastructure'],
            overview: 'Institutional allocation and private equity facilitation for Cochin International Airport Ltd (CIAL), operating in the Airport Operations & 100% Solar Power sector. All trades subject to confirmation.'
        },
        {
            id: 'hero-fincorp',
            seqNo: 20,
            name: 'Hero FinCorp Ltd',
            shortName: 'Hero FinCorp',
            isin: 'INE957N01016',
            category: 'Financial Services',
            industry: 'Retail Lending, MSME Loans & NBFC',
            logo: 'assets/logos/hero-fincorp.svg',
            about: 'Meera Associates is a trusted broker and dealer of Hero FinCorp Ltd Unlisted Shares. Official Scrip #20 in the Official Directory with ISIN INE957N01016. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE957N01016', 'Official Scrip: #20', 'Sector: Financial Services'],
            overview: 'Institutional allocation and private equity facilitation for Hero FinCorp Ltd, operating in the Retail Lending, MSME Loans & NBFC sector. All trades subject to confirmation.'
        },
        {
            id: 'csk',
            seqNo: 21,
            name: 'Chennai Super Kings Cricket Ltd (CSK)',
            shortName: 'CSK',
            isin: 'INE852S01026',
            category: 'Consumer',
            industry: 'Sports Entertainment & IPL Franchise',
            logo: 'assets/logos/csk.svg',
            about: 'Meera Associates is a trusted broker and dealer of Chennai Super Kings Cricket Ltd (CSK) Unlisted Shares. Official Scrip #21 in the Official Directory with ISIN INE852S01026. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE852S01026', 'Official Scrip: #21', 'Sector: Consumer'],
            overview: 'Institutional allocation and private equity facilitation for Chennai Super Kings Cricket Ltd (CSK), operating in the Sports Entertainment & IPL Franchise sector. All trades subject to confirmation.'
        },
        {
            id: 'goodluck-defence',
            seqNo: 22,
            name: 'Good Luck Defence & Aerospace Ltd',
            shortName: 'Goodluck Defence',
            isin: 'INE0S7401019',
            category: 'Manufacturing',
            industry: 'Defense Forgings & Missile Components',
            logo: 'assets/logos/goodluck.png',
            about: 'Meera Associates is a trusted broker and dealer of Good Luck Defence & Aerospace Ltd Unlisted Shares. Official Scrip #22 in the Official Directory with ISIN INE0S7401019. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE0S7401019', 'Official Scrip: #22', 'Sector: Manufacturing'],
            overview: 'Institutional allocation and private equity facilitation for Good Luck Defence & Aerospace Ltd, operating in the Defense Forgings & Missile Components sector. All trades subject to confirmation.'
        },
        {
            id: 'kineco',
            seqNo: 23,
            name: 'Kineco Ltd',
            shortName: 'Kineco',
            isin: 'INE139Y01018',
            category: 'Manufacturing',
            industry: 'Advanced Composites, Rail & Aerospace',
            logo: 'assets/logos/kineco.svg',
            about: 'Meera Associates is a trusted broker and dealer of Kineco Ltd Unlisted Shares. Official Scrip #23 in the Official Directory with ISIN INE139Y01018. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE139Y01018', 'Official Scrip: #23', 'Sector: Manufacturing'],
            overview: 'Institutional allocation and private equity facilitation for Kineco Ltd, operating in the Advanced Composites, Rail & Aerospace sector. All trades subject to confirmation.'
        },
        {
            id: 'gfcl-ev',
            seqNo: 24,
            name: 'GFCL EV Products Limited',
            shortName: 'GFCL EV',
            isin: 'INEOKA501014',
            category: 'Energy',
            industry: 'EV Battery Materials & Fluoropolymers',
            logo: 'assets/logos/gfcl-ev.svg',
            about: 'Meera Associates is a trusted broker and dealer of GFCL EV Products Limited Unlisted Shares. Official Scrip #24 in the Official Directory with ISIN INEOKA501014. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INEOKA501014', 'Official Scrip: #24', 'Sector: Energy'],
            overview: 'Institutional allocation and private equity facilitation for GFCL EV Products Limited, operating in the EV Battery Materials & Fluoropolymers sector. All trades subject to confirmation.'
        },
        {
            id: 'inox-leasing',
            seqNo: 25,
            name: 'Inox Leasing & Finance Ltd',
            shortName: 'Inox Leasing',
            isin: 'INE608E01014',
            category: 'Financial Services',
            industry: 'Investment Holding & Financial Operations',
            logo: 'assets/logos/inox-leasing.svg',
            about: 'Meera Associates is a trusted broker and dealer of Inox Leasing & Finance Ltd Unlisted Shares. Official Scrip #25 in the Official Directory with ISIN INE608E01014. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE608E01014', 'Official Scrip: #25', 'Sector: Financial Services'],
            overview: 'Institutional allocation and private equity facilitation for Inox Leasing & Finance Ltd, operating in the Investment Holding & Financial Operations sector. All trades subject to confirmation.'
        },
        {
            id: 'zepto',
            seqNo: 26,
            name: 'Zepto Ltd',
            shortName: 'Zepto',
            isin: 'INE143401029',
            category: 'Technology',
            industry: 'Quick-Commerce & Dark-Store Logistics',
            logo: 'assets/logos/zepto.svg',
            about: 'Meera Associates is a trusted broker and dealer of Zepto Ltd Unlisted Shares. Official Scrip #26 in the Official Directory with ISIN INE143401029. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE143401029', 'Official Scrip: #26', 'Sector: Technology'],
            overview: 'Institutional allocation and private equity facilitation for Zepto Ltd, operating in the Quick-Commerce & Dark-Store Logistics sector. All trades subject to confirmation.'
        },
        {
            id: 'ask-investment',
            seqNo: 27,
            name: 'ASK Investment Managers Ltd',
            shortName: 'ASK Investment',
            isin: 'INE925L01025',
            category: 'Financial Services',
            industry: 'Discretionary PMS & Asset Management',
            logo: 'assets/logos/ask-investment.svg',
            about: 'Meera Associates is a trusted broker and dealer of ASK Investment Managers Ltd Unlisted Shares. Official Scrip #27 in the Official Directory with ISIN INE925L01025. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE925L01025', 'Official Scrip: #27', 'Sector: Financial Services'],
            overview: 'Institutional allocation and private equity facilitation for ASK Investment Managers Ltd, operating in the Discretionary PMS & Asset Management sector. All trades subject to confirmation.'
        },
        {
            id: 'polymatech',
            seqNo: 28,
            name: 'Polymatech Electronics Ltd',
            shortName: 'Polymatech',
            isin: 'INE0OLN01011',
            category: 'Technology',
            industry: 'Semiconductor Chip Design & Opto-Packaging',
            logo: 'assets/logos/polymatech.svg',
            about: 'Meera Associates is a trusted broker and dealer of Polymatech Electronics Ltd Unlisted Shares. Official Scrip #28 in the Official Directory with ISIN INE0OLN01011. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE0OLN01011', 'Official Scrip: #28', 'Sector: Technology'],
            overview: 'Institutional allocation and private equity facilitation for Polymatech Electronics Ltd, operating in the Semiconductor Chip Design & Opto-Packaging sector. All trades subject to confirmation.'
        },
        {
            id: 'trl-krosaki',
            seqNo: 29,
            name: 'TRL Krosaki Refractories Ltd',
            shortName: 'TRL Krosaki',
            isin: 'INE012L01014',
            category: 'Manufacturing',
            industry: 'Refractories for Steel & Glass Industries',
            logo: 'assets/logos/trl-krosaki.svg',
            about: 'Meera Associates is a trusted broker and dealer of TRL Krosaki Refractories Ltd Unlisted Shares. Official Scrip #29 in the Official Directory with ISIN INE012L01014. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE012L01014', 'Official Scrip: #29', 'Sector: Manufacturing'],
            overview: 'Institutional allocation and private equity facilitation for TRL Krosaki Refractories Ltd, operating in the Refractories for Steel & Glass Industries sector. All trades subject to confirmation.'
        },
        {
            id: 'mohan-meakin',
            seqNo: 30,
            name: 'Mohan Meakin Ltd (Breweries)',
            shortName: 'Mohan Meakin',
            isin: 'INE136D01018',
            category: 'Consumer',
            industry: 'Heritage Alcoholic Beverages & Juices',
            logo: 'assets/logos/mohan-meakin.svg',
            about: 'Meera Associates is a trusted broker and dealer of Mohan Meakin Ltd (Breweries) Unlisted Shares. Official Scrip #30 in the Official Directory with ISIN INE136D01018. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE136D01018', 'Official Scrip: #30', 'Sector: Consumer'],
            overview: 'Institutional allocation and private equity facilitation for Mohan Meakin Ltd (Breweries), operating in the Heritage Alcoholic Beverages & Juices sector. All trades subject to confirmation.'
        },
        {
            id: 'transline',
            seqNo: 31,
            name: 'Transline Technologies Ltd',
            shortName: 'Transline Tech',
            isin: 'INE0OR401022',
            category: 'Technology',
            industry: 'Digital Identity & Smart Card Governance',
            logo: 'assets/logos/transline-tech.svg',
            about: 'Meera Associates is a trusted broker and dealer of Transline Technologies Ltd Unlisted Shares. Official Scrip #31 in the Official Directory with ISIN INE0OR401022. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE0OR401022', 'Official Scrip: #31', 'Sector: Technology'],
            overview: 'Institutional allocation and private equity facilitation for Transline Technologies Ltd, operating in the Digital Identity & Smart Card Governance sector. All trades subject to confirmation.'
        },
        {
            id: 'insolare',
            seqNo: 32,
            name: 'InSolare Energy Limited',
            shortName: 'InSolare',
            isin: 'INE0TSJ01021',
            category: 'Energy',
            industry: 'Utility Solar Plants & Renewable EPC',
            logo: 'assets/logos/insolare.png',
            about: 'Meera Associates is a trusted broker and dealer of InSolare Energy Limited Unlisted Shares. Official Scrip #32 in the Official Directory with ISIN INE0TSJ01021. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE0TSJ01021', 'Official Scrip: #32', 'Sector: Energy'],
            overview: 'Institutional allocation and private equity facilitation for InSolare Energy Limited, operating in the Utility Solar Plants & Renewable EPC sector. All trades subject to confirmation.'
        },
        {
            id: 'jai-mata',
            seqNo: 33,
            name: 'Jai Mata Engineering Limited',
            shortName: 'Jai Mata Eng',
            isin: 'INE0E4L01013',
            category: 'Manufacturing',
            industry: 'Heavy Engineering & Metal Fabrication',
            logo: 'assets/logos/jai-mata.svg',
            about: 'Meera Associates is a trusted broker and dealer of Jai Mata Engineering Limited Unlisted Shares. Official Scrip #33 in the Official Directory with ISIN INE0E4L01013. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE0E4L01013', 'Official Scrip: #33', 'Sector: Manufacturing'],
            overview: 'Institutional allocation and private equity facilitation for Jai Mata Engineering Limited, operating in the Heavy Engineering & Metal Fabrication sector. All trades subject to confirmation.'
        },
        {
            id: 'igx',
            seqNo: 34,
            name: 'Indian Gas Exchange Ltd (IGX)',
            shortName: 'IGX',
            isin: 'INE0BI301012',
            category: 'Energy',
            industry: 'Natural Gas Hub & Automated Exchange',
            logo: 'assets/logos/igx.svg',
            about: 'Meera Associates is a trusted broker and dealer of Indian Gas Exchange Ltd (IGX) Unlisted Shares. Official Scrip #34 in the Official Directory with ISIN INE0BI301012. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE0BI301012', 'Official Scrip: #34', 'Sector: Energy'],
            overview: 'Institutional allocation and private equity facilitation for Indian Gas Exchange Ltd (IGX), operating in the Natural Gas Hub & Automated Exchange sector. All trades subject to confirmation.'
        },
        {
            id: 'garuda-aerospace',
            seqNo: 35,
            name: 'Garuda Aerospace Limited',
            shortName: 'Garuda Aerospace',
            isin: 'INE0REL01021',
            category: 'Technology',
            industry: 'Agricultural Drones & Defense UAVs',
            logo: 'assets/logos/garuda-aerospace.png',
            about: 'Meera Associates is a trusted broker and dealer of Garuda Aerospace Limited Unlisted Shares. Official Scrip #35 in the Official Directory with ISIN INE0REL01021. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE0REL01021', 'Official Scrip: #35', 'Sector: Technology'],
            overview: 'Institutional allocation and private equity facilitation for Garuda Aerospace Limited, operating in the Agricultural Drones & Defense UAVs sector. All trades subject to confirmation.'
        },
        {
            id: 'prisma-global',
            seqNo: 36,
            name: 'Prisma Global Limited (Prisma AI)',
            shortName: 'Prisma AI',
            isin: 'INE0B2O01014',
            category: 'Technology',
            industry: 'Computer Vision AI & Video Analytics',
            logo: 'assets/logos/prisma-ai.svg',
            about: 'Meera Associates is a trusted broker and dealer of Prisma Global Limited (Prisma AI) Unlisted Shares. Official Scrip #36 in the Official Directory with ISIN INE0B2O01014. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE0B2O01014', 'Official Scrip: #36', 'Sector: Technology'],
            overview: 'Institutional allocation and private equity facilitation for Prisma Global Limited (Prisma AI), operating in the Computer Vision AI & Video Analytics sector. All trades subject to confirmation.'
        },
        {
            id: 'goodluck-green',
            seqNo: 37,
            name: 'Goodluck Green Energy Limited',
            shortName: 'Goodluck Green',
            isin: 'INE14Z701011',
            category: 'Energy',
            industry: 'Solar Energy & Renewable Infrastructure',
            logo: 'assets/logos/goodluck-green.svg',
            about: 'Meera Associates is a trusted broker and dealer of Goodluck Green Energy Limited Unlisted Shares. Official Scrip #37 in the Official Directory with ISIN INE14Z701011. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE14Z701011', 'Official Scrip: #37', 'Sector: Energy'],
            overview: 'Institutional allocation and private equity facilitation for Goodluck Green Energy Limited, operating in the Solar Energy & Renewable Infrastructure sector. All trades subject to confirmation.'
        },
        {
            id: 'muthoot-fincorp',
            seqNo: 38,
            name: 'Muthoot Fincorp Ltd',
            shortName: 'Muthoot Fincorp',
            isin: 'INE549K01025',
            category: 'Financial Services',
            industry: 'Gold Loans & Inclusive Retail Lending',
            logo: 'assets/logos/muthoot-fincorp.svg',
            about: 'Meera Associates is a trusted broker and dealer of Muthoot Fincorp Ltd Unlisted Shares. Official Scrip #38 in the Official Directory with ISIN INE549K01025. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE549K01025', 'Official Scrip: #38', 'Sector: Financial Services'],
            overview: 'Institutional allocation and private equity facilitation for Muthoot Fincorp Ltd, operating in the Gold Loans & Inclusive Retail Lending sector. All trades subject to confirmation.'
        },
        {
            id: 'incred-capital',
            seqNo: 39,
            name: 'InCred Capital Financial Services Ltd',
            shortName: 'InCred Capital',
            isin: 'INE01WI01014',
            category: 'Financial Services',
            industry: 'Investment Banking, Wealth & Equities',
            logo: 'assets/logos/incred-capital.png',
            about: 'Meera Associates is a trusted broker and dealer of InCred Capital Financial Services Ltd Unlisted Shares. Official Scrip #39 in the Official Directory with ISIN INE01WI01014. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE01WI01014', 'Official Scrip: #39', 'Sector: Financial Services'],
            overview: 'Institutional allocation and private equity facilitation for InCred Capital Financial Services Ltd, operating in the Investment Banking, Wealth & Equities sector. All trades subject to confirmation.'
        },
        {
            id: 'bira91',
            seqNo: 40,
            name: 'B9 Bira Beverages Private Limited',
            shortName: 'Bira 91',
            isin: 'INE833U01014',
            category: 'Consumer',
            industry: 'Craft Beer Brands & Modern FMCG',
            logo: 'assets/logos/bira91.svg',
            about: 'Meera Associates is a trusted broker and dealer of B9 Bira Beverages Private Limited Unlisted Shares. Official Scrip #40 in the Official Directory with ISIN INE833U01014. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE833U01014', 'Official Scrip: #40', 'Sector: Consumer'],
            overview: 'Institutional allocation and private equity facilitation for B9 Bira Beverages Private Limited, operating in the Craft Beer Brands & Modern FMCG sector. All trades subject to confirmation.'
        },
        {
            id: 'esl-steel',
            seqNo: 41,
            name: 'ESL Steel Ltd',
            shortName: 'ESL Steel',
            isin: 'INE481K01021',
            category: 'Manufacturing',
            industry: 'Integrated Blast Furnace Steel & Billets',
            logo: 'assets/logos/esl-steel.svg',
            about: 'Meera Associates is a trusted broker and dealer of ESL Steel Ltd Unlisted Shares. Official Scrip #41 in the Official Directory with ISIN INE481K01021. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE481K01021', 'Official Scrip: #41', 'Sector: Manufacturing'],
            overview: 'Institutional allocation and private equity facilitation for ESL Steel Ltd, operating in the Integrated Blast Furnace Steel & Billets sector. All trades subject to confirmation.'
        },
        {
            id: 'greenzo',
            seqNo: 42,
            name: 'Greenzo Energy India Ltd',
            shortName: 'Greenzo Energy',
            isin: 'INE0OA401013',
            category: 'Energy',
            industry: 'Hydrogen Electrolyzers & Solar EPC',
            logo: 'assets/logos/greenzo.png',
            about: 'Meera Associates is a trusted broker and dealer of Greenzo Energy India Ltd Unlisted Shares. Official Scrip #42 in the Official Directory with ISIN INE0OA401013. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE0OA401013', 'Official Scrip: #42', 'Sector: Energy'],
            overview: 'Institutional allocation and private equity facilitation for Greenzo Energy India Ltd, operating in the Hydrogen Electrolyzers & Solar EPC sector. All trades subject to confirmation.'
        },
        {
            id: 'pharmeasy',
            seqNo: 43,
            name: 'PharmEasy (API Holdings Pvt Ltd)',
            shortName: 'PharmEasy',
            isin: 'INE0DJ201029',
            category: 'Healthcare',
            industry: 'Digital Healthcare & Online Pharmacy',
            logo: 'assets/logos/api-holdings.svg',
            about: 'Meera Associates is a trusted broker and dealer of PharmEasy (API Holdings Pvt Ltd) Unlisted Shares. Official Scrip #43 in the Official Directory with ISIN INE0DJ201029. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE0DJ201029', 'Official Scrip: #43', 'Sector: Healthcare'],
            overview: 'Institutional allocation and private equity facilitation for PharmEasy (API Holdings Pvt Ltd), operating in the Digital Healthcare & Online Pharmacy sector. All trades subject to confirmation.'
        },
        {
            id: 'philips-india',
            seqNo: 44,
            name: 'Philips India Ltd',
            shortName: 'Philips India',
            isin: 'INE319A01016',
            category: 'Consumer',
            industry: 'Health Technology & Personal Care',
            logo: 'assets/logos/philips-india.svg',
            about: 'Meera Associates is a trusted broker and dealer of Philips India Ltd Unlisted Shares. Official Scrip #44 in the Official Directory with ISIN INE319A01016. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE319A01016', 'Official Scrip: #44', 'Sector: Consumer'],
            overview: 'Institutional allocation and private equity facilitation for Philips India Ltd, operating in the Health Technology & Personal Care sector. All trades subject to confirmation.'
        },
        {
            id: '63sats',
            seqNo: 45,
            name: '63SATS Cybertech Limited',
            shortName: '63SATS',
            isin: 'INE1JOJ01011',
            category: 'Technology',
            industry: 'Enterprise Cybersecurity & Threat Defense',
            logo: 'assets/logos/63sats.svg',
            about: 'Meera Associates is a trusted broker and dealer of 63SATS Cybertech Limited Unlisted Shares. Official Scrip #45 in the Official Directory with ISIN INE1JOJ01011. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE1JOJ01011', 'Official Scrip: #45', 'Sector: Technology'],
            overview: 'Institutional allocation and private equity facilitation for 63SATS Cybertech Limited, operating in the Enterprise Cybersecurity & Threat Defense sector. All trades subject to confirmation.'
        },
        {
            id: 'jsr-dynamics',
            seqNo: 46,
            name: 'JSR Dynamics Limited',
            shortName: 'JSR Dynamics',
            isin: 'INE0JFD01014',
            category: 'Manufacturing',
            industry: 'Indigenous Guided Missiles & Defense Systems',
            logo: 'assets/logos/jsr-dynamics.png',
            about: 'Meera Associates is a trusted broker and dealer of JSR Dynamics Limited Unlisted Shares. Official Scrip #46 in the Official Directory with ISIN INE0JFD01014. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE0JFD01014', 'Official Scrip: #46', 'Sector: Manufacturing'],
            overview: 'Institutional allocation and private equity facilitation for JSR Dynamics Limited, operating in the Indigenous Guided Missiles & Defense Systems sector. All trades subject to confirmation.'
        },
        {
            id: 'renfra-energy',
            seqNo: 47,
            name: 'Renfra Energy India Limited',
            shortName: 'RenFra Energy',
            isin: 'INE1LPG01028',
            category: 'Energy',
            industry: 'Renewable Assets & Power Infrastructure',
            logo: 'assets/logos/renfra-energy.svg',
            about: 'Meera Associates is a trusted broker and dealer of Renfra Energy India Limited Unlisted Shares. Official Scrip #47 in the Official Directory with ISIN INE1LPG01028. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE1LPG01028', 'Official Scrip: #47', 'Sector: Energy'],
            overview: 'Institutional allocation and private equity facilitation for Renfra Energy India Limited, operating in the Renewable Assets & Power Infrastructure sector. All trades subject to confirmation.'
        },
        {
            id: 'berar-finance',
            seqNo: 48,
            name: 'Berar Finance Limited',
            shortName: 'Berar Finance',
            isin: 'INE998Y01017',
            category: 'Financial Services',
            industry: 'Two-Wheeler Loans & Regional NBFC',
            logo: 'assets/logos/berar-finance.svg',
            about: 'Meera Associates is a trusted broker and dealer of Berar Finance Limited Unlisted Shares. Official Scrip #48 in the Official Directory with ISIN INE998Y01017. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE998Y01017', 'Official Scrip: #48', 'Sector: Financial Services'],
            overview: 'Institutional allocation and private equity facilitation for Berar Finance Limited, operating in the Two-Wheeler Loans & Regional NBFC sector. All trades subject to confirmation.'
        },
        {
            id: 'yogiji-digi',
            seqNo: 49,
            name: 'Yogiji Digi Limited',
            shortName: 'Yogiji Digi',
            isin: 'INE0SRQ01020',
            category: 'Technology',
            industry: 'Industrial Automation & Metal Processing',
            logo: 'assets/logos/yogiji-digi.svg',
            about: 'Meera Associates is a trusted broker and dealer of Yogiji Digi Limited Unlisted Shares. Official Scrip #49 in the Official Directory with ISIN INE0SRQ01020. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE0SRQ01020', 'Official Scrip: #49', 'Sector: Technology'],
            overview: 'Institutional allocation and private equity facilitation for Yogiji Digi Limited, operating in the Industrial Automation & Metal Processing sector. All trades subject to confirmation.'
        },
        {
            id: 'core-energy',
            seqNo: 50,
            name: 'Core Energy Systems Limited',
            shortName: 'Core Energy',
            isin: 'INE0H2L01014',
            category: 'Energy',
            industry: 'Nuclear, Cryogenic & Defense Engineering',
            logo: 'assets/logos/core-energy.svg',
            about: 'Meera Associates is a trusted broker and dealer of Core Energy Systems Limited Unlisted Shares. Official Scrip #50 in the Official Directory with ISIN INE0H2L01014. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE0H2L01014', 'Official Scrip: #50', 'Sector: Energy'],
            overview: 'Institutional allocation and private equity facilitation for Core Energy Systems Limited, operating in the Nuclear, Cryogenic & Defense Engineering sector. All trades subject to confirmation.'
        },
        {
            id: 'jainam-broking',
            seqNo: 51,
            name: 'Jainam Broking Limited',
            shortName: 'Jainam Broking',
            isin: 'INE0JY501027',
            category: 'Financial Services',
            industry: 'Equities Broking, Commodities & Wealth',
            logo: 'assets/logos/jainam-broking.svg',
            about: 'Meera Associates is a trusted broker and dealer of Jainam Broking Limited Unlisted Shares. Official Scrip #51 in the Official Directory with ISIN INE0JY501027. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE0JY501027', 'Official Scrip: #51', 'Sector: Financial Services'],
            overview: 'Institutional allocation and private equity facilitation for Jainam Broking Limited, operating in the Equities Broking, Commodities & Wealth sector. All trades subject to confirmation.'
        },
        {
            id: 'hei',
            seqNo: 52,
            name: 'Hindustan Engineering and Industries Ltd',
            shortName: 'HEI',
            isin: 'INE665C01026',
            category: 'Manufacturing',
            industry: 'Railway Freight Wagons & Bogies',
            logo: 'assets/logos/hei.svg',
            about: 'Meera Associates is a trusted broker and dealer of Hindustan Engineering and Industries Ltd Unlisted Shares. Official Scrip #52 in the Official Directory with ISIN INE665C01026. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE665C01026', 'Official Scrip: #52', 'Sector: Manufacturing'],
            overview: 'Institutional allocation and private equity facilitation for Hindustan Engineering and Industries Ltd, operating in the Railway Freight Wagons & Bogies sector. All trades subject to confirmation.'
        },
        {
            id: 'sundrops',
            seqNo: 53,
            name: 'Sun Drops Energia Limited',
            shortName: 'Sun Drops',
            isin: 'INE0H1U01025',
            category: 'Energy',
            industry: 'Renewable Energy Solutions & Solar IPP',
            logo: 'assets/logos/sundrops-energia.png',
            about: 'Meera Associates is a trusted broker and dealer of Sun Drops Energia Limited Unlisted Shares. Official Scrip #53 in the Official Directory with ISIN INE0H1U01025. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE0H1U01025', 'Official Scrip: #53', 'Sector: Energy'],
            overview: 'Institutional allocation and private equity facilitation for Sun Drops Energia Limited, operating in the Renewable Energy Solutions & Solar IPP sector. All trades subject to confirmation.'
        },
        {
            id: 'vivriti-next',
            seqNo: 54,
            name: 'Vivriti Next Limited',
            shortName: 'Vivriti Next',
            isin: 'INE0OUB01017',
            category: 'Financial Services',
            industry: 'Fintech Structured Debt & Mid-Market Loans',
            logo: 'assets/logos/vivriti-next.png',
            about: 'Meera Associates is a trusted broker and dealer of Vivriti Next Limited Unlisted Shares. Official Scrip #54 in the Official Directory with ISIN INE0OUB01017. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE0OUB01017', 'Official Scrip: #54', 'Sector: Financial Services'],
            overview: 'Institutional allocation and private equity facilitation for Vivriti Next Limited, operating in the Fintech Structured Debt & Mid-Market Loans sector. All trades subject to confirmation.'
        },
        {
            id: 'merino',
            seqNo: 55,
            name: 'Merino Industries Ltd',
            shortName: 'Merino',
            isin: 'INE662B01017',
            category: 'Manufacturing',
            industry: 'Decorative High-Pressure Laminates',
            logo: 'assets/logos/merino.svg',
            about: 'Meera Associates is a trusted broker and dealer of Merino Industries Ltd Unlisted Shares. Official Scrip #55 in the Official Directory with ISIN INE662B01017. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE662B01017', 'Official Scrip: #55', 'Sector: Manufacturing'],
            overview: 'Institutional allocation and private equity facilitation for Merino Industries Ltd, operating in the Decorative High-Pressure Laminates sector. All trades subject to confirmation.'
        },
        {
            id: 'assam-carbon',
            seqNo: 56,
            name: 'Assam Carbon Products Ltd',
            shortName: 'Assam Carbon',
            isin: 'INE496C01018',
            category: 'Manufacturing',
            industry: 'Carbon Brushes & Mechanical Carbon',
            logo: 'assets/logos/assam-carbon.svg',
            about: 'Meera Associates is a trusted broker and dealer of Assam Carbon Products Ltd Unlisted Shares. Official Scrip #56 in the Official Directory with ISIN INE496C01018. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE496C01018', 'Official Scrip: #56', 'Sector: Manufacturing'],
            overview: 'Institutional allocation and private equity facilitation for Assam Carbon Products Ltd, operating in the Carbon Brushes & Mechanical Carbon sector. All trades subject to confirmation.'
        },
        {
            id: 'martin-harris',
            seqNo: 57,
            name: 'Martin and Harris Laboratories Ltd',
            shortName: 'Martin & Harris',
            isin: 'INE03VV01015',
            category: 'Healthcare',
            industry: 'Pharmaceutical Formulations & Healthcare',
            logo: 'assets/logos/martin-harris.svg',
            about: 'Meera Associates is a trusted broker and dealer of Martin and Harris Laboratories Ltd Unlisted Shares. Official Scrip #57 in the Official Directory with ISIN INE03VV01015. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE03VV01015', 'Official Scrip: #57', 'Sector: Healthcare'],
            overview: 'Institutional allocation and private equity facilitation for Martin and Harris Laboratories Ltd, operating in the Pharmaceutical Formulations & Healthcare sector. All trades subject to confirmation.'
        },
        {
            id: 'recyclekaro',
            seqNo: 58,
            name: 'Evergreen Recyclekaro (India) Limited',
            shortName: 'Recyclekaro',
            isin: 'INE0HAD01019',
            category: 'Manufacturing',
            industry: 'Lithium Battery Recycling & Precious Metals',
            logo: 'assets/logos/recyclekaro.png',
            about: 'Meera Associates is a trusted broker and dealer of Evergreen Recyclekaro (India) Limited Unlisted Shares. Official Scrip #58 in the Official Directory with ISIN INE0HAD01019. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE0HAD01019', 'Official Scrip: #58', 'Sector: Manufacturing'],
            overview: 'Institutional allocation and private equity facilitation for Evergreen Recyclekaro (India) Limited, operating in the Lithium Battery Recycling & Precious Metals sector. All trades subject to confirmation.'
        },
        {
            id: 'bharat-nidhi',
            seqNo: 59,
            name: 'Bharat Nidhi Ltd',
            shortName: 'Bharat Nidhi',
            isin: 'INE286F01016',
            category: 'Financial Services',
            industry: 'Investment Holding & Media Holding Equity',
            logo: 'assets/logos/bharat-nidhi.svg',
            about: 'Meera Associates is a trusted broker and dealer of Bharat Nidhi Ltd Unlisted Shares. Official Scrip #59 in the Official Directory with ISIN INE286F01016. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE286F01016', 'Official Scrip: #59', 'Sector: Financial Services'],
            overview: 'Institutional allocation and private equity facilitation for Bharat Nidhi Ltd, operating in the Investment Holding & Media Holding Equity sector. All trades subject to confirmation.'
        },
        {
            id: 'yotta',
            seqNo: 60,
            name: 'Yotta Data Services Private Limited',
            shortName: 'Yotta Data',
            isin: 'INE1ZSB01015',
            category: 'Technology',
            industry: 'Hyperscale Data Centers & AI Cloud Fabric',
            logo: 'assets/logos/yotta.svg',
            about: 'Meera Associates is a trusted broker and dealer of Yotta Data Services Private Limited Unlisted Shares. Official Scrip #60 in the Official Directory with ISIN INE1ZSB01015. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE1ZSB01015', 'Official Scrip: #60', 'Sector: Technology'],
            overview: 'Institutional allocation and private equity facilitation for Yotta Data Services Private Limited, operating in the Hyperscale Data Centers & AI Cloud Fabric sector. All trades subject to confirmation.'
        },
        {
            id: 'rrp-s4e',
            seqNo: 61,
            name: 'RRP S4E Innovation',
            shortName: 'RRP S4E',
            isin: 'INE09FT01019',
            category: 'Technology',
            industry: 'Military Electro-Optics & Night Vision',
            logo: 'assets/logos/rrp-s4e.png',
            about: 'Meera Associates is a trusted broker and dealer of RRP S4E Innovation Unlisted Shares. Official Scrip #61 in the Official Directory with ISIN INE09FT01019. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE09FT01019', 'Official Scrip: #61', 'Sector: Technology'],
            overview: 'Institutional allocation and private equity facilitation for RRP S4E Innovation, operating in the Military Electro-Optics & Night Vision sector. All trades subject to confirmation.'
        },
        {
            id: 'rite-water',
            seqNo: 62,
            name: 'Rite Water Solutions (India) Limited',
            shortName: 'Rite Water',
            isin: 'INE235Q01028',
            category: 'Infrastructure',
            industry: 'Rural Drinking Water & Electrodialysis',
            logo: 'assets/logos/rite-water.png',
            about: 'Meera Associates is a trusted broker and dealer of Rite Water Solutions (India) Limited Unlisted Shares. Official Scrip #62 in the Official Directory with ISIN INE235Q01028. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE235Q01028', 'Official Scrip: #62', 'Sector: Infrastructure'],
            overview: 'Institutional allocation and private equity facilitation for Rite Water Solutions (India) Limited, operating in the Rural Drinking Water & Electrodialysis sector. All trades subject to confirmation.'
        },
        {
            id: 'krasny-defence',
            seqNo: 63,
            name: 'Krasny Defence Technologies Limited',
            shortName: 'Krasny Defence',
            isin: 'INE0J8D01024',
            category: 'Manufacturing',
            industry: 'Naval Maintenance & Marine Defense Systems',
            logo: 'assets/logos/krasny-defence.svg',
            about: 'Meera Associates is a trusted broker and dealer of Krasny Defence Technologies Limited Unlisted Shares. Official Scrip #63 in the Official Directory with ISIN INE0J8D01024. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE0J8D01024', 'Official Scrip: #63', 'Sector: Manufacturing'],
            overview: 'Institutional allocation and private equity facilitation for Krasny Defence Technologies Limited, operating in the Naval Maintenance & Marine Defense Systems sector. All trades subject to confirmation.'
        },
        {
            id: 'incred-holdings',
            seqNo: 64,
            name: 'InCred Holdings Limited',
            shortName: 'InCred Holdings',
            isin: 'INE732W01014',
            category: 'Financial Services',
            industry: 'Diversified Non-Bank Financial Lending',
            logo: 'assets/logos/incred-financial.svg',
            about: 'Meera Associates is a trusted broker and dealer of InCred Holdings Limited Unlisted Shares. Official Scrip #64 in the Official Directory with ISIN INE732W01014. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE732W01014', 'Official Scrip: #64', 'Sector: Financial Services'],
            overview: 'Institutional allocation and private equity facilitation for InCred Holdings Limited, operating in the Diversified Non-Bank Financial Lending sector. All trades subject to confirmation.'
        },
        {
            id: 'cosmic-pv',
            seqNo: 65,
            name: 'Cosmic PV Power Limited',
            shortName: 'Cosmic PV',
            isin: 'INE13V701016',
            category: 'Energy',
            industry: 'High-Efficiency Solar Modules & Cells',
            logo: 'assets/logos/cosmic-pv.png',
            about: 'Meera Associates is a trusted broker and dealer of Cosmic PV Power Limited Unlisted Shares. Official Scrip #65 in the Official Directory with ISIN INE13V701016. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE13V701016', 'Official Scrip: #65', 'Sector: Energy'],
            overview: 'Institutional allocation and private equity facilitation for Cosmic PV Power Limited, operating in the High-Efficiency Solar Modules & Cells sector. All trades subject to confirmation.'
        },
        {
            id: 'maverick',
            seqNo: 66,
            name: 'Maverick Simulation Solutions Limited',
            shortName: 'Maverick',
            isin: 'INE1BEQ01014',
            category: 'Technology',
            industry: 'Medical Simulation & MedTech Training Systems',
            logo: 'assets/logos/maverick-simulation.png',
            about: 'Meera Associates is a trusted broker and dealer of Maverick Simulation Solutions Limited Unlisted Shares. Official Scrip #66 in the Official Directory with ISIN INE1BEQ01014. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE1BEQ01014', 'Official Scrip: #66', 'Sector: Technology'],
            overview: 'Institutional allocation and private equity facilitation for Maverick Simulation Solutions Limited, operating in the Medical Simulation & MedTech Training Systems sector. All trades subject to confirmation.'
        },
        {
            id: 'capgemini',
            seqNo: 67,
            name: 'Capgemini Technology Services India Ltd',
            shortName: 'Capgemini India',
            isin: 'INE177B01032',
            category: 'Technology',
            industry: 'Global IT Services & Cloud Modernization',
            logo: 'assets/logos/capgemini.svg',
            about: 'Meera Associates is a trusted broker and dealer of Capgemini Technology Services India Ltd Unlisted Shares. Official Scrip #67 in the Official Directory with ISIN INE177B01032. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE177B01032', 'Official Scrip: #67', 'Sector: Technology'],
            overview: 'Institutional allocation and private equity facilitation for Capgemini Technology Services India Ltd, operating in the Global IT Services & Cloud Modernization sector. All trades subject to confirmation.'
        },
        {
            id: 'veeda-clinical',
            seqNo: 68,
            name: 'Veeda Clinical Research Limited',
            shortName: 'Veeda Clinical',
            isin: 'INE01HQ01026',
            category: 'Healthcare',
            industry: 'Clinical CRO & Bioanalytical Trials',
            logo: 'assets/logos/veeda-clinical.svg',
            about: 'Meera Associates is a trusted broker and dealer of Veeda Clinical Research Limited Unlisted Shares. Official Scrip #68 in the Official Directory with ISIN INE01HQ01026. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE01HQ01026', 'Official Scrip: #68', 'Sector: Healthcare'],
            overview: 'Institutional allocation and private equity facilitation for Veeda Clinical Research Limited, operating in the Clinical CRO & Bioanalytical Trials sector. All trades subject to confirmation.'
        },
        {
            id: 'hindon-mercantile',
            seqNo: 69,
            name: 'Hindon Mercantile Limited',
            shortName: 'HML',
            isin: 'INE08GI01012',
            category: 'Financial Services',
            industry: 'Commercial Loans & Structured Credit',
            logo: 'assets/logos/hindon-mercantile.png',
            about: 'Meera Associates is a trusted broker and dealer of Hindon Mercantile Limited Unlisted Shares. Official Scrip #69 in the Official Directory with ISIN INE08GI01012. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE08GI01012', 'Official Scrip: #69', 'Sector: Financial Services'],
            overview: 'Institutional allocation and private equity facilitation for Hindon Mercantile Limited, operating in the Commercial Loans & Structured Credit sector. All trades subject to confirmation.'
        },
        {
            id: 'utkarsh-core',
            seqNo: 70,
            name: 'Utkarsh Core Invest',
            shortName: 'Utkarsh Core',
            isin: 'INE396P01012',
            category: 'Financial Services',
            industry: 'Banking Holding Company for Utkarsh SFB',
            logo: 'assets/logos/utkarsh-sfb.svg',
            about: 'Meera Associates is a trusted broker and dealer of Utkarsh Core Invest Unlisted Shares. Official Scrip #70 in the Official Directory with ISIN INE396P01012. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE396P01012', 'Official Scrip: #70', 'Sector: Financial Services'],
            overview: 'Institutional allocation and private equity facilitation for Utkarsh Core Invest, operating in the Banking Holding Company for Utkarsh SFB sector. All trades subject to confirmation.'
        },
        {
            id: 'eiffil-water',
            seqNo: 71,
            name: 'Eiffil Water Infra Limited',
            shortName: 'Eiffil Water',
            isin: 'INE1GFM01019',
            category: 'Infrastructure',
            industry: 'Urban Water Infrastructure & Sewage Treatment',
            logo: 'assets/logos/eiffil-water.png',
            about: 'Meera Associates is a trusted broker and dealer of Eiffil Water Infra Limited Unlisted Shares. Official Scrip #71 in the Official Directory with ISIN INE1GFM01019. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE1GFM01019', 'Official Scrip: #71', 'Sector: Infrastructure'],
            overview: 'Institutional allocation and private equity facilitation for Eiffil Water Infra Limited, operating in the Urban Water Infrastructure & Sewage Treatment sector. All trades subject to confirmation.'
        },
        {
            id: 'mkcl',
            seqNo: 72,
            name: 'Maharashtra Knowledge Corporation Limited (MKCL)',
            shortName: 'MKCL',
            isin: 'INE03KR01016',
            category: 'Technology',
            industry: 'Educational Frameworks & E-Governance',
            logo: 'assets/logos/mkcl.svg',
            about: 'Meera Associates is a trusted broker and dealer of Maharashtra Knowledge Corporation Limited (MKCL) Unlisted Shares. Official Scrip #72 in the Official Directory with ISIN INE03KR01016. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE03KR01016', 'Official Scrip: #72', 'Sector: Technology'],
            overview: 'Institutional allocation and private equity facilitation for Maharashtra Knowledge Corporation Limited (MKCL), operating in the Educational Frameworks & E-Governance sector. All trades subject to confirmation.'
        },
        {
            id: 'kannur-airport',
            seqNo: 73,
            name: 'Kannur International Airport Ltd',
            shortName: 'Kannur Airport',
            isin: 'INE02Y401013',
            category: 'Infrastructure',
            industry: 'Greenfield International Airport Terminal',
            logo: 'assets/logos/kannur-airport.svg',
            about: 'Meera Associates is a trusted broker and dealer of Kannur International Airport Ltd Unlisted Shares. Official Scrip #73 in the Official Directory with ISIN INE02Y401013. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE02Y401013', 'Official Scrip: #73', 'Sector: Infrastructure'],
            overview: 'Institutional allocation and private equity facilitation for Kannur International Airport Ltd, operating in the Greenfield International Airport Terminal sector. All trades subject to confirmation.'
        },
        {
            id: 'proyuga',
            seqNo: 74,
            name: 'Proyuga Advanced Technologies Limited',
            shortName: 'Proyuga',
            isin: 'INE495Y01014',
            category: 'Technology',
            industry: 'Interactive VR Platforms & Sports Tech',
            logo: 'assets/logos/proyuga.png',
            about: 'Meera Associates is a trusted broker and dealer of Proyuga Advanced Technologies Limited Unlisted Shares. Official Scrip #74 in the Official Directory with ISIN INE495Y01014. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE495Y01014', 'Official Scrip: #74', 'Sector: Technology'],
            overview: 'Institutional allocation and private equity facilitation for Proyuga Advanced Technologies Limited, operating in the Interactive VR Platforms & Sports Tech sector. All trades subject to confirmation.'
        },
        {
            id: 'roop-ultrasonix',
            seqNo: 75,
            name: 'Roop Ultrasonix Ltd',
            shortName: 'Roop Ultrasonix',
            isin: 'INE01QU01011',
            category: 'Manufacturing',
            industry: 'Ultrasonic Welding & Cleaning Equipment',
            logo: 'assets/logos/roop-ultrasonix.svg',
            about: 'Meera Associates is a trusted broker and dealer of Roop Ultrasonix Ltd Unlisted Shares. Official Scrip #75 in the Official Directory with ISIN INE01QU01011. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE01QU01011', 'Official Scrip: #75', 'Sector: Manufacturing'],
            overview: 'Institutional allocation and private equity facilitation for Roop Ultrasonix Ltd, operating in the Ultrasonic Welding & Cleaning Equipment sector. All trades subject to confirmation.'
        },
        {
            id: 'soleos-energy',
            seqNo: 76,
            name: 'Soleos Energy Limited',
            shortName: 'Soleos Energy',
            isin: 'INE0VL901028',
            category: 'Energy',
            industry: 'Solar EPC & Renewable Energy Services',
            logo: 'assets/logos/soleos.png',
            about: 'Meera Associates is a trusted broker and dealer of Soleos Energy Limited Unlisted Shares. Official Scrip #76 in the Official Directory with ISIN INE0VL901028. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE0VL901028', 'Official Scrip: #76', 'Sector: Energy'],
            overview: 'Institutional allocation and private equity facilitation for Soleos Energy Limited, operating in the Solar EPC & Renewable Energy Services sector. All trades subject to confirmation.'
        },
        {
            id: 'signify',
            seqNo: 77,
            name: 'Signify Innovation India Ltd',
            shortName: 'Signify India',
            isin: 'INE045U01015',
            category: 'Consumer',
            industry: 'Professional & Consumer LED Lighting',
            logo: 'assets/logos/signify.svg',
            about: 'Meera Associates is a trusted broker and dealer of Signify Innovation India Ltd Unlisted Shares. Official Scrip #77 in the Official Directory with ISIN INE045U01015. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE045U01015', 'Official Scrip: #77', 'Sector: Consumer'],
            overview: 'Institutional allocation and private equity facilitation for Signify Innovation India Ltd, operating in the Professional & Consumer LED Lighting sector. All trades subject to confirmation.'
        },
        {
            id: 'versuni',
            seqNo: 78,
            name: 'Versuni',
            shortName: 'Versuni',
            isin: 'INE0FO801019',
            category: 'Consumer',
            industry: 'Domestic Small Appliances & Kitchen Care',
            logo: 'assets/logos/versuni.svg',
            about: 'Meera Associates is a trusted broker and dealer of Versuni Unlisted Shares. Official Scrip #78 in the Official Directory with ISIN INE0FO801019. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE0FO801019', 'Official Scrip: #78', 'Sector: Consumer'],
            overview: 'Institutional allocation and private equity facilitation for Versuni, operating in the Domestic Small Appliances & Kitchen Care sector. All trades subject to confirmation.'
        },
        {
            id: 'ncl-buildtek',
            seqNo: 79,
            name: 'NCL Buildtek Ltd',
            shortName: 'NCL Buildtek',
            isin: 'INE243S01010',
            category: 'Manufacturing',
            industry: 'UPVC Windows, Doors & Construction Materials',
            logo: 'assets/logos/ncl-buildtek.svg',
            about: 'Meera Associates is a trusted broker and dealer of NCL Buildtek Ltd Unlisted Shares. Official Scrip #79 in the Official Directory with ISIN INE243S01010. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE243S01010', 'Official Scrip: #79', 'Sector: Manufacturing'],
            overview: 'Institutional allocation and private equity facilitation for NCL Buildtek Ltd, operating in the UPVC Windows, Doors & Construction Materials sector. All trades subject to confirmation.'
        },
        {
            id: 'bharat-hotels',
            seqNo: 80,
            name: 'Bharat Hotels Ltd',
            shortName: 'The LaLiT',
            isin: 'INE466A01015',
            category: 'Consumer',
            industry: 'Luxury Five-Star Hotels & Resorts',
            logo: 'assets/logos/bharat-hotels.svg',
            about: 'Meera Associates is a trusted broker and dealer of Bharat Hotels Ltd Unlisted Shares. Official Scrip #80 in the Official Directory with ISIN INE466A01015. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE466A01015', 'Official Scrip: #80', 'Sector: Consumer'],
            overview: 'Institutional allocation and private equity facilitation for Bharat Hotels Ltd, operating in the Luxury Five-Star Hotels & Resorts sector. All trades subject to confirmation.'
        },
        {
            id: 'fino-paytech',
            seqNo: 81,
            name: 'Fino Pay Tech Ltd',
            shortName: 'Fino Paytech',
            isin: 'INE511I01011',
            category: 'Financial Services',
            industry: 'Biometric Banking Tech & Payment Services',
            logo: 'assets/logos/fino-paytech.svg',
            about: 'Meera Associates is a trusted broker and dealer of Fino Pay Tech Ltd Unlisted Shares. Official Scrip #81 in the Official Directory with ISIN INE511I01011. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE511I01011', 'Official Scrip: #81', 'Sector: Financial Services'],
            overview: 'Institutional allocation and private equity facilitation for Fino Pay Tech Ltd, operating in the Biometric Banking Tech & Payment Services sector. All trades subject to confirmation.'
        },
        {
            id: 'kusum-industrial',
            seqNo: 82,
            name: 'Kusum Industrial Gases Limited',
            shortName: 'Kusum Gases',
            isin: 'INE493C01015',
            category: 'Manufacturing',
            industry: 'Oxygen, Nitrogen & Liquid Industrial Gases',
            logo: 'assets/logos/kusum-industrial.svg',
            about: 'Meera Associates is a trusted broker and dealer of Kusum Industrial Gases Limited Unlisted Shares. Official Scrip #82 in the Official Directory with ISIN INE493C01015. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE493C01015', 'Official Scrip: #82', 'Sector: Manufacturing'],
            overview: 'Institutional allocation and private equity facilitation for Kusum Industrial Gases Limited, operating in the Oxygen, Nitrogen & Liquid Industrial Gases sector. All trades subject to confirmation.'
        },
        {
            id: 'boat',
            seqNo: 83,
            name: 'Imagine Marketing Limited (boAt)',
            shortName: 'boAt',
            isin: 'INE03AV01027',
            category: 'Consumer',
            industry: 'Earwear, Smartwatches & Lifestyle Audio',
            logo: 'assets/logos/boat.svg',
            about: 'Meera Associates is a trusted broker and dealer of Imagine Marketing Limited (boAt) Unlisted Shares. Official Scrip #83 in the Official Directory with ISIN INE03AV01027. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE03AV01027', 'Official Scrip: #83', 'Sector: Consumer'],
            overview: 'Institutional allocation and private equity facilitation for Imagine Marketing Limited (boAt), operating in the Earwear, Smartwatches & Lifestyle Audio sector. All trades subject to confirmation.'
        },
        {
            id: 'indian-potash',
            seqNo: 84,
            name: 'Indian Potash Ltd',
            shortName: 'Indian Potash',
            isin: 'INE863S01015',
            category: 'Manufacturing',
            industry: 'Potassic Fertilizers & Agricultural Minerals',
            logo: 'assets/logos/indian-potash.svg',
            about: 'Meera Associates is a trusted broker and dealer of Indian Potash Ltd Unlisted Shares. Official Scrip #84 in the Official Directory with ISIN INE863S01015. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE863S01015', 'Official Scrip: #84', 'Sector: Manufacturing'],
            overview: 'Institutional allocation and private equity facilitation for Indian Potash Ltd, operating in the Potassic Fertilizers & Agricultural Minerals sector. All trades subject to confirmation.'
        },
        {
            id: 'manipal-housing',
            seqNo: 85,
            name: 'Manipal Housing Finance Syndicate Limited',
            shortName: 'Manipal Housing',
            isin: 'INE03Y801013',
            category: 'Financial Services',
            industry: 'Affordable Housing Mortgages & Term Loans',
            logo: 'assets/logos/manipal-payment.svg',
            about: 'Meera Associates is a trusted broker and dealer of Manipal Housing Finance Syndicate Limited Unlisted Shares. Official Scrip #85 in the Official Directory with ISIN INE03Y801013. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE03Y801013', 'Official Scrip: #85', 'Sector: Financial Services'],
            overview: 'Institutional allocation and private equity facilitation for Manipal Housing Finance Syndicate Limited, operating in the Affordable Housing Mortgages & Term Loans sector. All trades subject to confirmation.'
        },
        {
            id: 'gamma-rotors',
            seqNo: 86,
            name: 'Gamma Rotors Limited',
            shortName: 'Gamma Rotors',
            isin: 'INE1VD201014',
            category: 'Manufacturing',
            industry: 'Electric Motor Rotors & Auto Components',
            logo: 'assets/logos/gamma-rotors.svg',
            about: 'Meera Associates is a trusted broker and dealer of Gamma Rotors Limited Unlisted Shares. Official Scrip #86 in the Official Directory with ISIN INE1VD201014. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE1VD201014', 'Official Scrip: #86', 'Sector: Manufacturing'],
            overview: 'Institutional allocation and private equity facilitation for Gamma Rotors Limited, operating in the Electric Motor Rotors & Auto Components sector. All trades subject to confirmation.'
        },
        {
            id: 'veremax',
            seqNo: 87,
            name: 'Veremax Technologie Services Limited',
            shortName: 'Veremax Tech',
            isin: 'INE1K1L01010',
            category: 'Technology',
            industry: 'Telecom Network Design & System Integration',
            logo: 'assets/logos/veremax.svg',
            about: 'Meera Associates is a trusted broker and dealer of Veremax Technologie Services Limited Unlisted Shares. Official Scrip #87 in the Official Directory with ISIN INE1K1L01010. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE1K1L01010', 'Official Scrip: #87', 'Sector: Technology'],
            overview: 'Institutional allocation and private equity facilitation for Veremax Technologie Services Limited, operating in the Telecom Network Design & System Integration sector. All trades subject to confirmation.'
        },
        {
            id: 'royalcare',
            seqNo: 88,
            name: 'Royalcare Super Speciality Hospital Limited',
            shortName: 'Royal Care',
            isin: 'INE02C801010',
            category: 'Healthcare',
            industry: 'Tertiary Care Hospital & Cardiology Centers',
            logo: 'assets/logos/royalcare.svg',
            about: 'Meera Associates is a trusted broker and dealer of Royalcare Super Speciality Hospital Limited Unlisted Shares. Official Scrip #88 in the Official Directory with ISIN INE02C801010. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE02C801010', 'Official Scrip: #88', 'Sector: Healthcare'],
            overview: 'Institutional allocation and private equity facilitation for Royalcare Super Speciality Hospital Limited, operating in the Tertiary Care Hospital & Cardiology Centers sector. All trades subject to confirmation.'
        },
        {
            id: 'hella-infra',
            seqNo: 89,
            name: 'Hella Infra Market (Infra.Market)',
            shortName: 'Infra.Market',
            isin: 'INE06E501010',
            category: 'Infrastructure',
            industry: 'B2B Construction Supply & Concrete Materials',
            logo: 'assets/logos/hella-infra.svg',
            about: 'Meera Associates is a trusted broker and dealer of Hella Infra Market (Infra.Market) Unlisted Shares. Official Scrip #89 in the Official Directory with ISIN INE06E501010. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE06E501010', 'Official Scrip: #89', 'Sector: Infrastructure'],
            overview: 'Institutional allocation and private equity facilitation for Hella Infra Market (Infra.Market), operating in the B2B Construction Supply & Concrete Materials sector. All trades subject to confirmation.'
        },
        {
            id: 'taparia-tools',
            seqNo: 90,
            name: 'Taparia Tools Ltd',
            shortName: 'Taparia Tools',
            isin: 'INE614R01014',
            category: 'Manufacturing',
            industry: 'Precision Hand Tools, Pliers & Wrenches',
            logo: 'assets/logos/taparia-tools.svg',
            about: 'Meera Associates is a trusted broker and dealer of Taparia Tools Ltd Unlisted Shares. Official Scrip #90 in the Official Directory with ISIN INE614R01014. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE614R01014', 'Official Scrip: #90', 'Sector: Manufacturing'],
            overview: 'Institutional allocation and private equity facilitation for Taparia Tools Ltd, operating in the Precision Hand Tools, Pliers & Wrenches sector. All trades subject to confirmation.'
        },
        {
            id: 'gh2-solar',
            seqNo: 91,
            name: 'GH2 Solar Ltd',
            shortName: 'GH2 Solar',
            isin: 'INE1FAE01019',
            category: 'Energy',
            industry: 'Ground-Mounted Solar Farms & Green Energy',
            logo: 'assets/logos/gh2-solar.svg',
            about: 'Meera Associates is a trusted broker and dealer of GH2 Solar Ltd Unlisted Shares. Official Scrip #91 in the Official Directory with ISIN INE1FAE01019. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE1FAE01019', 'Official Scrip: #91', 'Sector: Energy'],
            overview: 'Institutional allocation and private equity facilitation for GH2 Solar Ltd, operating in the Ground-Mounted Solar Farms & Green Energy sector. All trades subject to confirmation.'
        },
        {
            id: 'lava-intl',
            seqNo: 92,
            name: 'Lava International Ltd',
            shortName: 'Lava',
            isin: 'INE745X01022',
            category: 'Technology',
            industry: 'Smartphone Hardware & EMS Manufacturing',
            logo: 'assets/logos/lava-intl.svg',
            about: 'Meera Associates is a trusted broker and dealer of Lava International Ltd Unlisted Shares. Official Scrip #92 in the Official Directory with ISIN INE745X01022. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE745X01022', 'Official Scrip: #92', 'Sector: Technology'],
            overview: 'Institutional allocation and private equity facilitation for Lava International Ltd, operating in the Smartphone Hardware & EMS Manufacturing sector. All trades subject to confirmation.'
        },
        {
            id: 'onix-renewable',
            seqNo: 93,
            name: 'Onix Renewable Ltd',
            shortName: 'Onix Renewable',
            isin: 'INE0TG701015',
            category: 'Energy',
            industry: 'Wind, Solar IPP & Renewable Generation',
            logo: 'assets/logos/onix-renewable.svg',
            about: 'Meera Associates is a trusted broker and dealer of Onix Renewable Ltd Unlisted Shares. Official Scrip #93 in the Official Directory with ISIN INE0TG701015. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE0TG701015', 'Official Scrip: #93', 'Sector: Energy'],
            overview: 'Institutional allocation and private equity facilitation for Onix Renewable Ltd, operating in the Wind, Solar IPP & Renewable Generation sector. All trades subject to confirmation.'
        },
        {
            id: 'india-exposition',
            seqNo: 94,
            name: 'India Exposition Mart (IEML)',
            shortName: 'India Expo Mart',
            isin: 'INE01JH01021',
            category: 'Infrastructure',
            industry: 'MICE, International Trade Fair Infrastructure',
            logo: 'assets/logos/india-exposition.svg',
            about: 'Meera Associates is a trusted broker and dealer of India Exposition Mart (IEML) Unlisted Shares. Official Scrip #94 in the Official Directory with ISIN INE01JH01021. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE01JH01021', 'Official Scrip: #94', 'Sector: Infrastructure'],
            overview: 'Institutional allocation and private equity facilitation for India Exposition Mart (IEML), operating in the MICE, International Trade Fair Infrastructure sector. All trades subject to confirmation.'
        },
        {
            id: 'ikf-finance',
            seqNo: 95,
            name: 'IKF Finance Ltd',
            shortName: 'IKF Finance',
            isin: 'INE859C01017',
            category: 'Financial Services',
            industry: 'Commercial Vehicle Finance & MSME Loans',
            logo: 'assets/logos/ikf-finance.svg',
            about: 'Meera Associates is a trusted broker and dealer of IKF Finance Ltd Unlisted Shares. Official Scrip #95 in the Official Directory with ISIN INE859C01017. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE859C01017', 'Official Scrip: #95', 'Sector: Financial Services'],
            overview: 'Institutional allocation and private equity facilitation for IKF Finance Ltd, operating in the Commercial Vehicle Finance & MSME Loans sector. All trades subject to confirmation.'
        },
        {
            id: 'paymate',
            seqNo: 96,
            name: 'PayMate India Ltd',
            shortName: 'PayMate',
            isin: 'INE08J501021',
            category: 'Financial Services',
            industry: 'B2B Digital Supply Chain Payments',
            logo: 'assets/logos/paymate.svg',
            about: 'Meera Associates is a trusted broker and dealer of PayMate India Ltd Unlisted Shares. Official Scrip #96 in the Official Directory with ISIN INE08J501021. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE08J501021', 'Official Scrip: #96', 'Sector: Financial Services'],
            overview: 'Institutional allocation and private equity facilitation for PayMate India Ltd, operating in the B2B Digital Supply Chain Payments sector. All trades subject to confirmation.'
        },
        {
            id: 'ticker',
            seqNo: 97,
            name: 'Ticker Ltd',
            shortName: 'Ticker',
            isin: 'INE0JS401010',
            category: 'Financial Services',
            industry: 'Financial Market Real-Time Information Feeds',
            logo: 'assets/logos/ticker.svg',
            about: 'Meera Associates is a trusted broker and dealer of Ticker Ltd Unlisted Shares. Official Scrip #97 in the Official Directory with ISIN INE0JS401010. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE0JS401010', 'Official Scrip: #97', 'Sector: Financial Services'],
            overview: 'Institutional allocation and private equity facilitation for Ticker Ltd, operating in the Financial Market Real-Time Information Feeds sector. All trades subject to confirmation.'
        },
        {
            id: 'india-gold',
            seqNo: 98,
            name: 'India Gold Metaverse Ltd',
            shortName: 'India Gold',
            isin: 'INE0TC001022',
            category: 'Technology',
            industry: 'Digital Gold Bullion & Web3 Registry',
            logo: 'assets/logos/india-gold.svg',
            about: 'Meera Associates is a trusted broker and dealer of India Gold Metaverse Ltd Unlisted Shares. Official Scrip #98 in the Official Directory with ISIN INE0TC001022. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE0TC001022', 'Official Scrip: #98', 'Sector: Technology'],
            overview: 'Institutional allocation and private equity facilitation for India Gold Metaverse Ltd, operating in the Digital Gold Bullion & Web3 Registry sector. All trades subject to confirmation.'
        },
        {
            id: 'anugraha',
            seqNo: 99,
            name: 'Anugraha Valve Casting Ltd',
            shortName: 'Anugraha Valve',
            isin: 'INE629Z01015',
            category: 'Manufacturing',
            industry: 'Industrial Valve Castings & Steel Foundries',
            logo: 'assets/logos/anugraha.png',
            about: 'Meera Associates is a trusted broker and dealer of Anugraha Valve Casting Ltd Unlisted Shares. Official Scrip #99 in the Official Directory with ISIN INE629Z01015. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE629Z01015', 'Official Scrip: #99', 'Sector: Manufacturing'],
            overview: 'Institutional allocation and private equity facilitation for Anugraha Valve Casting Ltd, operating in the Industrial Valve Castings & Steel Foundries sector. All trades subject to confirmation.'
        },
        {
            id: 'ofbusiness',
            seqNo: 100,
            name: 'OFB Tech Limited (OfBusiness)',
            shortName: 'OfBusiness',
            isin: 'INE06DH01023',
            category: 'Financial Services',
            industry: 'B2B Raw Material Commerce & SME Fintech',
            logo: 'assets/logos/ofbusiness.png',
            about: 'Meera Associates is a trusted broker and dealer of OFB Tech Limited (OfBusiness) Unlisted Shares. Official Scrip #100 in the Official Directory with ISIN INE06DH01023. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE06DH01023', 'Official Scrip: #100', 'Sector: Financial Services'],
            overview: 'Institutional allocation and private equity facilitation for OFB Tech Limited (OfBusiness), operating in the B2B Raw Material Commerce & SME Fintech sector. All trades subject to confirmation.'
        },
        {
            id: 'infobay-ai',
            seqNo: 101,
            name: 'InfoBay AI Limited',
            shortName: 'InfoBay AI',
            isin: 'INE0SE901014',
            category: 'Technology',
            industry: 'Artificial Intelligence Infrastructure & Synthetic Data',
            logo: 'assets/logos/infobay-ai.png',
            about: 'Meera Associates is a trusted broker and dealer of InfoBay AI Limited Unlisted Shares. Official Scrip #101 in the Official Directory with ISIN INE0SE901014. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE0SE901014', 'Official Scrip: #101', 'Sector: Technology'],
            overview: 'Institutional allocation and private equity facilitation for InfoBay AI Limited, operating in the Artificial Intelligence Infrastructure & Synthetic Data sector. All trades subject to confirmation.'
        },
        {
            id: 'sk-finance',
            seqNo: 102,
            name: 'SK Finance Limited',
            shortName: 'SK Finance',
            isin: 'INE124N01039',
            category: 'Financial Services',
            industry: 'Vehicle Financing & Secured MSME Lending',
            logo: 'assets/logos/sk-finance.png',
            about: 'Meera Associates is a trusted broker and dealer of SK Finance Limited Unlisted Shares. Official Scrip #102 in the Official Directory with ISIN INE124N01039. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE124N01039', 'Official Scrip: #102', 'Sector: Financial Services'],
            overview: 'Institutional allocation and private equity facilitation for SK Finance Limited, operating in the Vehicle Financing & Secured MSME Lending sector. All trades subject to confirmation.'
        },
        {
            id: 'inox-air-products',
            seqNo: 103,
            name: 'Inox Air Products Limited',
            shortName: 'Inox Air Products',
            isin: 'INE321A01020',
            category: 'Manufacturing',
            industry: 'Industrial & Medical Gas Manufacturing',
            logo: 'assets/logos/inox-air-products.png',
            about: 'Meera Associates is a trusted broker and dealer of Inox Air Products Limited Unlisted Shares. Official Scrip #103 in the Official Directory with ISIN INE321A01020. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE321A01020', 'Official Scrip: #103', 'Sector: Manufacturing'],
            overview: 'Institutional allocation and private equity facilitation for Inox Air Products Limited, operating in the Industrial & Medical Gas Manufacturing sector. All trades subject to confirmation.'
        },
        {
            id: 'goldi-solar',
            seqNo: 104,
            name: 'Goldi Solar Limited',
            shortName: 'Goldi Solar',
            isin: 'INE19IG01019',
            category: 'Energy',
            industry: 'Solar PV Module Manufacturing & Renewable EPC',
            logo: 'assets/logos/goldi-solar.png',
            about: 'Meera Associates is a trusted broker and dealer of Goldi Solar Limited Unlisted Shares. Official Scrip #104 in the Official Directory with ISIN INE19IG01019. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE19IG01019', 'Official Scrip: #104', 'Sector: Energy'],
            overview: 'Institutional allocation and private equity facilitation for Goldi Solar Limited, operating in the Solar PV Module Manufacturing & Renewable EPC sector. All trades subject to confirmation.'
        },
        {
            id: 'rkb-global',
            seqNo: 105,
            name: 'RKB Global Limited',
            shortName: 'RKB Global',
            isin: 'INE028W01017',
            category: 'Manufacturing',
            industry: 'Steel Trading, PEB Fabrication & Industrial Metals',
            logo: 'assets/logos/rkb-global.png',
            about: 'Meera Associates is a trusted broker and dealer of RKB Global Limited Unlisted Shares. Official Scrip #105 in the Official Directory with ISIN INE028W01017. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE028W01017', 'Official Scrip: #105', 'Sector: Manufacturing'],
            overview: 'Institutional allocation and private equity facilitation for RKB Global Limited, operating in the Steel Trading, PEB Fabrication & Industrial Metals sector. All trades subject to confirmation.'
        },
        {
            id: 'prabhudas-lilladher',
            seqNo: 106,
            name: 'Prabhudas Lilladher Advisory Services Ltd (PL Capital)',
            shortName: 'PL Capital',
            isin: 'INE894K01025',
            category: 'Financial Services',
            industry: 'Institutional Equities, Wealth Management & PMS/AIF',
            logo: 'assets/logos/pl-capital.png',
            about: 'Meera Associates is a trusted broker and dealer of Prabhudas Lilladher Advisory Services Ltd Unlisted Shares. Official Scrip #106 in the Official Directory with ISIN INE894K01025. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE894K01025', 'Official Scrip: #106', 'Sector: Financial Services'],
            overview: 'Institutional allocation and private equity facilitation for Prabhudas Lilladher Advisory Services Ltd (PL Capital), operating in the Institutional Equities, Wealth Management & PMS/AIF sector. All trades subject to confirmation.'
        },
        {
            id: 'inox-neo',
            seqNo: 107,
            name: 'Inox Neo Energies Limited',
            shortName: 'Inox Neo Energies',
            isin: 'INE1G8T01014',
            category: 'Energy',
            industry: 'Renewable Energy IPP, Wind & Solar Hybrid',
            logo: 'assets/logos/inox-neo.png',
            about: 'Meera Associates is a trusted broker and dealer of Inox Neo Energies Limited Unlisted Shares. Official Scrip #107 in the Official Directory with ISIN INE1G8T01014. Trades facilitated via compliant off-market depository transfer.',
            highlights: ['ISIN: INE1G8T01014', 'Official Scrip: #107', 'Sector: Energy'],
            overview: 'Institutional allocation and private equity facilitation for Inox Neo Energies Limited, operating in the Renewable Energy IPP, Wind & Solar Hybrid sector. All trades subject to confirmation.'
        }
    ];

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
    const heroEnquireBtn = document.getElementById('hero-enquire-btn');
    const bannerEnquireBtn = document.getElementById('banner-enquire-btn');

    // State Variables
    let currentCategory = 'all';
    let currentSearchQuery = '';
    let currentSortOrder = 'default'; // Preserves exact official Price List sequence (#1 to #99)

    // Render Function
    function renderCompanies() {
        if (!gridContainer) return;

        // 1. Filter by Category
        let filtered = companiesData.filter(comp => {
            if (currentCategory === 'all') return true;
            return comp.category.toLowerCase() === currentCategory.toLowerCase();
        });

        // 2. Filter by Search Query
        if (currentSearchQuery.trim()) {
            const query = currentSearchQuery.toLowerCase().trim();
            filtered = filtered.filter(comp => {
                return comp.name.toLowerCase().includes(query) ||
                       comp.shortName.toLowerCase().includes(query) ||
                       comp.isin.toLowerCase().includes(query) ||
                       comp.industry.toLowerCase().includes(query) ||
                       comp.category.toLowerCase().includes(query) ||
                       String(comp.seqNo).includes(query);
            });
        }

        // 3. Sort
        filtered.sort((a, b) => {
            if (currentSortOrder === 'default') {
                return a.seqNo - b.seqNo; // Exact 1 to 99 sequence from Official Directory
            } else if (currentSortOrder === 'az') {
                return a.name.toLowerCase().localeCompare(b.name.toLowerCase());
            } else if (currentSortOrder === 'za') {
                return b.name.toLowerCase().localeCompare(a.name.toLowerCase());
            }
            return a.seqNo - b.seqNo;
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
                <div class="card-top-bar">
                    <span class="card-seq-badge">#${comp.seqNo}</span>
                    <span class="card-category-tag">${comp.category}</span>
                </div>
                <div class="card-logo-container">
                    <img src="${comp.logo}" alt="${comp.name} Logo" class="company-logo-img" loading="lazy" onerror="this.onerror=null; this.src='assets/logos/${comp.id}.svg'; if(this.src.indexOf('.png')===-1) this.onerror=function(){this.src='assets/meera_associates_logo.png';};">
                </div>
                <div class="card-body">
                    <h3 class="company-card-name" title="${comp.name}">${comp.name}</h3>
                    <div class="card-meta-row">
                        <span class="card-isin-pill" title="ISIN Code"><span class="meta-label">ISIN:</span> ${comp.isin}</span>
                    </div>
                </div>
                <div class="card-actions">
                    <button type="button" class="btn-card-details" data-id="${comp.id}">VIEW DETAILS</button>
                    <button type="button" class="btn-card-enquire" data-company="${comp.name}">ENQUIRE</button>
                </div>
            </div>
        `).join('');

        // Attach listeners
        attachCardListeners();
    }

    // Dedicated Script Profile Pages Mapping
    const companyScriptPages = {
        'greenzo': 'scripts/greenzoenergy/greenzoenergy.html',
        'incred-capital': 'scripts/incredcapital/incredcapital.html',
        'sterlite-electric': 'scripts/sterlitepower/sterlitepower.html',
        'pxil': 'scripts/pxil/pxil.html',
        'ncdex': 'scripts/ncdex/ncdex.html',
        'pharmed': 'scripts/pharmed/pharmed.html',
        'goa-shipyard': 'scripts/goashipyard/goashipyard.html',
        'rite-water': 'scripts/ritewater/ritewater.html',
        'anugraha': 'scripts/anugrahavalve/anugrahavalve.html',
        'soleos': 'scripts/soleos/soleos.html',
        'soleos-energy': 'scripts/soleos/soleos.html',
        'proyuga': 'scripts/proyuga/proyuga.html',
        'eiffil-water': 'scripts/eiffilwater/eiffilwater.html',
        'eiffilwater': 'scripts/eiffilwater/eiffilwater.html',
        'insolare': 'scripts/insolare/insolare.html',
        'garuda-aerospace': 'scripts/garudaaerospace/garudaaerospace.html',
        'garuda': 'scripts/garudaaerospace/garudaaerospace.html',
        'hindon-mercantile': 'scripts/hindonmercantile/hindonmercantile.html',
        'hindon': 'scripts/hindonmercantile/hindonmercantile.html',
        'vivriti-next': 'scripts/vivritinext/vivritinext.html',
        'vivriti': 'scripts/vivritinext/vivritinext.html',
        'maverick': 'scripts/mavericksimulation/mavericksimulation.html',
        'maverick-simulation': 'scripts/mavericksimulation/mavericksimulation.html',
        'recyclekaro': 'scripts/recyclekaro/recyclekaro.html',
        'evergreen-recyclekaro': 'scripts/recyclekaro/recyclekaro.html',
        'cosmic-pv': 'scripts/cosmicpv/cosmicpv.html',
        'cosmicpv': 'scripts/cosmicpv/cosmicpv.html',
        'sundrops': 'scripts/sundropsenergia/sundropsenergia.html',
        'sundrops-energia': 'scripts/sundropsenergia/sundropsenergia.html',
        'ofbusiness': 'scripts/ofbusiness/ofbusiness.html',
        'ofb': 'scripts/ofbusiness/ofbusiness.html',
        'ofb-tech': 'scripts/ofbusiness/ofbusiness.html',
        'infobay': 'scripts/infobayai/infobayai.html',
        'infobay-ai': 'scripts/infobayai/infobayai.html',
        'sk-finance': 'scripts/skfinance/skfinance.html',
        'skfinance': 'scripts/skfinance/skfinance.html',
        'jsr-dynamics': 'scripts/jsrdynamics/jsrdynamics.html',
        'jsrdynamics': 'scripts/jsrdynamics/jsrdynamics.html',
        'inox-air-products': 'scripts/inoxairproducts/inoxairproducts.html',
        'inoxairproducts': 'scripts/inoxairproducts/inoxairproducts.html',
        'goldi-solar': 'scripts/goldisolar/goldisolar.html',
        'goldisolar': 'scripts/goldisolar/goldisolar.html',
        'rkb-global': 'scripts/rkbglobal/rkbglobal.html',
        'rkbglobal': 'scripts/rkbglobal/rkbglobal.html',
        'prabhudas-lilladher': 'scripts/plindia/plindia.html',
        'pl-capital': 'scripts/plindia/plindia.html',
        'plindia': 'scripts/plindia/plindia.html',
        'inox-neo': 'scripts/inoxneo/inoxneo.html',
        'inox-neo-energies': 'scripts/inoxneo/inoxneo.html',
        'inoxneo': 'scripts/inoxneo/inoxneo.html'
    };

    // Attach Click Handlers to Cards and Buttons
    function attachCardListeners() {
        const cards = gridContainer.querySelectorAll('.company-card');
        cards.forEach(card => {
            card.addEventListener('click', (e) => {
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

        const logoEl = document.getElementById('modal-detail-logo');
        if (logoEl) {
            logoEl.src = comp.logo;
            logoEl.alt = comp.name;
            logoEl.onerror = () => { logoEl.src = 'assets/meera_associates_logo.png'; };
        }
        document.getElementById('modal-detail-name').textContent = `#${comp.seqNo} • ${comp.name}`;
        document.getElementById('modal-detail-industry').textContent = `${comp.industry} | ISIN: ${comp.isin}`;
        document.getElementById('modal-detail-category').textContent = comp.category;
        document.getElementById('modal-detail-about').textContent = comp.about;
        document.getElementById('modal-detail-overview').textContent = comp.overview;

        const highlightsList = document.getElementById('modal-detail-highlights');
        if (highlightsList && comp.highlights) {
            const cleanHighlights = comp.highlights.filter(h => !h.toLowerCase().includes('price') && !h.includes('₹'));
            highlightsList.innerHTML = cleanHighlights.map(h => `<li><span class="highlight-bullet">✓</span> ${h}</li>`).join('');
        }

        // Populate Company-Specific FAQs in Modal
        const faqsListEl = document.getElementById('modal-detail-faqs-list');
        if (faqsListEl) {
            const companyFaqs = [
                {
                    q: `How do I buy unlisted shares of ${comp.shortName}?`,
                    a: `Contact Meera Associates at <a href="tel:+918983388881" style="color: #0284c7; font-weight: 700;">+91 89833 88881</a>. We confirm current lot sizing and pricing, verify your KYC and Demat Client Master List (CML), and transfer the shares directly into your Demat account under ISIN <strong>${comp.isin}</strong> within 24 business hours.`
                },
                {
                    q: `Can I sell my existing ${comp.shortName} shares to Meera Associates?`,
                    a: `<strong>Yes, guaranteed same-day payout.</strong> Meera Associates buys existing ${comp.shortName} shares. Transfer the shares to our designated clearing Demat account via CDSL Easiest or NSDL, and funds are credited directly to your bank account via RTGS/NEFT on the exact same business day.`
                },
                {
                    q: `What is the official ISIN and Depository status of ${comp.shortName}?`,
                    a: `The official ISIN for ${comp.name} is <strong>${comp.isin}</strong>. The equity shares are fully dematerialized and eligible for custody across both NSDL and CDSL depositories.`
                },
                {
                    q: `Where will ${comp.shortName} shares reflect after purchase?`,
                    a: `After depository transfer, the shares appear under ISIN <strong>${comp.isin}</strong> in your existing broker Demat portfolio (Zerodha, Groww, Angel One, Upstox, HDFC, ICICI, etc.) and in your monthly NSDL/CDSL Consolidated Account Statement (CAS).`
                },
                {
                    q: `What happens if ${comp.shortName} executes an IPO?`,
                    a: `When the company files its DRHP and lists on the NSE or BSE, your pre-IPO Demat shares automatically transition into publicly traded listed shares under the designated listed ISIN, subject to SEBI's 6-month pre-IPO lock-in from commercial listing.`
                }
            ];

            faqsListEl.innerHTML = companyFaqs.map((faq, idx) => `
                <div class="modal-company-faq-item ${idx === 0 ? 'active' : ''}">
                    <button type="button" class="modal-company-faq-q" aria-expanded="${idx === 0}">
                        <span>${faq.q}</span>
                        <span class="modal-faq-arrow">▼</span>
                    </button>
                    <div class="modal-company-faq-a" style="${idx === 0 ? 'display: block;' : ''}">
                        <p style="margin: 0;">${faq.a}</p>
                    </div>
                </div>
            `).join('');

            // Attach accordion toggle to modal FAQ questions
            faqsListEl.querySelectorAll('.modal-company-faq-q').forEach(qBtn => {
                qBtn.addEventListener('click', (e) => {
                    e.stopPropagation();
                    const item = qBtn.closest('.modal-company-faq-item');
                    const ans = item.querySelector('.modal-company-faq-a');
                    const isActive = item.classList.contains('active');
                    
                    item.classList.toggle('active', !isActive);
                    if (ans) {
                        ans.style.display = isActive ? 'none' : 'block';
                    }
                });
            });
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
        enquiryForm.addEventListener('submit', async (e) => {
            e.preventDefault();

            const submitBtn = enquiryForm.querySelector('.enquiry-submit-btn');
            const originalBtnHTML = submitBtn ? submitBtn.innerHTML : '';
            if (submitBtn) {
                submitBtn.disabled = true;
                submitBtn.innerHTML = '<span>â³ Sending Enquiry...</span>';
            }

            const company = (document.getElementById('enquiry-company-name')?.value || '').trim();
            const name = (document.getElementById('enquiry-user-name')?.value || '').trim();
            const mobile = (document.getElementById('enquiry-user-mobile')?.value || '').trim();
            const email = (document.getElementById('enquiry-user-email')?.value || '').trim();
            const quantity = (document.getElementById('enquiry-user-quantity')?.value || '').trim();
            const message = (document.getElementById('enquiry-user-message')?.value || '').trim();

            const payload = {
                _subject: `Unlisted Shares Allocation Enquiry: ${company || 'General'} - ${name}`,
                "Target Company": company,
                "Full Name": name,
                "Mobile Number": mobile,
                "Email Address": email,
                "Quantity / Requirement": quantity || 'Standard Lot',
                "Message Details": message,
                "Source Page": "Unlisted Shares Directory Modal",
                "Submission Time": new Date().toLocaleString('en-IN', { timeZone: 'Asia/Kolkata' }),
                _template: 'table',
                _captcha: 'false'
            };
            if (email) payload._replyto = email;

            try {
                await fetch('https://formsubmit.co/ajax/contact.meeraassociates@gmail.com', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                        'Accept': 'application/json'
                    },
                    body: JSON.stringify(payload)
                });
            } catch (err) {
                console.warn('Enquiry form submission notice:', err);
            } finally {
                if (submitBtn) {
                    submitBtn.disabled = false;
                    submitBtn.innerHTML = originalBtnHTML;
                }
            }

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
