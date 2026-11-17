$files = @("scratch/nsdl_s1_s2_clean.html", "scratch/cdsl_s1_s2_clean.html")
foreach ($f in $files) {
    Write-Output "=== Checking $f ==="
    $lines = [System.IO.File]::ReadAllLines($f, [System.Text.Encoding]::UTF8)
    for ($i = 0; $i -lt $lines.Length; $i++) {
        $l = $lines[$i]
        # Look for suspicious sequences or raw high chars
        foreach ($c in $l.ToCharArray()) {
            $code = [int]$c
            if ($code -gt 127) {
                Write-Output "Line $($i+1): code $code ('$c') in line: $($l.Trim())"
                break
            }
        }
    }
}
