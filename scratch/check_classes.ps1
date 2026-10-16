$files = @(
    "scripts\orbisfinancial\orbisfinancial.html",
    "scripts\herofincorp\herofincorp.html",
    "scripts\csk\csk.html",
    "scripts\goodluckdefence\goodluckdefence.html",
    "scripts\kineco\kineco.html"
)

foreach ($f in $files) {
    $content = Get-Content $f -Raw -Encoding UTF8
    $heroClass = [regex]::Match($content, 'class="([^"]*hero[^"]*)"').Groups[1].Value
    $stripClass = [regex]::Match($content, 'class="([^"]*metrics-strip[^"]*)"').Groups[1].Value
    $gridClass = [regex]::Match($content, 'class="([^"]*main-grid[^"]*)"').Groups[1].Value
    Write-Host "$f => Hero: $heroClass | Strip: $stripClass | Grid: $gridClass"
}
