$bytes = [System.IO.File]::ReadAllBytes('scripts/gfclev/gfclev.html')
$text = [System.Text.Encoding]::UTF8.GetString($bytes)

# Let's find each char > 127 in gfclev.html
$chars = $text.ToCharArray()
for ($i = 0; $i -lt $chars.Length; $i++) {
    $c = [int]$chars[$i]
    if ($c -gt 127) {
        $sub = $text.Substring([Math]::Max(0, $i - 10), [Math]::Min(30, $text.Length - $i + 10))
        Write-Host "At $i : char code $c (0x$($c.ToString('X4'))) in context: '$sub'"
        $i += 5 # skip forward
    }
}
