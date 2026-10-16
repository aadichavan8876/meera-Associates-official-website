Add-Type -AssemblyName System.Drawing

# 1. Nayara Energy
$nayaraImg = [System.Drawing.Image]::FromFile((Resolve-Path 'scratch/nayara_wiki.jpg'))
Write-Host "Nayara original: Width=$($nayaraImg.Width), Height=$($nayaraImg.Height)"

# Create a clean high-res PNG (e.g. 600px width with aspect ratio preserved)
$targetWidth = 600
$targetHeight = [int]($nayaraImg.Height * ($targetWidth / $nayaraImg.Width))
$bmpNayara = New-Object System.Drawing.Bitmap $targetWidth, $targetHeight
$gNayara = [System.Drawing.Graphics]::FromImage($bmpNayara)
$gNayara.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
$gNayara.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality
$gNayara.PixelOffsetMode = [System.Drawing.Drawing2D.PixelOffsetMode]::HighQuality
$gNayara.Clear([System.Drawing.Color]::Transparent)
$gNayara.DrawImage($nayaraImg, 0, 0, $targetWidth, $targetHeight)
$gNayara.Dispose()
$nayaraImg.Dispose()

$outDir = (Resolve-Path 'assets/logos').Path
$bmpNayara.Save("$outDir\nayara-energy.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmpNayara.Dispose()
Write-Host "Saved assets/logos/nayara-energy.png"

# 2. OYO
$oyoImg = [System.Drawing.Image]::FromFile((Resolve-Path 'scratch/url2.png'))
Write-Host "OYO original: Width=$($oyoImg.Width), Height=$($oyoImg.Height)"
$targetWidthOyo = 400
$targetHeightOyo = [int]($oyoImg.Height * ($targetWidthOyo / $oyoImg.Width))
$bmpOyo = New-Object System.Drawing.Bitmap $targetWidthOyo, $targetHeightOyo
$gOyo = [System.Drawing.Graphics]::FromImage($bmpOyo)
$gOyo.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
$gOyo.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality
$gOyo.Clear([System.Drawing.Color]::Transparent)
$gOyo.DrawImage($oyoImg, 0, 0, $targetWidthOyo, $targetHeightOyo)
$gOyo.Dispose()
$oyoImg.Dispose()

$bmpOyo.Save("$outDir\oyo.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmpOyo.Dispose()
Write-Host "Saved assets/logos/oyo.png"
