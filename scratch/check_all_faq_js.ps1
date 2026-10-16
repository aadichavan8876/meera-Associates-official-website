$jsFiles = Get-ChildItem -Path "scripts" -Filter "*.js" -Recurse

$results = @()
foreach ($jf in $jsFiles) {
    $c = Get-Content $jf.FullName -Raw -Encoding UTF8
    $hasFaqFn = $c.Contains('initFaqAccordion')
    $results += [PSCustomObject]@{
        Scrip = $jf.Directory.Name
        HasFaqJs = $hasFaqFn
    }
}

Write-Host "Total JS files: $($results.Count)"
Write-Host "JS files missing initFaqAccordion:"
($results | Where-Object { -not $_.HasFaqJs }).Scrip -join ", "
