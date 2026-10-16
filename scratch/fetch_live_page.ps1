try {
    $res = Invoke-WebRequest -Uri 'https://www.meeraassociates.co.in/gfcl-ev-porducts-ltd-unlisted-share.html' -UseBasicParsing -UserAgent 'Mozilla/5.0'
    [System.IO.File]::WriteAllText('scratch/gfclev_live.html', $res.Content, [System.Text.Encoding]::UTF8)
    Write-Host "Downloaded successfully, length: $($res.Content.Length)"
} catch {
    Write-Host "Error: $_"
}
