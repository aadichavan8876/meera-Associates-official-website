Add-Type -AssemblyName System.Drawing
$img = [System.Drawing.Image]::FromFile("C:\Users\Admin\.gemini\antigravity\brain\84542ae2-e889-4206-9836-362083c185ff\.user_uploaded\media_1794892469485_7c8d3061.png")
$bmp = New-Object System.Drawing.Bitmap $img
Write-Output "Dimensions: $($bmp.Width) x $($bmp.Height)"

$colors = @{}
for ($y = 0; $y -lt $bmp.Height; $y += 5) {
    for ($x = 0; $x -lt $bmp.Width; $x += 20) {
        $pixel = $bmp.GetPixel($x, $y)
        $hex = "#{0:X2}{1:X2}{2:X2}" -f $pixel.R, $pixel.G, $pixel.B
        if (-not $colors.ContainsKey($hex)) {
            $colors[$hex] = 0
        }
        $colors[$hex]++
    }
}

$colors.GetEnumerator() | Sort-Object Value -Descending | Select-Object -First 10 | ForEach-Object {
    Write-Output "$($_.Key): $($_.Value) pixels"
}
$bmp.Dispose()
$img.Dispose()
