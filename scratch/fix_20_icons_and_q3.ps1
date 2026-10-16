$utf8NoBom = New-Object System.Text.UTF8Encoding($false)

$titles = @{
    "cosmicpv" = "Cosmic PV Power Limited"
    "eiffilwater" = "Eiffil Water Infra Limited"
    "garudaaerospace" = "Garuda Aerospace Limited"
    "goldisolar" = "Goldi Solar Limited"
    "hindonmercantile" = "Hindon Mercantile Limited"
    "infobayai" = "InfoBay AI Limited"
    "inoxairproducts" = "Inox Air Products Limited"
    "inoxneo" = "Inox Neo Energies Limited"
    "insolare" = "InSolare Energy Limited"
    "jsrdynamics" = "JSR Dynamics Limited"
    "mavericksimulation" = "Maverick Simulation Solutions Limited"
    "ofbusiness" = "OFB Tech Limited (OfBusiness)"
    "plindia" = "Prabhudas Lilladher Advisory Services Ltd"
    "proyuga" = "Proyuga Advanced Technologies Limited"
    "recyclekaro" = "Evergreen Recyclekaro (India) Limited"
    "rkbglobal" = "RKB Global Limited"
    "skfinance" = "SK Finance Limited"
    "soleos" = "Soleos Energy Limited"
    "sundropsenergia" = "Sun Drops Energia Limited"
    "vivritinext" = "Vivriti Next Limited"
}

foreach ($dir in $titles.Keys) {
    $path = "scripts/$dir/$dir.html"
    $c = [System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)
    $title = $titles[$dir]

    # 1. Fix icon to clean &#10067; or ❓
    $c = [regex]::Replace($c, '(<span class="[a-zA-Z0-9_-]+-card-title-icon">)[^<]+(</span>\s*Frequently Asked Questions)', '${1}&#10067;${2}')

    # 2. Fix Question 3 if it was truncated
    $c = [regex]::Replace($c, '<span>What are the key business drivers and valuation fundamentals of \s*</span>', "<span>What are the key business drivers and valuation fundamentals of $title?</span>")

    [System.IO.File]::WriteAllText($path, $c, $utf8NoBom)
    Write-Host "Fixed icon and Q3 in $dir" -ForegroundColor Green
}
