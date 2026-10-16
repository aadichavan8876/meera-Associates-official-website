$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
$baseCss = [System.IO.File]::ReadAllText("scripts/ppfas/ppfas.css", [System.Text.Encoding]::UTF8)

# Checkmark is Unicode 0x2713
$checkChar = [char]0x2713
$baseCss = $baseCss.Replace("content: '" + $checkChar + "';", "content: '\2713';")
$baseCss = $baseCss.Replace('content: "' + $checkChar + '";', "content: '\2713';")

$configs = @(
    @{ p = "orbis"; f = "scripts/orbisfinancial/orbisfinancial.css" },
    @{ p = "herofincorp"; f = "scripts/herofincorp/herofincorp.css" },
    @{ p = "csk"; f = "scripts/csk/csk.css" },
    @{ p = "goodluck"; f = "scripts/goodluckdefence/goodluckdefence.css" },
    @{ p = "kineco"; f = "scripts/kineco/kineco.css" }
)

foreach ($c in $configs) {
    $css = $baseCss -replace "ppfas", $c.p
    $path = (Resolve-Path $c.f).Path
    [System.IO.File]::WriteAllText($path, $css, $utf8NoBom)
    Write-Host "Generated clean CSS for $($c.f)"
}

# Update all other CSS files to use '\2713'
$allCss = Get-ChildItem -Path "scripts" -Filter "*.css" -Recurse
foreach ($cf in $allCss) {
    $cText = [System.IO.File]::ReadAllText($cf.FullName, [System.Text.Encoding]::UTF8)
    if ($cText.Contains("content: '" + $checkChar + "';") -or $cText.Contains('content: "' + $checkChar + '";')) {
        $newText = $cText.Replace("content: '" + $checkChar + "';", "content: '\2713';")
        $newText = $newText.Replace('content: "' + $checkChar + '";', "content: '\2713';")
        [System.IO.File]::WriteAllText($cf.FullName, $newText, $utf8NoBom)
        Write-Host "Updated checkmark to safe escape in $($cf.Name)"
    }
}
