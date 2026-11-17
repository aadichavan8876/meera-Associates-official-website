$cdslCurrent = [System.IO.File]::ReadAllText("cdsl-easiest-guide.html", [System.Text.Encoding]::UTF8)
$sidebarStart = $cdslCurrent.IndexOf('sidebar-nav-links')
if ($sidebarStart -ge 0) {
    $sidebarEnd = $cdslCurrent.IndexOf('</ul>', $sidebarStart)
    Write-Output $cdslCurrent.Substring($sidebarStart, $sidebarEnd - $sidebarStart + 5)
} else {
    Write-Output "Not found sidebar-nav-links"
}
