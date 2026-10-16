$logoUrl = 'https://gfclev.co.in/frontend/assets/images/Header/GFCL%20Logo.webp'
$targetPath = 'assets/logos/gfcl-ev.webp'

try {
    $req = [System.Net.HttpWebRequest]::Create($logoUrl)
    $req.UserAgent = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)'
    $resp = $req.GetResponse()
    $stream = $resp.GetResponseStream()
    $fileStream = [System.IO.File]::Create($targetPath)
    $stream.CopyTo($fileStream)
    $fileStream.Close()
    $stream.Close()
    $resp.Close()
    
    $item = Get-Item $targetPath
    Write-Host "Downloaded logo successfully: $($item.Length) bytes to $targetPath"
} catch {
    Write-Host "Download error: $_"
}
