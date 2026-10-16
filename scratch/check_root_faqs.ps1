$files = Get-ChildItem -File *.html
foreach ($f in $files) {
    $html = [System.IO.File]::ReadAllText($f.FullName, [System.Text.Encoding]::UTF8)
    $m = [regex]::Matches($html, 'class="faq-item')
    if ($m.Count -gt 0) {
        Write-Host "$($f.Name): $($m.Count) FAQ items"
    }
}
