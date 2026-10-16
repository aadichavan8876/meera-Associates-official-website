$files = Get-ChildItem -Path . -Recurse -Filter "*.html" | Where-Object { $_.FullName -notmatch '\\scratch\\' }
foreach ($f in $files) {
    $content = [System.IO.File]::ReadAllText($f.FullName)
    if ($content -match 'gallery') {
        $matches = [regex]::Matches($content, '.*gallery.*')
        foreach ($m in $matches) {
            $line = $m.Value.Trim()
            if ($line.Length -gt 0) {
                Write-Output "$($f.Name): $line"
            }
        }
    }
}
