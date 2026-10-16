$files = Get-ChildItem -Path "scripts" -Recurse -Filter "*.html"
$extraReport = New-Object System.Collections.Generic.List[PSObject]

foreach ($f in $files) {
    $scrip = $f.Directory.Name
    $content = [System.IO.File]::ReadAllText($f.FullName)
    
    $cardMatches = [regex]::Matches($content, '<h2[^>]*class="[^"]*card-title[^"]*"[^>]*>(.*?)</h2>', [System.Text.RegularExpressions.RegexOptions]::Singleline)
    foreach ($cm in $cardMatches) {
        $titleClean = [regex]::Replace($cm.Groups[1].Value, '<[^>]+>', ' ').Trim()
        $titleClean = [regex]::Replace($titleClean, '\s+', ' ')
        if ($titleClean -match 'Award|Accolade|Upcoming Project|News|Media|Key Highlight|Turnkey|Track Record|Services of Company') {
            $extraReport.Add([PSCustomObject]@{
                Scrip = $scrip
                ExtraCard = $titleClean
            })
        }
    }
}

Write-Output "Total Extra Cards Found: $($extraReport.Count)"
$extraReport | Format-Table -AutoSize
