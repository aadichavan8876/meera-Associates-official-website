Add-Type -AssemblyName System.Drawing
$bmp = New-Object System.Drawing.Bitmap("d:\meera Associates official website\assets\ipad_mockup.png")
Write-Output "Size: $($bmp.Width) x $($bmp.Height)"

for ($y = 10; $y -lt 70; $y++) {
    $p = $bmp.GetPixel(377, $y)
    if ($p.R -gt 15) {
        Write-Output "Top screen edge at y=$y, RGB: $($p.R), $($p.G), $($p.B)"
    }
}
for ($x = 10; $x -lt 70; $x++) {
    $p = $bmp.GetPixel($x, 284)
    if ($p.R -gt 15) {
        Write-Output "Left screen edge at x=$x, RGB: $($p.R), $($p.G), $($p.B)"
    }
}
for ($x = $bmp.Width - 70; $x -lt $bmp.Width - 10; $x++) {
    $p = $bmp.GetPixel($x, 284)
    if ($p.R -gt 15) {
        Write-Output "Right screen edge at x=$x, RGB: $($p.R), $($p.G), $($p.B)"
    }
}
for ($y = $bmp.Height - 70; $y -lt $bmp.Height - 10; $y++) {
    $p = $bmp.GetPixel(377, $y)
    if ($p.R -gt 15) {
        Write-Output "Bottom screen edge at y=$y, RGB: $($p.R), $($p.G), $($p.B)"
    }
}
$bmp.Dispose()
