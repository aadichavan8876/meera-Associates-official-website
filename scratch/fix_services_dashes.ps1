$filePath = 'services.html'
$c = [System.IO.File]::ReadAllText($filePath, [System.Text.Encoding]::UTF8)

# Replace em-dash and en-dash mojibake with pure HTML entities
$emDashMojibake = [char]0x00E2 + [char]0x20AC + [char]0x201D
$enDashMojibake = [char]0x00E2 + [char]0x20AC + [char]0x2013

$c = $c.Replace($emDashMojibake, "&mdash;")
$c = $c.Replace($enDashMojibake, "&ndash;")
$c = $c.Replace("â€”", "&mdash;")
$c = $c.Replace("â€“", "&ndash;")

[System.IO.File]::WriteAllText($filePath, $c, [System.Text.Encoding]::UTF8)
Write-Host "Replaced dashes in $filePath"
