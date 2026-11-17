$nsdlCurrent = [System.IO.File]::ReadAllText("nsdl-ideas-guide.html", [System.Text.Encoding]::UTF8)
$sidebarStart = $nsdlCurrent.IndexOf('class="guide-stepper"')
$sidebarEnd = $nsdlCurrent.IndexOf('</ul>', $sidebarStart)
Write-Output $nsdlCurrent.Substring($sidebarStart, $sidebarEnd - $sidebarStart + 5)
