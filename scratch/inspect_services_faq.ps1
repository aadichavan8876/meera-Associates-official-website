$c = [System.IO.File]::ReadAllText('services.html', [System.Text.Encoding]::UTF8)
$start = $c.IndexOf('<div class="faq-accordion-container">')
Write-Host "services.html start index: $start"

# Let's count faq-cards
$cards = [regex]::Matches($c, '<div class="faq-card"[^>]*data-category="([^"]+)"')
Write-Host "services.html total faq-cards: $($cards.Count)"
$categories = $cards | ForEach-Object { $_.Groups[1].Value } | Select-Object -Unique
Write-Host "Unique categories: $($categories -join ', ')"
