$c = Get-Content unlisted-shares.js -Raw -Encoding UTF8
$list = @('ppfas', 'frick', 'sunday-proptech', 'carrier', 'cial', 'cochin')
foreach ($item in $list) {
    Write-Host "$item in unlisted-shares.js: $($c.ToLower().Contains($item))"
}
