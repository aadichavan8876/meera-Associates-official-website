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

    $target1 = "<span>What are the key business drivers and valuation fundamentals of </span>"
    $target2 = "<span>What are the key business drivers and valuation fundamentals of </span>"
    $replacement = "<span>What are the key business drivers and valuation fundamentals of $title?</span>"

    if ($c.Contains($target1)) {
        $c = $c.Replace($target1, $replacement)
        [System.IO.File]::WriteAllText($path, $c, $utf8NoBom)
        Write-Host "Updated Q3 in $dir" -ForegroundColor Green
    } else {
        # Try regex
        $pattern = '<span>What are the key business drivers and valuation fundamentals of\s*</span>'
        if ($c -match $pattern) {
            $c = [regex]::Replace($c, $pattern, $replacement)
            [System.IO.File]::WriteAllText($path, $c, $utf8NoBom)
            Write-Host "Updated Q3 via regex in $dir" -ForegroundColor Green
        }
    }
}
