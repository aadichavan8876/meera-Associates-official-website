$titles = @{
    "goldisolar" = "Goldi Solar Limited"
}
foreach ($k in $titles.Keys) {
    $t = $titles[$k]
    Write-Host "Key: '$k' | Title: '$t'"
}
