$scripList = @('nerl', 'nayaraenergy', 'oyo', 'hdfcsecurities', 'motilaloswalhf')
foreach ($s in $scripList) {
    $f = Get-ChildItem -Path scripts\$s -Filter *.html
    $c = Get-Content $f.FullName -Raw -Encoding UTF8
    Write-Host "$s has main-container: $($c.Contains('main-container'))"
}
