$scrips = Get-ChildItem -Path scripts -Directory
foreach ($s in $scrips) {
    $f = "scripts\$($s.Name)\$($s.Name).html"
    if (Test-Path $f) {
        $c = [System.IO.File]::ReadAllText($f, [System.Text.Encoding]::UTF8)
        if ($c -match '(?i)Financial Performance|Financial Highlights') {
            Write-Host "$($s.Name) has Financial section"
        }
    }
}
