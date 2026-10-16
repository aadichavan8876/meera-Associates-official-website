$files = Get-ChildItem -Path scripts -Recurse -Filter *.html

$mojibakeArrows = @()
foreach ($f in $files) {
    $content = [System.IO.File]::ReadAllText($f.FullName, [System.Text.Encoding]::UTF8)
    if ($content -match '<span class="faq-arrow">([^<]+)</span>') {
        $arrowText = $Matches[1]
        $bytes = [System.Text.Encoding]::UTF8.GetBytes($arrowText)
        $hex = ($bytes | ForEach-Object { $_.ToString("X2") }) -join " "
        if ($arrowText -ne '▾') {
            $mojibakeArrows += [PSCustomObject]@{
                File = $f.FullName.Replace((Get-Location).Path + "\", "")
                Arrow = $arrowText
                Hex = $hex
            }
        }
    }
}

Write-Host "Total files with non-standard arrow: $($mojibakeArrows.Count)"
$mojibakeArrows | Format-Table -AutoSize
