$files10 = @('carehealth', 'hdfcsecurities', 'hpx', 'indofil', 'motilaloswalhf', 'msei', 'nayaraenergy', 'nerl', 'oyo', 'sterlitegrid5')

foreach ($f in $files10) {
    $path = "scripts/$f/$f.html"
    $lines = Get-Content $path -Encoding UTF8
    Write-Host "=== $f (Total lines: $($lines.Count)) ==="
    $card1Idx = -1
    for ($i = 0; $i -lt $lines.Count; $i++) {
        if ($lines[$i] -match "Card 1" -or $lines[$i] -match "Corporate Master Specifications") {
            $card1Idx = $i
            break
        }
    }
    if ($card1Idx -ge 0) {
        Write-Host "  Card 1 found at line $card1Idx"
        Write-Host "  $($lines[$card1Idx])"
        Write-Host "  $($lines[$card1Idx+1])"
        Write-Host "  $($lines[$card1Idx+2])"
    } else {
        Write-Host "  Card 1 NOT FOUND!"
    }
}
