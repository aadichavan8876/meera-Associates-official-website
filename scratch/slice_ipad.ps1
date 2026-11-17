Add-Type -AssemblyName System.Drawing
$imgPath = "C:\Users\Admin\.gemini\antigravity\brain\84542ae2-e889-4206-9836-362083c185ff\ipad_pro_mockup_1794893021027.jpg"
$img = [System.Drawing.Image]::FromFile($imgPath)
$bmp = New-Object System.Drawing.Bitmap $img

$midY = 384
Write-Output "Horizontal slice at y=$midY"
for ($x = 300; $x -le 1100; $x += 4) {
    $p = $bmp.GetPixel($x, $midY)
    if ($x -le 370 -or $x -ge 1010) {
        Write-Output "x=$x : R=$($p.R) G=$($p.G) B=$($p.B)"
    }
}

$midX = 688
Write-Output "Vertical slice at x=$midX"
for ($y = 90; $y -le 680; $y += 4) {
    $p = $bmp.GetPixel($midX, $y)
    if ($y -le 160 -or $y -ge 610) {
        Write-Output "y=$y : R=$($p.R) G=$($p.G) B=$($p.B)"
    }
}
$bmp.Dispose()
$img.Dispose()
