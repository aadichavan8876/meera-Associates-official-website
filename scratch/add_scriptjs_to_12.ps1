$utf8NoBom = New-Object System.Text.UTF8Encoding($false)

$missing12 = @(
    "cosmicpv", "goldisolar", "infobayai", "inoxairproducts", "inoxneo",
    "jsrdynamics", "ofbusiness", "plindia", "recyclekaro", "rkbglobal",
    "skfinance", "sundropsenergia"
)

foreach ($dir in $missing12) {
    $path = "scripts\$dir\$dir.html"
    $c = [System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)

    if (-not $c.Contains("script.js")) {
        # Insert <script src="../../script.js"></script> before </body>
        $bodyCloseIdx = $c.LastIndexOf("</body>")
        if ($bodyCloseIdx -gt 0) {
            $insert = "    <script src=""../../script.js""></script>`r`n"
            $newC = $c.Substring(0, $bodyCloseIdx) + $insert + $c.Substring($bodyCloseIdx)
            [System.IO.File]::WriteAllText($path, $newC, $utf8NoBom)
            Write-Host "Added script.js to $dir" -ForegroundColor Green
        }
    }
}
