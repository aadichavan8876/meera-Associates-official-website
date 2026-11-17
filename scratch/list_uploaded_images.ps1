Add-Type -AssemblyName System.Drawing
$dir = "C:\Users\Admin\.gemini\antigravity\brain\84542ae2-e889-4206-9836-362083c185ff\.user_uploaded"
$images = Get-ChildItem $dir -Filter *.png
foreach ($imgFile in $images) {
    try {
        $img = [System.Drawing.Image]::FromFile($imgFile.FullName)
        Write-Output "$($imgFile.Name): $($img.Width) x $($img.Height) ($($imgFile.LastWriteTime))"
        $img.Dispose()
    } catch {
        Write-Output "$($imgFile.Name): Error reading"
    }
}
