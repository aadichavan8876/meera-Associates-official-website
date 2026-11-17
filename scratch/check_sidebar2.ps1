$nsdlCurrent = [System.IO.File]::ReadAllText("nsdl-ideas-guide.html", [System.Text.Encoding]::UTF8)
$sidebarStart = $nsdlCurrent.IndexOf('sidebar-nav-links')
if ($sidebarStart -ge 0) {
    $sidebarEnd = $nsdlCurrent.IndexOf('</ul>', $sidebarStart)
    Write-Output $nsdlCurrent.Substring($sidebarStart, $sidebarEnd - $sidebarStart + 5)
} else {
    Write-Output "Not found sidebar-nav-links"
}
