$scriptDirs = Get-ChildItem -Path scripts -Directory

foreach ($d in $scriptDirs) {
    $name = $d.Name
    $htmlFile = Get-ChildItem -Path $d.FullName -Filter *.html | Select-Object -First 1
    if (-not $htmlFile) { continue }
    $html = Get-Content $htmlFile.FullName -Raw -Encoding UTF8
    
    # find hero title class
    $heroTitleMatch = [regex]::Match($html, 'class="([a-zA-Z0-9_-]+hero-title)"')
    $heroCardMatch = [regex]::Match($html, 'class="([a-zA-Z0-9_-]*metric-card)"')
    
    $heroTitle = if ($heroTitleMatch.Success) { $heroTitleMatch.Groups[1].Value } else { "NO_HERO_TITLE" }
    $heroCard = if ($heroCardMatch.Success) { $heroCardMatch.Groups[1].Value } else { "NO_HERO_CARD" }
    
    # Check if CSS has this class
    $cssFile = Get-ChildItem -Path $d.FullName -Filter *.css | Select-Object -First 1
    $css = if ($cssFile) { Get-Content $cssFile.FullName -Raw -Encoding UTF8 } else { "" }
    
    $titleInCss = $css.Contains(".$heroTitle")
    $cardInCss = $css.Contains(".$heroCard")
    
    if (-not $titleInCss -or -not $cardInCss) {
        Write-Host "MISMATCH in ${name} - TitleClass: $heroTitle (InCss: $titleInCss), CardClass: $heroCard (InCss: $cardInCss)"
    }
}
