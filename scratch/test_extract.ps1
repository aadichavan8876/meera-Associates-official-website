# Builder script for 5 Company Profile HTML pages
$utf8NoBom = New-Object System.Text.UTF8Encoding($false)

# Load canonical header and footer from nayaraenergy.html
$nayaraLines = Get-Content "scripts/nayaraenergy/nayaraenergy.html" -Encoding UTF8
$headerSnippet = ($nayaraLines[23..129] -join "`r`n")
$footerSnippet = ($nayaraLines[676..813] -join "`r`n")

Write-Host "Header extracted lines: " ($nayaraLines[23..129].Count)
Write-Host "Footer extracted lines: " ($nayaraLines[676..813].Count)
