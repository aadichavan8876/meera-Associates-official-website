$tables = Get-ChildItem scripts -Recurse -Filter *.html | Select-String -Pattern '<table\b[^>]*>'
$classes = @{}
foreach ($t in $tables) {
    if ($t.Line -match 'class="([^"]+)"') {
        $classes[$matches[1]] = 1
    }
}
$classes.Keys | Sort-Object
