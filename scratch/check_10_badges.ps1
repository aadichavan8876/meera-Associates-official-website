$ten = @(
    "carrier", "cial", "csk", "frickindia", "goodluckdefence",
    "herofincorp", "kineco", "orbisfinancial", "ppfas", "sundayproptech"
)

foreach ($s in $ten) {
    $html = Get-Content "scripts/$s/$s.html" -Raw -Encoding UTF8
    $badge = [regex]::Match($html, 'Frequently Asked Questions\s*</h2>\s*<span class="[^"]*">([^<]*)</span>').Groups[1].Value
    Write-Host "$s => Badge: $badge"
}
