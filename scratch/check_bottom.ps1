$nsdl = [System.IO.File]::ReadAllText("nsdl-ideas-guide.html", [System.Text.Encoding]::UTF8)
Write-Output "--- NSDL bottom 500 chars ---"
Write-Output $nsdl.Substring([Math]::Max(0, $nsdl.Length - 800))

$cdsl = [System.IO.File]::ReadAllText("cdsl-easiest-guide.html", [System.Text.Encoding]::UTF8)
Write-Output "--- CDSL bottom 500 chars ---"
Write-Output $cdsl.Substring([Math]::Max(0, $cdsl.Length - 800))
