$htmlFiles = Get-ChildItem -Path . -Filter *.html -Recurse
$deadLinks = @()

foreach ($f in $htmlFiles) {
    if ($f.FullName -match 'scratch|node_modules|\.git') { continue }
    $content = Get-Content $f.FullName -Raw -Encoding UTF8
    $dir = $f.DirectoryName
    $regexMatches = [regex]::Matches($content, 'href="([^"#:]+?)(?:#[^"]*)?"')
    foreach ($m in $regexMatches) {
        $link = $m.Groups[1].Value
        if ($link -match '^(http|https|mailto|tel|javascript):') { continue }
        if ($link -eq '' -or $link -eq '#') { continue }
        
        $resolved = Join-Path $dir $link
        if (-not (Test-Path $resolved)) {
            $deadLinks += [PSCustomObject]@{
                Source = $f.FullName.Replace('D:\meera Associates official website\', '')
                Href = $link
                Resolved = $resolved
            }
        }
    }
}

Write-Host "Total dead internal links: $($deadLinks.Count)"
$deadLinks | Group-Object Href | Select-Object Count, Name | Format-Table -AutoSize
if ($deadLinks.Count -gt 0) {
    Write-Host "Sample dead links:"
    $deadLinks | Select-Object -First 20 | Format-Table -AutoSize
}
