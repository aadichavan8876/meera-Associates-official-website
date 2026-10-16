$files = Get-ChildItem -Path . -Recurse -Filter '*.html' | Where-Object { $_.FullName -notmatch '\\scratch\\' }
$list = New-Object System.Collections.Generic.List[PSObject]
foreach ($file in $files) {
    $content = [System.IO.File]::ReadAllText($file.FullName)
    $pattern = '<img\s+[^>]*>'
    $ms = [System.Text.RegularExpressions.Regex]::Matches($content, $pattern, [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
    foreach ($m in $ms) {
        $obj = [PSCustomObject]@{
            File = $file.FullName.Replace("d:\meera Associates official website\", "")
            Tag = $m.Value
        }
        $list.Add($obj)
    }
}
$list | Group-Object Tag | Select-Object Count, Name | Sort-Object Count -Descending | Format-Table -AutoSize
