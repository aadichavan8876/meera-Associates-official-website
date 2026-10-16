$allFiles = Get-ChildItem -Path . -Include *.html, *.css, *.js -Recurse

# Check using char sequences
$c1 = [char]0x00F0 + [char]0x0178 # ðŸ
$c2 = [char]0xFFFD # replacement char
$c3 = [char]0x00C3 + [char]0x00A2 # Ã¢

$found = @()
foreach ($f in $allFiles) {
    if ($f.FullName -match 'scratch|node_modules|\.git') { continue }
    $content = Get-Content $f.FullName -Raw -Encoding UTF8
    if ($content.Contains($c1) -or $content.Contains($c2) -or $content.Contains($c3)) {
        $found += [PSCustomObject]@{
            File = $f.FullName.Replace('D:\meera Associates official website\', '')
        }
    }
}

Write-Host "Total files with mojibake: $($found.Count)"
$found | Format-Table -AutoSize
