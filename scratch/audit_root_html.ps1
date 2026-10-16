$files = Get-ChildItem -Path . -Filter *.html -File
Write-Host "Total root html files: $($files.Count)"

$report = foreach ($f in $files) {
    $content = Get-Content $f.FullName -Raw -Encoding UTF8
    $hasHeader = $content.Contains('<header class="navbar" id="main-header">')
    $hasHamburger = $content.Contains('class="hamburger" id="hamburger-btn"')
    $hasCareers = $content.Contains('careers.html')
    $hasUpcomingIpos = $content.Contains('upcoming-ipos.html')
    $hasNavSocial = $content.Contains('class="nav-social-links"')
    
    # Footer
    $hasCanonFooter = $content.Contains('class="footer"')
    $hasPuneFooter = $content.Contains('Dashmesh Square')
    $footerMatch = [regex]::Match($content, '(?s)<footer.*?</footer>')
    $footerText = if ($footerMatch.Success) { $footerMatch.Value } else { '' }
    $footerHasMumbai = $footerText -match 'Nariman Point|Bandra|Fort|Express Towers'
    $hasRegulatoryNotice = $footerText.Contains('Regulatory Notice')
    
    $issueList = @()
    if (-not $hasHeader) { $issueList += 'MissingNavbar' }
    if (-not $hasHamburger) { $issueList += 'MissingHamburger' }
    if ($hasCareers) { $issueList += 'HasCareersLink' }
    if (-not $hasUpcomingIpos) { $issueList += 'MissingUpcomingIpos' }
    if (-not $hasNavSocial) { $issueList += 'MissingNavSocial' }
    if (-not $hasPuneFooter) { $issueList += 'MissingPuneFooter' }
    if ($footerHasMumbai) { $issueList += 'FooterHasOldMumbai' }
    if (-not $hasRegulatoryNotice) { $issueList += 'MissingRegulatoryNotice' }

    [PSCustomObject]@{
        Name = $f.Name
        Issues = ($issueList -join ', ')
    }
}

$issues = $report | Where-Object { $_.Issues -ne '' }
Write-Host "Root files with issues: $($issues.Count)"
$report | Format-Table -AutoSize
