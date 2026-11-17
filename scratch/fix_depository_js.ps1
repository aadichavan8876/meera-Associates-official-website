$js = [System.IO.File]::ReadAllText("depository-guides.js", [System.Text.Encoding]::UTF8)
$js = [regex]::Replace($js, "btn\.innerHTML = '.*? Copied!';", "btn.innerHTML = '\u2713 Copied!';")
[System.IO.File]::WriteAllText("depository-guides.js", $js, [System.Text.Encoding]::UTF8)
Write-Output "Fixed depository-guides.js checkmark"
