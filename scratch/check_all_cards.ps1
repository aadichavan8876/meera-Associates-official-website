$files = Get-ChildItem -Recurse -Include *.html -Path scripts
foreach ($f in $files) {
    $html = [System.IO.File]::ReadAllText($f.FullName, [System.Text.Encoding]::UTF8)
    $comments = [regex]::Matches($html, '<!-- Card \d+: (.*?) -->')
    $cardNames = ($comments | ForEach-Object { $_.Groups[1].Value }) -join " | "
    Write-Host "$($f.Directory.Name): $cardNames"
}
