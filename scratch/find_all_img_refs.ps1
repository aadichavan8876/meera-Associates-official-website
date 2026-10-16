$files = Get-ChildItem -Path . -Recurse -Include *.html, *.css | Where-Object { $_.FullName -notmatch '\\scratch\\' }
$results = New-Object System.Collections.Generic.List[PSObject]

foreach ($file in $files) {
    $content = [System.IO.File]::ReadAllText($file.FullName)
    $pattern = '(?i)[\w\-\/\.]+\.(?:png|jpg|jpeg|webp|gif|svg)'
    $matches = [regex]::Matches($content, $pattern)
    foreach ($m in $matches) {
        $val = $m.Value
        if ($val -notmatch 'meera_associates_logo' -and $val -notmatch 'assets/logos/' -and $val -notmatch 'w3.org') {
            $results.Add([PSCustomObject]@{
                File = $file.FullName.Replace("d:\meera Associates official website\", "")
                ImageRef = $val
            })
        }
    }
}

Write-Output "Other Image References ($($results.Count)):"
$results | Group-Object ImageRef | Select-Object Count, Name | Format-Table -AutoSize
