$utf8NoBom = New-Object System.Text.UTF8Encoding($false)

$titles = @{
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

    $target = "valuation fundamentals of </span>"
    $replacement = "valuation fundamentals of $title?</span>"

    if ($c.Contains($target)) {
        $newContent = $c.Replace($target, $replacement)
        [System.IO.File]::WriteAllText($path, $newContent, $utf8NoBom)
        Write-Host "Updated Q3 in $dir" -ForegroundColor Green
    } else {
        Write-Host "Target not found in $dir" -ForegroundColor Red
    }
}
