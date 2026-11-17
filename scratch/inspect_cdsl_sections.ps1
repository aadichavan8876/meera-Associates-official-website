$c = [System.IO.File]::ReadAllText("scratch/cdsl_before_wipe.html")
$sections = [regex]::Matches($c, '(?si)<section\b[^>]*id="([^"]*)"[^>]*>.*?<h2[^>]*>(.*?)</h2>')
Write-Output "CDSL sections before wipe:"
foreach ($s in $sections) {
    $id = $s.Groups[1].Value
    $h2 = [regex]::Replace($s.Groups[2].Value, '<[^>]+>', ' ').Trim()
    $h2 = [regex]::Replace($h2, '\s+', ' ')
    Write-Output "  - id='$id': $h2"
}
