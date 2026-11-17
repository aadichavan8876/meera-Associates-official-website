$c = git show "9b7c36cd~1:nsdl-ideas-guide.html"
[System.IO.File]::WriteAllText("scratch/nsdl_before_wipe.html", $c, [System.Text.Encoding]::UTF8)

$c2 = git show "9b7c36cd~1:cdsl-easiest-guide.html"
[System.IO.File]::WriteAllText("scratch/cdsl_before_wipe.html", $c2, [System.Text.Encoding]::UTF8)

Write-Output "Extracted both files from commit 9b7c36cd~1 to scratch/"
