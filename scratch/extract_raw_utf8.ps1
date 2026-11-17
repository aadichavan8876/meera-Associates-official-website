$gitProcess = Start-Process -FilePath "git" -ArgumentList "show", "9b7c36cd~1:nsdl-ideas-guide.html" -NoNewWindow -RedirectStandardOutput "scratch/nsdl_utf8.html" -PassThru
$gitProcess.WaitForExit()

$gitProcess2 = Start-Process -FilePath "git" -ArgumentList "show", "9b7c36cd~1:cdsl-easiest-guide.html" -NoNewWindow -RedirectStandardOutput "scratch/cdsl_utf8.html" -PassThru
$gitProcess2.WaitForExit()

Write-Output "Extracted raw byte files via git redirect."
