try {
    $url = 'https://www.meeraassociates.co.in/gfcl-ev-porducts-ltd-unlisted-share.html'
    $req = [System.Net.HttpWebRequest]::Create($url)
    $req.UserAgent = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)'
    $resp = $req.GetResponse()
    $stream = $resp.GetResponseStream()
    $reader = New-Object System.IO.StreamReader($stream)
    $html = $reader.ReadToEnd()
    $reader.Close()
    $resp.Close()
    Write-Host "Downloaded $($html.Length) chars"
    [System.IO.File]::WriteAllText('scratch/gfcl_live.html', $html, [System.Text.Encoding]::UTF8)
    Write-Host "Saved to scratch/gfcl_live.html"
} catch {
    Write-Host "Error: $_"
}
