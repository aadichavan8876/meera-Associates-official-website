$utf8NoBom = New-Object System.Text.UTF8Encoding($false)

$items = @(
    [PSCustomObject]@{ Dir = "cosmicpv"; Title = "Cosmic PV Power Limited" },
    [PSCustomObject]@{ Dir = "eiffilwater"; Title = "Eiffil Water Infra Limited" },
    [PSCustomObject]@{ Dir = "garudaaerospace"; Title = "Garuda Aerospace Limited" },
    [PSCustomObject]@{ Dir = "goldisolar"; Title = "Goldi Solar Limited" },
    [PSCustomObject]@{ Dir = "hindonmercantile"; Title = "Hindon Mercantile Limited" },
    [PSCustomObject]@{ Dir = "infobayai"; Title = "InfoBay AI Limited" },
    [PSCustomObject]@{ Dir = "inoxairproducts"; Title = "Inox Air Products Limited" },
    [PSCustomObject]@{ Dir = "inoxneo"; Title = "Inox Neo Energies Limited" },
    [PSCustomObject]@{ Dir = "insolare"; Title = "InSolare Energy Limited" },
    [PSCustomObject]@{ Dir = "jsrdynamics"; Title = "JSR Dynamics Limited" },
    [PSCustomObject]@{ Dir = "mavericksimulation"; Title = "Maverick Simulation Solutions Limited" },
    [PSCustomObject]@{ Dir = "ofbusiness"; Title = "OFB Tech Limited (OfBusiness)" },
    [PSCustomObject]@{ Dir = "plindia"; Title = "Prabhudas Lilladher Advisory Services Ltd" },
    [PSCustomObject]@{ Dir = "proyuga"; Title = "Proyuga Advanced Technologies Limited" },
    [PSCustomObject]@{ Dir = "recyclekaro"; Title = "Evergreen Recyclekaro (India) Limited" },
    [PSCustomObject]@{ Dir = "rkbglobal"; Title = "RKB Global Limited" },
    [PSCustomObject]@{ Dir = "skfinance"; Title = "SK Finance Limited" },
    [PSCustomObject]@{ Dir = "soleos"; Title = "Soleos Energy Limited" },
    [PSCustomObject]@{ Dir = "sundropsenergia"; Title = "Sun Drops Energia Limited" },
    [PSCustomObject]@{ Dir = "vivritinext"; Title = "Vivriti Next Limited" }
)

foreach ($item in $items) {
    $dir = $item.Dir
    $title = $item.Title
    $path = "scripts\$dir\$dir.html"
    $c = [System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)

    $target = "valuation fundamentals of </span>"
    $replacement = "valuation fundamentals of " + $title + "?</span>"

    if ($c.Contains($target)) {
        $c = $c.Replace($target, $replacement)
        [System.IO.File]::WriteAllText($path, $c, $utf8NoBom)
        Write-Host "Updated $dir with title: $title" -ForegroundColor Green
    } else {
        Write-Host "Target not found in $dir" -ForegroundColor Yellow
    }
}
