$scrips20 = @(
    "cosmicpv", "eiffilwater", "garudaaerospace", "goldisolar", "hindonmercantile",
    "infobayai", "inoxairproducts", "inoxneo", "insolare", "jsrdynamics",
    "mavericksimulation", "ofbusiness", "plindia", "proyuga", "recyclekaro",
    "rkbglobal", "skfinance", "soleos", "sundropsenergia", "vivritinext"
)

foreach ($s in $scrips20) {
    $file = "scripts/$s/$s.html"
    $content = Get-Content $file -Raw -Encoding UTF8

    $cardMatch = [regex]::Match($content, '<div class="([a-zA-Z0-9_-]+)-card"')
    $prefix = if ($cardMatch.Success) { $cardMatch.Groups[1].Value } else { "unknown" }

    $asideMatch = [regex]::Match($content, '(?s)(</div>\s*<!--\s*(?:RIGHT COLUMN|Sticky Executive Sidebar)[^>]*-->\s*<aside)')
    if (-not $asideMatch.Success) {
        $asideMatch = [regex]::Match($content, '(?s)(</div>\s*<aside)')
    }

    $hasInsert = $asideMatch.Success
    Write-Host "$s : prefix=$prefix, insertionPointFound=$hasInsert"
}
