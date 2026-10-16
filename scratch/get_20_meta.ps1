$scrips20 = @(
    "cosmicpv", "eiffilwater", "garudaaerospace", "goldisolar", "hindonmercantile",
    "infobayai", "inoxairproducts", "inoxneo", "insolare", "jsrdynamics",
    "mavericksimulation", "ofbusiness", "plindia", "proyuga", "recyclekaro",
    "rkbglobal", "skfinance", "soleos", "sundropsenergia", "vivritinext"
)

foreach ($s in $scrips20) {
    $file = "scripts/$s/$s.html"
    $c = Get-Content $file -Raw -Encoding UTF8

    $titleMatch = [regex]::Match($c, '<h1[^>]*>(.*?)</h1>')
    $isinMatch = [regex]::Match($c, 'INE[A-Z0-9]{9}')
    $descMatch = [regex]::Match($c, '(?s)<p class="[^"]*desc[^"]*">(.*?)</p>')

    $title = if ($titleMatch.Success) { ($titleMatch.Groups[1].Value -replace '<[^>]+>', '').Trim() } else { $s }
    $isin = if ($isinMatch.Success) { $isinMatch.Value } else { "Active Demat" }
    $desc = if ($descMatch.Success) { ($descMatch.Groups[1].Value -replace '<[^>]+>', '').Trim() } else { "" }

    Write-Host "Scrip: $s | Title: $title | ISIN: $isin"
    if ($desc.Length -gt 0) {
        Write-Host "  Desc: $($desc.Substring(0, [Math]::Min(120, $desc.Length)))..."
    }
}
