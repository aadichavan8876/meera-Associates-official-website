$files = Get-ChildItem -File *.html
foreach ($f in $files) {
    $html = [System.IO.File]::ReadAllText($f.FullName, [System.Text.Encoding]::UTF8)
    $imgs = [regex]::Matches($html, '<img[^>]*>')
    Write-Host "$($f.Name): $($imgs.Count) images"
    foreach ($img in $imgs) {
        $src = [regex]::Match($img.Value, 'src=["'']([^"'']*)["'']').Groups[1].Value
        $class = [regex]::Match($img.Value, 'class=["'']([^"'']*)["'']').Groups[1].Value
        Write-Host "   src=$src class=$class"
    }
}
