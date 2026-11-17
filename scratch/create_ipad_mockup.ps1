Add-Type -AssemblyName System.Drawing

$srcPath = "C:\Users\Admin\.gemini\antigravity\brain\84542ae2-e889-4206-9836-362083c185ff\ipad_pro_mockup_1794893021027.jpg"
$srcImg = [System.Drawing.Image]::FromFile($srcPath)
$srcBmp = New-Object System.Drawing.Bitmap $srcImg

# The iPad is roughly from x=314 to 1060, y=102 to 662
# Let's crop it tightly with a 15px margin
$cropX = 310
$cropY = 98
$cropW = 754
$cropH = 568

$targetBmp = New-Object System.Drawing.Bitmap $cropW, $cropH, ([System.Drawing.Imaging.PixelFormat]::Format32bppArgb)

# Background flood-fill detection from outer edges
# We can make any pixel outside the iPad transparent:
# Outer background is nearly pure white (R >= 242, G >= 242, B >= 242)
for ($y = 0; $y -lt $cropH; $y++) {
    for ($x = 0; $x -lt $cropW; $x++) {
        $origX = $cropX + $x
        $origY = $cropY + $y
        $p = $srcBmp.GetPixel($origX, $origY)
        
        # Determine if pixel is white background
        if ($p.R -ge 245 -and $p.G -ge 245 -and $p.B -ge 245) {
            $targetBmp.SetPixel($x, $y, [System.Drawing.Color]::FromArgb(0, 0, 0, 0))
        } elseif ($p.R -ge 225 -and $p.G -ge 225 -and $p.B -ge 225) {
            # Smooth antialiased edge
            $alpha = [int](255 * (245 - ($p.R + $p.G + $p.B) / 3.0) / 20.0)
            if ($alpha -lt 0) { $alpha = 0 }
            if ($alpha -gt 255) { $alpha = 255 }
            $targetBmp.SetPixel($x, $y, [System.Drawing.Color]::FromArgb($alpha, [int]$p.R, [int]$p.G, [int]$p.B))
        } else {
            $targetBmp.SetPixel($x, $y, [System.Drawing.Color]::FromArgb(255, [int]$p.R, [int]$p.G, [int]$p.B))
        }
    }
}

$destPath = "d:\meera Associates official website\assets\ipad_mockup.png"
$targetBmp.Save($destPath, [System.Drawing.Imaging.ImageFormat]::Png)
Write-Output "Successfully saved $destPath ($cropW x $cropH)"

$targetBmp.Dispose()
$srcBmp.Dispose()
$srcImg.Dispose()
