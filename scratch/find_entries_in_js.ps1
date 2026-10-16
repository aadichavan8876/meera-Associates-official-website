$c = Get-Content unlisted-shares.js -Raw -Encoding UTF8
$list = @('ppfas', 'frick', 'sunday-proptech', 'carrier', 'cial', 'cochin')
foreach ($item in $list) {
    Write-Host "=== $item ==="
    $match = [regex]::Match($c, "(?s)\{\s*id:\s*'$item'.*?\}")
    if ($match.Success) {
        Write-Host $match.Value
    }
}
