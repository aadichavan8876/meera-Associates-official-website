$files = Get-ChildItem -Path "scripts" -Recurse -Filter "*.html"
$cards = New-Object System.Collections.Generic.List[PSObject]

foreach ($f in $files) {
    $scrip = $f.Directory.Name
    $content = [System.IO.File]::ReadAllText($f.FullName)
    
    # Check for any img tags in the scrip
    $imgMatches = [regex]::Matches($content, '<img[^>]*>')
    foreach ($m in $imgMatches) {
        $tag = $m.Value
        if ($tag -notmatch 'meera_associates_logo' -and $tag -notmatch 'assets/logos/') {
            Write-Output "NON-STANDARD IMG in $scrip : $tag"
        }
    }
    
    # Check for card titles
    $cardMatches = [regex]::Matches($content, '<h2[^>]*class="[^"]*card-title[^"]*"[^>]*>(.*?)</h2>', [System.Text.RegularExpressions.RegexOptions]::Singleline)
    foreach ($cm in $cardMatches) {
        $titleClean = [regex]::Replace($cm.Groups[1].Value, '<[^>]+>', ' ').Trim()
        $titleClean = [regex]::Replace($titleClean, '\s+', ' ')
        $cards.Add([PSCustomObject]@{
            Scrip = $scrip
            Title = $titleClean
        })
    }
}

Write-Output "Unique Card Titles across all scrips:"
$cards | Group-Object Title | Select-Object Count, Name | Sort-Object Count -Descending | Format-Table -AutoSize
