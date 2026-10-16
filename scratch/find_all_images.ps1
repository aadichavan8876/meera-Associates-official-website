$files = Get-ChildItem -Recurse -Include *.html -Path . | Where-Object { $_.FullName -notmatch '\\scratch\\' }
$allImgs = @()
foreach ($f in $files) {
    $html = [System.IO.File]::ReadAllText($f.FullName, [System.Text.Encoding]::UTF8)
    $matches = [regex]::Matches($html, '<img[^>]*>')
    foreach ($m in $matches) {
        $src = [regex]::Match($m.Value, 'src=["'']([^"'']*)["'']').Groups[1].Value
        $allImgs += [PSCustomObject]@{
            File = $f.FullName.Replace((Get-Location).Path + "\", "")
            Tag = $m.Value
            Src = $src
        }
    }
}
Write-Host "Total image tags in project: $($allImgs.Count)"
$allImgs | Group-Object Src | Select-Object Count, Name | Format-Table -AutoSize
