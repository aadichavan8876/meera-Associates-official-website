$scrips20 = @(
    "cosmicpv", "eiffilwater", "garudaaerospace", "goldisolar", "hindonmercantile",
    "infobayai", "inoxairproducts", "inoxneo", "insolare", "jsrdynamics",
    "mavericksimulation", "ofbusiness", "plindia", "proyuga", "recyclekaro",
    "rkbglobal", "skfinance", "soleos", "sundropsenergia", "vivritinext"
)

foreach ($s in $scrips20) {
    $file = "scripts/$s/$s.html"
    $c = Get-Content $file -Raw -Encoding UTF8

    # Check insertion pattern
    # The left column closes right before <aside
    $asideIdx = $c.IndexOf("<aside")
    if ($asideIdx -gt 0) {
        $beforeAside = $c.Substring(0, $asideIdx)
        $lastDivClose = $beforeAside.LastIndexOf("</div>")
        if ($lastDivClose -gt 0) {
            Write-Host "$s : found insertion point at index $lastDivClose (chars before aside: $($asideIdx - $lastDivClose))"
        } else {
            Write-Host "FAILED to find last div close before aside in $s" -ForegroundColor Red
        }
    } else {
        Write-Host "FAILED to find <aside in $s" -ForegroundColor Red
    }
}
