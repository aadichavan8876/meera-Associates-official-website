$utf8NoBom = New-Object System.Text.UTF8Encoding($false)

$scrips20 = @(
    @{ Dir = "cosmicpv"; Prefix = "cosmicpv"; CardClass = "cosmicpv-card"; Title = "Cosmic PV Power Limited"; ISIN = "INE13V701016"; Moat = "Cosmic PV Power is a high-growth solar PV module manufacturer capitalizing on India's clean energy targets, government ALMM mandates, and expanding commercial & industrial rooftop and utility-scale solar installations nationwide." },
    @{ Dir = "eiffilwater"; Prefix = "eiffil"; CardClass = "eiffil-card"; Title = "Eiffil Water Infra Limited"; ISIN = "INE1GFM01019"; Moat = "Eiffil Water Infra specializes in comprehensive water treatment, bulk water transmission pipelines, distribution networks, overhead storage tanks, and EPC infrastructure across key municipal and industrial corridors." },
    @{ Dir = "garudaaerospace"; Prefix = "garuda"; CardClass = "garuda-card"; Title = "Garuda Aerospace Limited"; ISIN = "INE0REL01021"; Moat = "Garuda Aerospace is India's leading DGCA-approved drone manufacturer with a vast Drone-as-a-Service (DaaS) fleet deployed across agricultural precision spraying, industrial surveying, defence surveillance, and structural mapping." },
    @{ Dir = "goldisolar"; Prefix = "goldi"; CardClass = "goldi-card"; Title = "Goldi Solar Limited"; ISIN = "INE19IG01019"; Moat = "Goldi Solar is a Tier-1 solar photovoltaic module manufacturer and renewable EPC powerhouse with multi-gigawatt module manufacturing facilities servicing residential, commercial, industrial, and utility-scale solar projects globally." },
    @{ Dir = "hindonmercantile"; Prefix = "hindon"; CardClass = "hindon-card"; Title = "Hindon Mercantile Limited"; ISIN = "INE08GI01012"; Moat = "Hindon Mercantile operates as a specialized green financing NBFC focused on electric vehicle (EV) financing, green supply chain loans, clean energy debt, and technology-driven MSME capital solutions." },
    @{ Dir = "infobayai"; Prefix = "infobay"; CardClass = "infobay-card"; Title = "InfoBay AI Limited"; ISIN = "INE0SE901014"; Moat = "InfoBay AI delivers high-accuracy enterprise synthetic data, specialized fine-tuning pipelines, LLM alignment frameworks, and automated AI infrastructure for global enterprise and institutional software deployments." },
    @{ Dir = "inoxairproducts"; Prefix = "inoxap"; CardClass = "inoxap-card"; Title = "Inox Air Products Limited"; ISIN = "INE321A01020"; Moat = "Inox Air Products is India's largest manufacturer of industrial and medical gases, operating 45+ cryogenic air separation plants with an expansive national liquid oxygen, nitrogen, argon, and hydrogen supply chain." },
    @{ Dir = "inoxneo"; Prefix = "inoxneo"; CardClass = "inoxneo-card"; Title = "Inox Neo Energies Limited"; ISIN = "INE1G8T01014"; Moat = "Inox Neo Energies develops and operates utility-scale onshore wind and hybrid energy assets, driving multi-gigawatt green energy generation through long-term power purchase agreements (PPAs) with SECI and commercial off-takers." },
    @{ Dir = "insolare"; Prefix = "insolare"; CardClass = "insolare-card"; Title = "InSolare Energy Limited"; ISIN = "INE0TSJ01021"; Moat = "InSolare Energy is a veteran solar EPC and renewable asset management provider delivering turnkey ground-mount utility solar farms, industrial rooftop micro-grids, and high-uptime operations & maintenance nationwide." },
    @{ Dir = "jsrdynamics"; Prefix = "jsrdynamics"; CardClass = "jsrdynamics-card"; Title = "JSR Dynamics Limited"; ISIN = "INE0JFD01014"; Moat = "JSR Dynamics is an indigenous defence and aerospace manufacturing enterprise developing advanced Long-Range Glide Bombs (LRGB), Jet-Powered precision munitions, and aerodynamic Range Extension Kits for the Armed Forces." },
    @{ Dir = "mavericksimulation"; Prefix = "maverick"; CardClass = "maverick-card"; Title = "Maverick Simulation Solutions Limited"; ISIN = "INE1BEQ01014"; Moat = "Maverick Simulation Solutions engineers mission-critical combat simulators, full-mission flight and naval training simulators, and advanced clinical patient human manikins for global defence and healthcare institutions." },
    @{ Dir = "ofbusiness"; Prefix = "ofbusiness"; CardClass = "ofbusiness-card"; Title = "OFB Tech Limited (OfBusiness)"; ISIN = "INE06DH01023"; Moat = "OfBusiness is an institutional B2B commerce and supply chain financing giant, providing raw material procurement (steel, chemicals, polymers, agri) and tech-enabled working capital to thousands of Indian manufacturing SMEs." },
    @{ Dir = "plindia"; Prefix = "pl"; CardClass = "pl-card"; Title = "Prabhudas Lilladher Advisory Services Ltd"; ISIN = "INE894K01025"; Moat = "Prabhudas Lilladher (PL) is a premier 80-year-old financial services institution providing institutional equity research, PMS, wealth advisory, equity broking, investment banking, and capital market services." },
    @{ Dir = "proyuga"; Prefix = "proyuga"; CardClass = "proyuga-card"; Title = "Proyuga Advanced Technologies Limited"; ISIN = "INE495Y01014"; Moat = "Proyuga Advanced Technologies is the creator of iB Cricket, the world's premier immersive virtual reality (VR) sports and entertainment platform delivering realistic sports physics and competitive eSport leagues across 30+ nations." },
    @{ Dir = "recyclekaro"; Prefix = "recyclekaro"; CardClass = "recyclekaro-card"; Title = "Evergreen Recyclekaro (India) Limited"; ISIN = "INE0HAD01019"; Moat = "Recyclekaro is India's pioneer in electronic waste recycling and hydrometallurgical lithium-ion battery recycling, extracting critical battery-grade materials (lithium, cobalt, nickel) with zero carbon waste." },
    @{ Dir = "rkbglobal"; Prefix = "rkb"; CardClass = "rkb-card"; Title = "RKB Global Limited"; ISIN = "INE028W01017"; Moat = "RKB Global is an integrated steel processing, international commodity trading, and agricultural logistics enterprise managing large-scale supply chain fulfillment across major Indian manufacturing hubs." },
    @{ Dir = "skfinance"; Prefix = "skfinance"; CardClass = "skfinance-card"; Title = "SK Finance Limited"; ISIN = "INE124N01039"; Moat = "SK Finance is a leading retail NBFC specialized in commercial vehicle loans, tractor finance, used car financing, and micro-business MSME loans with an extensive 500+ branch footprint across northern and western India." },
    @{ Dir = "soleos"; Prefix = "soleos"; CardClass = "soleos-card"; Title = "Soleos Energy Limited"; ISIN = "INE0VL901028"; Moat = "Soleos Energy is an international solar EPC contractor and independent power producer (IPP) delivering high-efficiency ground-mount solar power plants and commercial energy projects across India, Europe, and Africa." },
    @{ Dir = "sundropsenergia"; Prefix = "sundrops"; CardClass = "sundrops-card"; Title = "Sun Drops Energia Limited"; ISIN = "INE0H1U01025"; Moat = "Sun Drops Energia develops, owns, and operates utility-scale solar generation plants, supplying cost-effective clean power through captive open-access models and bilateral corporate power purchase agreements." },
    @{ Dir = "vivritinext"; Prefix = "vivriti"; CardClass = "vivriti-card"; Title = "Vivriti Next Limited"; ISIN = "INE0OUB01017"; Moat = "Vivriti Next (part of the Vivriti Capital ecosystem) provides institutional-grade mid-market enterprise debt financing, structured finance, securitization, and digital capital market solutions across emerging Indian enterprises." }
)

