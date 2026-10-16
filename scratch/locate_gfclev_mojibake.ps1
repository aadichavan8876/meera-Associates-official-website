$c = [System.IO.File]::ReadAllText('scripts/gfclev/gfclev.html', [System.Text.Encoding]::UTF8)
$pat1 = [char]0x00E2 + [char]0x0153
$pat2 = [char]0x00F0 + [char]0x0178
$lines = $c -split "`r?`n"
for ($i = 0; $i -lt $lines.Length; $i++) {
    if ($lines[$i].Contains($pat1) -or $lines[$i].Contains($pat2)) {
        Write-Host "Line $($i+1): $($lines[$i].Trim())"
    }
}
