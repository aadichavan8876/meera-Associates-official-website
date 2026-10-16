$files = Get-ChildItem -Path scripts -Recurse -Filter *.html
$missing = @()
foreach ($f in $files) {
    $c = [System.IO.File]::ReadAllText($f.FullName, [System.Text.Encoding]::UTF8)
    if (-not $c.Contains('script.js')) {
        $missing += $f.Directory.Name
    }
}
Write-Host "Scrips missing script.js: $($missing.Count)"
if ($missing.Count -gt 0) { Write-Host ($missing -join ', ') }
