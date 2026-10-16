$scrips = Get-ChildItem -Directory scripts
foreach ($s in $scrips) {
    $htmlPath = Join-Path $s.FullName "$($s.Name).html"
    if (Test-Path $htmlPath) {
        $html = [System.IO.File]::ReadAllText($htmlPath, [System.Text.Encoding]::UTF8)
        $m = [regex]::Match($html, '(?s)<table[^>]*>(.*?)</table>')
        if ($m.Success) {
            $tableContent = $m.Groups[1].Value
            $hasName = $tableContent -match 'Company Name'
            $hasBiz = $tableContent -match 'Nature of Business'
            $hasProm = $tableContent -match 'Promoters'
            $hasAddr = $tableContent -match 'Registered Address'
            if (-not ($hasName -and $hasBiz -and $hasProm -and $hasAddr)) {
                Write-Host "MISSING in $($s.Name): Name=$hasName, Biz=$hasBiz, Prom=$hasProm, Addr=$hasAddr"
            }
        }
    }
}
Write-Host "Check complete."
