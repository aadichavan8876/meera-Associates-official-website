$scrips20 = @(
    "cosmicpv", "eiffilwater", "garudaaerospace", "goldisolar", "hindonmercantile",
    "infobayai", "inoxairproducts", "inoxneo", "insolare", "jsrdynamics",
    "mavericksimulation", "ofbusiness", "plindia", "proyuga", "recyclekaro",
    "rkbglobal", "skfinance", "soleos", "sundropsenergia", "vivritinext"
)

foreach ($s in $scrips20) {
    $file = "scripts/$s/$s.html"
    $content = Get-Content $file -Raw -Encoding UTF8

    $cardMatches = [regex]::Matches($content, '<div class="([a-zA-Z0-9_-]+-card)"')
    $prefixes = @()
    foreach ($cm in $cardMatches) {
        $name = $cm.Groups[1].Value
        if ($name -notmatch 'metric' -and $name -notmatch 'sidebar' -and $name -notmatch 'director' -and $name -notmatch 'product' -and $name -notmatch 'project' -and $name -notmatch 'filing') {
            $prefixes += $name
        }
    }
    $uniquePrefix = $prefixes | Select-Object -Unique -First 1
    Write-Host "$s : $uniquePrefix"
}
