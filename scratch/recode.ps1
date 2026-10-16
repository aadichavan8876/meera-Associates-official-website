# Recode helper to fix Windows-1252 -> UTF8 mojibake
$files = @(
    "scripts/ppfas/ppfas.html",
    "scripts/frickindia/frickindia.html",
    "scripts/sundayproptech/sundayproptech.html",
    "scripts/carrier/carrier.html",
    "scripts/cial/cial.html"
)

$enc1252 = [System.Text.Encoding]::GetEncoding("windows-1252")
$utf8NoBom = New-Object System.Text.UTF8Encoding($false)

foreach ($f in $files) {
    $text = [System.IO.File]::ReadAllText((Resolve-Path $f).Path, [System.Text.Encoding]::UTF8)
    $bytes = $enc1252.GetBytes($text)
    $recovered = [System.Text.Encoding]::UTF8.GetString($bytes)
    [System.IO.File]::WriteAllText((Resolve-Path $f).Path, $recovered, $utf8NoBom)
    Write-Host "Recoded: $f"
}
