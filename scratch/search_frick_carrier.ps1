$c = Get-Content unlisted-shares.js -Raw -Encoding UTF8
$matches = [regex]::Matches($c, "(?s)\{\s*id:\s*'[^']+'.*?name:\s*'[^']*(?:Frick|Carrier)[^']*'.*?\}")
foreach ($m in $matches) {
    Write-Host $m.Value
}
