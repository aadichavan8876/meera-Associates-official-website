$allCss = Get-ChildItem -Path . -Filter *.css -Recurse

$issues = foreach ($f in $allCss) {
    if ($f.FullName -match 'scratch|node_modules|\.git') { continue }
    $content = Get-Content $f.FullName -Raw -Encoding UTF8
    $openBraces = ([regex]::Matches($content, '\{')).Count
    $closeBraces = ([regex]::Matches($content, '\}')).Count
    if ($openBraces -ne $closeBraces) {
        [PSCustomObject]@{
            File = $f.FullName.Replace('D:\meera Associates official website\', '')
            Open = $openBraces
            Close = $closeBraces
            Diff = $openBraces - $closeBraces
        }
    }
}

Write-Host "CSS files with brace imbalance: $($issues.Count)"
$issues | Format-Table -AutoSize
