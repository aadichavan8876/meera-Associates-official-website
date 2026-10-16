$rootFiles = Get-ChildItem -Path . -Filter *.html -File

foreach ($f in $rootFiles) {
    $c = [System.IO.File]::ReadAllText($f.FullName, [System.Text.Encoding]::UTF8)
    $hasSection = $c -match '(?i)<section[^>]*id="[^"]*faq' -or $c -match '(?i)<section[^>]*class="[^"]*faq'
    $hasFaqTitle = $c -match '(?i)<h[1-4][^>]*>[^<]*Frequently Asked'
    $faqCount = ([regex]::Matches($c, '(?i)class="[^"]*(?:faq-card|faq-item)[^"]*"')).Count

    Write-Host "$($f.Name): hasSection=$hasSection, hasFaqTitle=$hasFaqTitle, faqItemCount=$faqCount"
}
