Add-Type -AssemblyName System.Drawing
$imgPath = "C:\Users\Admin\.gemini\antigravity\brain\84542ae2-e889-4206-9836-362083c185ff\ipad_pro_mockup_1794893021027.jpg"
$img = [System.Drawing.Image]::FromFile($imgPath)
$bmp = New-Object System.Drawing.Bitmap $img

Write-Output "Image size: $($bmp.Width) x $($bmp.Height)"

# Find the bounding box of the iPad device (pixels where color is not near-white)
$minX = $bmp.Width
$maxX = 0
$minY = $bmp.Height
$maxY = 0

for ($y = 0; $y -lt $bmp.Height; $y += 2) {
    for ($x = 0; $x -lt $bmp.Width; $x += 2) {
        $pixel = $bmp.GetPixel($x, $y)
        # Background is near white (R>245, G>245, B>245)
        if ($pixel.R -lt 240 -or $pixel.G -lt 240 -or $pixel.B -lt 240) {
            if ($x -lt $minX) { $minX = $x }
            if ($x -gt $maxX) { $maxX = $x }
            if ($y -lt $minY) { $minY = $y }
            if ($y -gt $maxY) { $maxY = $y }
        }
    }
}

Write-Output "iPad Bounding Box: Left=$minX, Top=$minY, Right=$maxX, Bottom=$maxY (Width=$($maxX-$minX), Height=$($maxY-$minY))"

# Now find the inner black screen bounding box (pixels that are very dark: R<15, G<15, B<15)
$screenMinX = $bmp.Width
$screenMaxX = 0
$screenMinY = $bmp.Height
$screenMaxY = 0

for ($y = $minY; $y -le $maxY; $y += 2) {
    for ($x = $minX; $x -le $maxX; $x += 2) {
        $pixel = $bmp.GetPixel($x, $y)
        if ($pixel.R -lt 10 -and $pixel.G -lt 10 -and $pixel.B -lt 10) {
            if ($x -lt $screenMinX) { $screenMinX = $x }
            if ($x -gt $screenMaxX) { $screenMaxX = $x }
            if ($y -lt $screenMinY) { $screenMinY = $y }
            if ($y -gt $screenMaxY) { $screenMaxY = $y }
        }
    }
}

Write-Output "Inner Screen: Left=$screenMinX, Top=$screenMinY, Right=$screenMaxX, Bottom=$screenMaxY (Width=$($screenMaxX-$screenMinX), Height=$($screenMaxY-$screenMinY))"
$bmp.Dispose()
$img.Dispose()
