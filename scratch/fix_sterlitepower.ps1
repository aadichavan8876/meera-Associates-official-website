$path = "scripts/sterlitepower/sterlitepower.html"
$c = [System.IO.File]::ReadAllText($path)
$idx = $c.IndexOf('<!-- Card 6: Dedicated Awards')
if ($idx -gt 0) {
    $endIdx = $c.IndexOf('<!-- Card 7: Annual Report', $idx)
    if ($endIdx -gt $idx) {
        $c = $c.Substring(0, $idx) + "`n`n                " + $c.Substring($endIdx)
        [System.IO.File]::WriteAllText($path, $c, [System.Text.Encoding]::UTF8)
        Write-Output "Sterlite Power awards card removed successfully!"
    }
}
