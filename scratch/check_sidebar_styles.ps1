$files = Get-ChildItem -Path "scripts" -Recurse -Filter "*.html"
$brandCount = 0
$factCount = 0
foreach ($f in $files) {
    $c = Get-Content $f.FullName -Raw
    $hasBrand = $c -match "sidebar-brand-card"
    $hasFact = $c -match "sidebar-factsheet-card"
    if ($hasFact) {
        $factCount++
        Write-Output "USES FACTSHEET: $($f.FullName.Replace('d:\meera Associates official website\', ''))"
    } elseif ($hasBrand) {
        $brandCount++
    }
}
Write-Output "Total using brand card (NCDEX style): $brandCount"
Write-Output "Total using factsheet card: $factCount"
