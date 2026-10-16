$c = Get-Content index.html -Raw -Encoding UTF8
$m = [regex]::Matches($c, 'href="[^"]*faq[^"]*"')
foreach ($match in $m) {
    Write-Host "index.html link: $($match.Value)"
}
