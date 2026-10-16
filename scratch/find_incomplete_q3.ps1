$files = Get-ChildItem -Path scripts -Recurse -Filter *.html
$incomplete = @()

foreach ($f in $files) {
    $c = [System.IO.File]::ReadAllText($f.FullName, [System.Text.Encoding]::UTF8)
    if ($c.Contains("valuation fundamentals of </span>")) {
        $incomplete += $f.Directory.Name
    }
}

Write-Host "Files with incomplete Q3: $($incomplete.Count)"
Write-Host ($incomplete -join ", ")
