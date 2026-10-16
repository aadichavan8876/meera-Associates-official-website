$resp = Invoke-WebRequest -Uri 'https://www.meeraassociates.co.in/gfcl-ev-porducts-ltd-unlisted-share.html' -UseBasicParsing
[System.IO.File]::WriteAllText('scratch/gfclev_live_full.html', $resp.Content, [System.Text.Encoding]::UTF8)
Write-Output "Downloaded $($resp.Content.Length) chars"
