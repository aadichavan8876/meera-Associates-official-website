$scriptDirs = Get-ChildItem -Path scripts -Directory
Write-Host "Total script directories: $($scriptDirs.Count)"

$prefixes = @{
    "anugrahavalve" = "anugraha"; "carehealth" = "care"; "cosmicpv" = "cosmic"; "eiffilwater" = "eiffil";
    "garudaaerospace" = "garuda"; "goashipyard" = "goa"; "goldisolar" = "goldi"; "greenzoenergy" = "greenzo";
    "hdfcsecurities" = "hdfcsec"; "hindonmercantile" = "hindon"; "hpx" = "hpx"; "incredcapital" = "incred";
    "indofil" = "indofil"; "infobayai" = "infobay"; "inoxairproducts" = "inoxair"; "inoxneo" = "inoxneo";
    "insolare" = "insolare"; "jsrdynamics" = "jsr"; "mavericksimulation" = "maverick"; "motilaloswalhf" = "mohf";
    "msei" = "msei"; "nayaraenergy" = "nayara"; "ncdex" = "ncdex"; "nerl" = "nerl"; "ofbusiness" = "ofb";
    "oyo" = "oyo"; "pharmed" = "pharmed"; "plindia" = "plindia"; "proyuga" = "proyuga"; "pxil" = "pxil";
    "recyclekaro" = "recycle"; "ritewater" = "ritewater"; "rkbglobal" = "rkb"; "skfinance" = "skfin";
    "soleos" = "soleos"; "sterlitegrid5" = "sgl5"; "sterlitepower" = "sterlite"; "sundropsenergia" = "sundrops";
    "vivritinext" = "vivriti"
}

$results = foreach ($d in $scriptDirs) {
    $name = $d.Name
    $p = $prefixes[$name]
    $htmlFile = Get-ChildItem -Path $d.FullName -Filter *.html | Select-Object -First 1
    if (-not $htmlFile) { continue }
    
    $html = Get-Content $htmlFile.FullName -Raw -Encoding UTF8
    
    # Check Header
    $headerOk = $html.Contains('<header class="navbar" id="main-header">') -and
                $html.Contains('class="hamburger" id="hamburger-btn"') -and
                (-not $html.Contains('careers.html')) -and
                $html.Contains('upcoming-ipos.html') -and
                $html.Contains('nav-social-links')
                
    # Check Hero
    $heroTitleOk = $html.Contains("$p-hero-title")
    $heroSubOk = $html.Contains("$p-hero-subtitle")
    $heroBadgeOk = $html.Contains("$p-hero-badge")
    $heroStripOk = $html.Contains("$p-metrics-strip")
    $heroCardOk = $html.Contains("$p-metric-card")
    $heroAllOk = $heroTitleOk -and $heroSubOk -and $heroBadgeOk -and $heroStripOk -and $heroCardOk
    
    # Check Footer
    $footerOk = $html.Contains('class="footer"') -and
                $html.Contains('Dashmesh Square') -and
                $html.Contains('Regulatory Notice') -and
                (-not $html.Contains('careers.html'))
                
    [PSCustomObject]@{
        Scrip = $name
        Prefix = $p
        HeaderOk = $headerOk
        HeroOk = $heroAllOk
        FooterOk = $footerOk
        HeroDetails = "Title:$heroTitleOk Sub:$heroSubOk Badge:$heroBadgeOk Strip:$heroStripOk Card:$heroCardOk"
    }
}

$anomalies = $results | Where-Object { -not $_.HeaderOk -or -not $_.HeroOk -or -not $_.FooterOk }
Write-Host "Total anomalies: $($anomalies.Count)"
$anomalies | Format-Table -AutoSize
