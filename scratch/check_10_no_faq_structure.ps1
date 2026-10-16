$noFaqScrips = @(
    @{ name = "goldisolar"; prefix = "goldi" },
    @{ name = "infobayai"; prefix = "infobay" },
    @{ name = "inoxairproducts"; prefix = "inoxair" },
    @{ name = "inoxneo"; prefix = "inoxneo" },
    @{ name = "jsrdynamics"; prefix = "jsr" },
    @{ name = "ofbusiness"; prefix = "ofb" },
    @{ name = "plindia"; prefix = "pl" },
    @{ name = "rkbglobal"; prefix = "rkb" },
    @{ name = "skfinance"; prefix = "skfinance" },
    @{ name = "sundropsenergia"; prefix = "sundrops" }
)

foreach ($s in $noFaqScrips) {
    $dir = $s.name
    $html = Get-Content "scripts/$dir/$dir.html" -Raw -Encoding UTF8
    $asideMatch = [regex]::Match($html, '(?s)(<div class="[^"]*card[^"]*"[^>]*>.*?</div>\s*)(</div>\s*<!--\s*RIGHT COLUMN|<aside)')
    Write-Host "$dir => Found insertion point: $($asideMatch.Success)"
}
