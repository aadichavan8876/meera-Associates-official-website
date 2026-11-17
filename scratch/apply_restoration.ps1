[System.IO.File]::Copy("scratch/nsdl_final.html", "nsdl-ideas-guide.html", $true)
[System.IO.File]::Copy("scratch/cdsl_final.html", "cdsl-easiest-guide.html", $true)
Write-Output "Successfully overwritten nsdl-ideas-guide.html and cdsl-easiest-guide.html with final verified restored content."
