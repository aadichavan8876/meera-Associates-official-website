$js = [System.IO.File]::ReadAllText("depository-guides.js", [System.Text.Encoding]::UTF8)
for ($i = 0; $i -lt $js.Length; $i++) {
    $c = $js[$i]
    if ([int]$c -gt 127) {
        Write-Output "Pos ${i}: code $([int]$c) in: $($js.Substring([Math]::Max(0, $i - 10), 20))"
    }
}
