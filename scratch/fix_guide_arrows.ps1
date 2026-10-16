$utf8NoBom = New-Object System.Text.UTF8Encoding($false)

$guideFiles = @(
    "cdsl-easiest-guide.html",
    "nsdl-ideas-guide.html"
)

foreach ($file in $guideFiles) {
    $c = [System.IO.File]::ReadAllText($file, [System.Text.Encoding]::UTF8)
    $c = [regex]::Replace($c, '<span class="faq-chevron">[^<]*</span>', '<span class="faq-arrow">&#9662;</span>')
    [System.IO.File]::WriteAllText($file, $c, $utf8NoBom)
    Write-Host "Updated faq-arrow in $file" -ForegroundColor Green
}
