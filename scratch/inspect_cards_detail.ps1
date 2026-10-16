$files = Get-ChildItem -Path "scripts" -Recurse -Filter "*.html"

foreach ($f in $files) {
    $scrip = $f.Directory.Name
    $content = [System.IO.File]::ReadAllText($f.FullName)
    
    # Check if there are cards with titles matching Awards, Upcoming, News, Services, Key Highlights, Turnkey, Track Record
    $pattern = '(?s)<div class="[^"]*card[^"]*"[^>]*>\s*<div class="[^"]*card-header"[^>]*>\s*<h2 class="[^"]*card-title"[^>]*>.*?</h2>.*?</div>.*?</div>'
    
    # We can inspect card by card
}
Write-Output "Ready to inspect extra cards."
