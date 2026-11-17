$files = @("scratch/nsdl_s1_s2_clean.html", "scratch/cdsl_s1_s2_clean.html")
foreach ($f in $files) {
    Write-Output "=== Non-ASCII in $f ==="
    $text = [System.IO.File]::ReadAllText($f, [System.Text.Encoding]::UTF8)
    for ($i = 0; $i -lt $text.Length; $i++) {
        $c = $text[$i]
        $code = [int]$c
        if ($code -ge 55296 -and $code -le 56319) {
            # High surrogate
            $c2 = $text[$i+1]
            $code2 = [int]$c2
            $codePoint = [char]::ConvertToUtf32($c, $c2)
            $sub = $text.Substring([Math]::Max(0, $i - 15), [Math]::Min($text.Length - [Math]::Max(0, $i - 15), 35))
            Write-Output "Surrogate U+$($codePoint.ToString('X4')) (&#$codePoint;) in context: $sub"
            $i++
        } elseif ($code -gt 127) {
            $sub = $text.Substring([Math]::Max(0, $i - 15), [Math]::Min($text.Length - [Math]::Max(0, $i - 15), 35))
            Write-Output "CodePoint U+$($code.ToString('X4')) (&#$code;) in context: $sub"
        }
    }
}
