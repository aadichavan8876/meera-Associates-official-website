$c = [System.IO.File]::ReadAllText('services.html', [System.Text.Encoding]::UTF8)
$pat = [char]0x00E2 + [char]0x20AC
$lines = $c -split "`r?`n"
for ($i = 0; $i -lt $lines.Length; $i++) {
    if ($lines[$i].Contains($pat)) {
        Write-Host "Line $($i+1): $($lines[$i].Trim())"
    }
}
