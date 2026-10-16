# Audit local asset references in the 5 new HTML files
$files = @(
    "scripts/ppfas/ppfas.html",
    "scripts/frickindia/frickindia.html",
    "scripts/sundayproptech/sundayproptech.html",
    "scripts/carrier/carrier.html",
    "scripts/cial/cial.html"
)

$missing = @()
foreach ($f in $files) {
    $dir = Split-Path $f
    $content = Get-Content $f -Raw -Encoding UTF8
    
    # Check src
    $srcMatches = [regex]::Matches($content, 'src="([^"#?]+)"')
    foreach ($m in $srcMatches) {
        $val = $m.Groups[1].Value
        if ($val.StartsWith("http") -or $val.StartsWith("data:")) { continue }
        $resolved = Join-Path $dir $val
        if (-not (Test-Path $resolved)) {
            $missing += "$f -> src='$val' (Resolved: $resolved)"
        }
    }

    # Check local hrefs (css & favicons)
    $hrefMatches = [regex]::Matches($content, 'href="([^"#?]+\.(css|png|ico|svg))"')
    foreach ($m in $hrefMatches) {
        $val = $m.Groups[1].Value
        if ($val.StartsWith("http")) { continue }
        $resolved = Join-Path $dir $val
        if (-not (Test-Path $resolved)) {
            $missing += "$f -> href='$val' (Resolved: $resolved)"
        }
    }
}

Write-Host "Missing local references: $($missing.Count)"
$missing | ForEach-Object { Write-Host $_ }
