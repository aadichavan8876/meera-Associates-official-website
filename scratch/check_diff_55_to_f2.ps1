$diffSummary = git diff 55b5b4f4 f2624718 -U1 -- nsdl-ideas-guide.html
Write-Output "First 60 lines of diff:"
$diffSummary | Select-Object -First 60
