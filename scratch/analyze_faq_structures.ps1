$scripHtml = Get-ChildItem -Path "scripts" -Filter "*.html" -Recurse

$analysis = @()

foreach ($f in $scripHtml) {
    $dir = $f.Directory.Name
    $content = Get-Content $f.FullName -Raw -Encoding UTF8

    $hasFaqAccordion = $content.Contains('class="faq-accordion"')
    $hasFaqItem = $content.Contains('class="faq-item"')
    $hasFaqArrow = $content.Contains('class="faq-arrow"')
    $hasFaqCard = $content.Contains('class="faq-card"')
    $hasFaqContainer = $content.Contains('faq-accordion-container')
    $hasAnyFaq = $content.Contains('Frequently Asked Questions') -or $content.Contains('faq')

    $analysis += [PSCustomObject]@{
        Scrip = $dir
        HasAnyFaq = $hasAnyFaq
        CleanFaqAccordion = ($hasFaqAccordion -and $hasFaqItem -and $hasFaqArrow)
        OldFaqCard = ($hasFaqCard -or $hasFaqContainer)
    }
}

Write-Host "Total Scrips: $($analysis.Count)"
Write-Host "Scrips with Clean Orbis-style FAQ (.faq-accordion + .faq-item + .faq-arrow):"
($analysis | Where-Object { $_.CleanFaqAccordion }).Scrip -join ", "

Write-Host "`nScrips with Old/Alternate FAQ (.faq-card / .faq-accordion-container):"
($analysis | Where-Object { -not $_.CleanFaqAccordion -and $_.HasAnyFaq }).Scrip -join ", "

Write-Host "`nScrips with NO FAQ:"
($analysis | Where-Object { -not $_.HasAnyFaq }).Scrip -join ", "
