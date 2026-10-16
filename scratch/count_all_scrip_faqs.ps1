$scrips = Get-ChildItem -Path scripts -Directory
$report = foreach ($s in $scrips) {
    $f = "scripts\$($s.Name)\$($s.Name).html"
    if (Test-Path $f) {
        $c = [System.IO.File]::ReadAllText($f, [System.Text.Encoding]::UTF8)
        $titleMatch = [regex]::Match($c, '<h1[^>]*>(.*?)</h1>')
        $title = if ($titleMatch.Success) { ($titleMatch.Groups[1].Value -replace '<[^>]+>', '').Trim() } else { $s.Name }
        $isinMatch = [regex]::Match($c, 'INE[A-Z0-9]{9}')
        $isin = if ($isinMatch.Success) { $isinMatch.Value } else { "N/A" }
        $qMatches = [regex]::Matches($c, '<div class="faq-item')
        [PSCustomObject]@{
            Scrip = $s.Name
            Title = $title
            ISIN = $isin
            QuestionCount = $qMatches.Count
        }
    }
}

Write-Host "Total Scrips: $($report.Count)"
$report | Sort-Object QuestionCount | Format-Table -AutoSize
