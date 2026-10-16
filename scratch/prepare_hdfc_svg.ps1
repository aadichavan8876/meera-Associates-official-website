$svgText = Get-Content 'assets/logos/hdfc-securities.svg' -Raw -Encoding UTF8

# Keep a backup of the original white-text SVG
[System.IO.File]::WriteAllText((Resolve-Path 'assets/logos').Path + '\hdfc-securities-white.svg', $svgText, [System.Text.Encoding]::UTF8)

# Now, in the main hdfc-securities.svg, lines 7-17 represent the text letters:
# Let's see: path 1-6 are the HDFC logo box (red square, white crosses, blue center).
# Path 7 onwards are letters:
# We want the letters to be #1D4582 so they are clearly visible on white cards!
$lines = $svgText -split "`r?`n"
for ($i = 6; $i -lt $lines.Length; $i++) {
    $lines[$i] = $lines[$i].Replace('fill="white"', 'fill="#1D4582"')
}

$newSvg = $lines -join "`n"
[System.IO.File]::WriteAllText((Resolve-Path 'assets/logos').Path + '\hdfc-securities.svg', $newSvg, [System.Text.Encoding]::UTF8)
Write-Host "Updated hdfc-securities.svg with #1D4582 text and saved hdfc-securities-white.svg"
