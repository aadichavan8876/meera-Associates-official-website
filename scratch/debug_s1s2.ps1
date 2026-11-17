$text = [System.IO.File]::ReadAllText("scratch/nsdl_s1_s2_clean.html", [System.Text.Encoding]::UTF8)
Write-Output "nsdl_s1_s2_clean.html length: $($text.Length)"
Write-Output "First 300 chars:"
Write-Output $text.Substring(0, [Math]::Min(300, $text.Length))
Write-Output "Last 300 chars:"
Write-Output $text.Substring([Math]::Max(0, $text.Length - 300))
