$utf8NoBom = New-Object System.Text.UTF8Encoding($false)

$guideFiles = @(
    "cdsl-easiest-guide.html",
    "nsdl-ideas-guide.html"
)

foreach ($file in $guideFiles) {
    $c = [System.IO.File]::ReadAllText($file, [System.Text.Encoding]::UTF8)

    # 1. Update header icon and tag
    $c = [regex]::Replace($c, '(?s)<h2 class="guide-card-title">\s*<span>.*?</span>\s*3\.\s*Frequently Asked Questions\s*</h2>', '<h2 class="guide-card-title"><span class="guide-card-title-icon">&#10067;</span> Frequently Asked Questions</h2>')
    $c = [regex]::Replace($c, '(?s)<span class="guide-step-tag([^>]*)">Helpdesk</span>', '<span class="guide-step-tag$1">Investor Intelligence</span>')

    # 2. Container
    $c = $c.Replace('<div class="faq-list">', '<div class="faq-accordion">')

    # 3. Items
    $c = $c.Replace('<div class="faq-item active">', '<div class="faq-item">')
    $c = $c.Replace('<button type="button" class="faq-question">', '<div class="faq-question">')
    $c = [regex]::Replace($c, '(?s)(<div class="faq-question">.*?)(</button>)', '$1</div>')
    $c = [regex]::Replace($c, '<span class="faq-chevron">▼</span>', '<span class="faq-arrow">&#9662;</span>')

    [System.IO.File]::WriteAllText($file, $c, $utf8NoBom)
    Write-Host "Updated FAQ in $file" -ForegroundColor Green
}
