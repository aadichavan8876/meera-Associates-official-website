$scrips = @('csk', 'gfclev', 'goodluckdefence', 'herofincorp', 'kineco', 'orbisfinancial')
foreach ($s in $scrips) {
    $f = "scripts\$s\$s.html"
    $c = Get-Content $f -Raw
    $hasWebRow = $c -match "Company Website"
    $hasBrand = $c -match "sidebar-brand-card"
    Write-Output "$s : webRow=$hasWebRow, brandCard=$hasBrand"
}