$insertedCount = 0

foreach ($scrip in $scrips20) {
    $dir = $scrip.Dir
    $path = "scripts/$dir/$dir.html"
    $content = [System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)

    # Find the insertion point: right before the closing </div> of the content column
    $asideIdx = $content.IndexOf("<aside")
    if ($asideIdx -lt 0) {
        Write-Host "Could not find <aside in $dir" -ForegroundColor Red
        continue
    }

    $beforeAside = $content.Substring(0, $asideIdx)
    $lastDivClose = $beforeAside.LastIndexOf("</div>")
    if ($lastDivClose -lt 0) {
        Write-Host "Could not find closing div before aside in $dir" -ForegroundColor Red
        continue
    }

    $prefix = $scrip.Prefix
    $cardClass = $scrip.CardClass
    $title = $scrip.Title
    $isin = $scrip.ISIN
    $moat = $scrip.Moat

    $faqHtml = @"

                <!-- Frequently Asked Questions -->
                <div class="$cardClass">
                    <div class="$prefix-card-header">
                        <h2 class="$prefix-card-title">
                            <span class="$prefix-card-title-icon">❓</span>
                            Frequently Asked Questions
                        </h2>
                        <span class="$prefix-card-tag">Investor Intelligence</span>
                    </div>

                    <div class="faq-accordion">
                        <div class="faq-item">
                            <div class="faq-question">
                                <span>How can I buy or sell $title unlisted shares through Meera Associates?</span>
                                <span class="faq-arrow">▾</span>
                            </div>
                            <div class="faq-answer">
                                <p>To buy or sell unlisted shares of $title, contact Meera Associates via WhatsApp or call our advisory desk at <a href="tel:+918983388881" style="color: #0284c7; font-weight: 700;">+91 89833 88881</a>. We verify real-time institutional block liquidity, negotiate competitive pricing, and execute compliant off-market depository settlements.</p>
                            </div>
                        </div>

                        <div class="faq-item">
                            <div class="faq-question">
                                <span>What is the settlement and delivery mechanism for $title shares?</span>
                                <span class="faq-arrow">▾</span>
                            </div>
                            <div class="faq-answer">
                                <p>Shares carry ISIN <strong>$isin</strong>. Settlement is conducted electronically via off-market depository transfer through CDSL Easiest or NSDL Speed-e/DIS slips. Shares are credited directly into your client Demat account before final fund remittance.</p>
                            </div>
                        </div>

                        <div class="faq-item">
                            <div class="faq-question">
                                <span>What are the key business drivers and valuation fundamentals of $title?</span>
                                <span class="faq-arrow">▾</span>
                            </div>
                            <div class="faq-answer">
                                <p>$moat</p>
                            </div>
                        </div>
                    </div>
                </div>

"@

    $newContent = $content.Substring(0, $lastDivClose) + $faqHtml + $content.Substring($lastDivClose)

    [System.IO.File]::WriteAllText($path, $newContent, $utf8NoBom)
    Write-Host "Inserted FAQ card in $dir" -ForegroundColor Green
    $insertedCount++
}

Write-Host "Successfully inserted FAQ in $insertedCount / $($scrips20.Count) files" -ForegroundColor Cyan
