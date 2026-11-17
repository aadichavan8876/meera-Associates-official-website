$nsdlCurrent = [System.IO.File]::ReadAllText("nsdl-ideas-guide.html", [System.Text.Encoding]::UTF8)
$start = $nsdlCurrent.IndexOf('id="registration"')
$end = $nsdlCurrent.IndexOf('</section>', $start)
Write-Output $nsdlCurrent.Substring($start, $end - $start + 10)
