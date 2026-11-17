$files = @("scratch/nsdl_final.html", "scratch/cdsl_final.html")
foreach ($f in $files) {
    Write-Output "=== Checking $f for any character code > 127 ==="
    $content = [System.IO.File]::ReadAllText($f, [System.Text.Encoding]::UTF8)
    $nonAscii = 0
    for ($i = 0; $i -lt $content.Length; $i++) {
        $c = $content[$i]
        if ([int]$c -gt 127) {
            Write-Output "  Pos ${i}: code $([int]$c) in: $($content.Substring([Math]::Max(0, $i - 10), 20))"
            $nonAscii++
            if ($nonAscii -ge 10) {
                Write-Output "  (truncated after 10 findings)"
                break
            }
        }
    }
    if ($nonAscii -eq 0) {
        Write-Output "  ALL CHARACTERS ARE PURE ASCII (0 - 127)! Zero encoding risks!"
    } else {
        Write-Output "  Found $nonAscii non-ASCII characters."
    }
}
