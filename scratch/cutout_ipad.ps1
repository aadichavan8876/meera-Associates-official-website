Add-Type -AssemblyName System.Drawing

$srcPath = "d:\meera Associates official website\assets\ipad_mockup.png"
$bmp = New-Object System.Drawing.Bitmap($srcPath)

$w = $bmp.Width
$h = $bmp.Height

# We know inner screen is roughly x from 38 to 717, y from 38 to 531
# But it has rounded corners! Radius is approx 18-20px.
# Let's create a GraphicsPath with a rounded rectangle for the screen cutout:
$screenX = 37
$screenY = 37
$screenW = 718 - 37 # 681
$screenH = 532 - 37 # 495
$radius = 16

$path = New-Object System.Drawing.Drawing2D.GraphicsPath
$rect = New-Object System.Drawing.Rectangle $screenX, $screenY, $screenW, $screenH
$d = $radius * 2

$path.AddArc($rect.X, $rect.Y, $d, $d, 180, 90)
$path.AddArc($rect.X + $rect.Width - $d, $rect.Y, $d, $d, 270, 90)
$path.AddArc($rect.X + $rect.Width - $d, $rect.Y + $rect.Height - $d, $d, $d, 0, 90)
$path.AddArc($rect.X, $rect.Y + $rect.Height - $d, $d, $d, 90, 90)
$path.CloseFigure()

$region = New-Object System.Drawing.Region $path

# Clear the screen area to transparent
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.Clip = $region
$g.Clear([System.Drawing.Color]::Transparent)
$g.Dispose()

$bmp.Save("d:\meera Associates official website\assets\ipad_frame_cutout.png", [System.Drawing.Imaging.ImageFormat]::Png)
Write-Output "Saved ipad_frame_cutout.png"
$bmp.Dispose()
