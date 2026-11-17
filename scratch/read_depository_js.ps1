$js = [System.IO.File]::ReadAllText("depository-guides.js", [System.Text.Encoding]::UTF8)
Write-Output $js
