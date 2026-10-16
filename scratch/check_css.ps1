$scrips = @('csk', 'gfclev', 'goodluckdefence', 'herofincorp', 'kineco', 'orbisfinancial')
foreach ($s in $scrips) {
    $css = "scripts\$s\$s.css"
    $b = Select-String -Path $css -Pattern "sidebar-brand-card" -Quiet
    $t = Select-String -Path $css -Pattern "sidebar-trade-card" -Quiet
    Write-Output "$s : brand=$b, trade=$t"
}
