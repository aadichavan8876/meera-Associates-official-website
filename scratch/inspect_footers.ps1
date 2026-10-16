# Inspect footers in index.html, unlisted-shares.html, and scripts/ncdex/ncdex.html
$index = Get-Content "index.html" -Raw -Encoding UTF8
$unlisted = Get-Content "unlisted-shares.html" -Raw -Encoding UTF8
$ncdex = Get-Content "scripts/ncdex/ncdex.html" -Raw -Encoding UTF8

$indexFooter = [regex]::Match($index, '(?s)<footer\b.*?</footer>').Value
$unlistedFooter = [regex]::Match($unlisted, '(?s)<footer\b.*?</footer>').Value
$ncdexFooter = [regex]::Match($ncdex, '(?s)<footer\b.*?</footer>').Value

Write-Host "Index Footer Length: $($indexFooter.Length)"
Write-Host "Unlisted Footer Length: $($unlistedFooter.Length)"
Write-Host "NCDEX Footer Length: $($ncdexFooter.Length)"

# Let's write them to scratch files so we can view them
Set-Content "scratch/index_footer.html" $indexFooter -Encoding UTF8
Set-Content "scratch/ncdex_footer.html" $ncdexFooter -Encoding UTF8
Write-Host "Wrote scratch/index_footer.html and scratch/ncdex_footer.html"
