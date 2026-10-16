$c = Get-Content 'scripts\nerl\nerl.html' -Raw -Encoding UTF8
$divOpen = ([regex]::Matches($c, '<div[\s>]')).Count
$divClose = ([regex]::Matches($c, '</div>')).Count
Write-Host "nerl.html div open: $divOpen div close: $divClose Diff: $($divOpen - $divClose)"
