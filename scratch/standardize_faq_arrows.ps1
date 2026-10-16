$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
$files = Get-ChildItem -Path scripts -Recurse -Filter *.html

$updated = 0
foreach ($f in $files) {
    $content = [System.IO.File]::ReadAllText($f.FullName, [System.Text.Encoding]::UTF8)
    if ($content -match '<span class="faq-arrow">') {
        $newContent = [regex]::Replace($content, '<span class="faq-arrow">[^<]*</span>', '<span class="faq-arrow">&#9662;</span>')
        if ($newContent -ne $content) {
            [System.IO.File]::WriteAllText($f.FullName, $newContent, $utf8NoBom)
            $updated++
        }
    }
}

Write-Host "Updated arrow entity in $updated HTML files" -ForegroundColor Green
