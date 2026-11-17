$htmlFiles = Get-ChildItem -Recurse -Filter *.html | Where-Object { $_.FullName -notmatch '\\scratch\\' }
foreach ($f in $htmlFiles) {
    $content = [System.IO.File]::ReadAllText($f.FullName, [System.Text.Encoding]::UTF8)
    $tables = [regex]::Matches($content, '(?si)<table\b[^>]*>(.*?)</table>')
    if ($tables.Count -gt 0) {
        $rel = $f.FullName.Replace((Get-Location).Path + "\", "")
        Write-Output "=== File: $rel (Found $($tables.Count) tables) ==="
        foreach ($tbl in $tables) {
            $ths = [regex]::Matches($tbl.Value, '(?si)<th\b[^>]*>(.*?)</th>')
            $thList = @()
            foreach ($th in $ths) {
                $thList += ([regex]::Replace($th.Groups[1].Value, '<[^>]+>', ' ').Trim() -replace '\s+', ' ')
            }
            if ($thList.Count -gt 0) {
                Write-Output "  Table THs: $($thList -join ' | ')"
            } else {
                # Check first tr tds
                $firstTr = [regex]::Match($tbl.Value, '(?si)<tr\b[^>]*>(.*?)</tr>')
                if ($firstTr.Success) {
                    $tds = [regex]::Matches($firstTr.Value, '(?si)<td\b[^>]*>(.*?)</td>')
                    $tdList = @()
                    foreach ($td in $tds) {
                        $tdList += ([regex]::Replace($td.Groups[1].Value, '<[^>]+>', ' ').Trim() -replace '\s+', ' ')
                    }
                    Write-Output "  First TR TDs: $($tdList -join ' | ')"
                }
            }
        }
    }
}
