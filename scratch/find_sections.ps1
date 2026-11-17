$nsdl = [System.IO.File]::ReadAllText("scratch/nsdl_real_utf8.html", [System.Text.Encoding]::UTF8)
$cdsl = [System.IO.File]::ReadAllText("scratch/cdsl_real_utf8.html", [System.Text.Encoding]::UTF8)

Write-Output "NSDL matching SECTION:"
[regex]::Matches($nsdl, '<!-- SECTION [^>]+-->') | ForEach-Object { Write-Output $_.Value }

Write-Output "CDSL matching SECTION:"
[regex]::Matches($cdsl, '<!-- SECTION [^>]+-->') | ForEach-Object { Write-Output $_.Value }
