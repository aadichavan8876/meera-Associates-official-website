$files = Get-ChildItem -Path scripts -Filter *.html -Recurse
Write-Host "Total script files: $($files.Count)"

$report = foreach ($f in $files) {
    $content = Get-Content $f.FullName -Raw -Encoding UTF8
    $hasHeader = $content.Contains('<header class="navbar" id="main-header">')
    $hasHamburger = $content.Contains('class="hamburger" id="hamburger-btn"')
    $hasCareers = $content.Contains('careers.html')
    $hasUpcomingIpos = $content.Contains('upcoming-ipos.html')
    $hasNavSocial = $content.Contains('class="nav-social-links"')
    
    # Hero metrics
    $hasHeroStrip = $content -match 'class="([a-zA-Z0-9_-]*metrics-strip)"'
    $stripClass = if ($hasHeroStrip) { $matches[1] } else { 'NONE' }
    $unprefixedMetricCard = ([regex]::Matches($content, 'class="metric-card"')).Count
    
    # Footer
    $hasCanonFooter = $content.Contains('class="footer"')
    $hasPuneFooter = $content.Contains('Dashmesh Square')
    # Check if footer itself contains mumbai references
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
    if ($unprefixedMetricCard -gt 0) { $issueList += "UnprefixedMetricCards($unprefixedMetricCard)" }
    if (-not $hasPuneFooter) { $issueList += 'MissingPuneFooter' }
    if ($footerHasMumbai) { $issueList += 'FooterHasOldMumbai' }
    if (-not $hasRegulatoryNotice) { $issueList += 'MissingRegulatoryNotice' }

    [PSCustomObject]@{
        Name = $f.Directory.Name
        Issues = ($issueList -join ', ')
        StripClass = $stripClass
    }
}

$issues = $report | Where-Object { $_.Issues -ne '' }
Write-Host "Files with issues: $($issues.Count)"
$issues | Format-Table -AutoSize
