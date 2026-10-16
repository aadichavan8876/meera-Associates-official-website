$rootHtml = Get-ChildItem -Path . -Filter *.html -File
$utf8NoBom = New-Object System.Text.UTF8Encoding $false

foreach ($f in $rootHtml) {
    $text = Get-Content $f.FullName -Raw -Encoding UTF8
    if ($text.Contains('href="facts.html"')) {
        $target = if ($f.Name -eq 'about.html') { '#foundation' } else { 'about.html#foundation' }
        $text = $text.Replace('href="facts.html"', "href=""$target""")
        [System.IO.File]::WriteAllText($f.FullName, $text, $utf8NoBom)
        Write-Host "Updated $($f.Name) link to $target"
    }
}
