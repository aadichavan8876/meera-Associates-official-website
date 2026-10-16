$tfPath = "C:\Users\Admin\.gemini\antigravity\brain\84542ae2-e889-4206-9836-362083c185ff\.system_generated\logs\transcript_full.jsonl"
$line6718 = (Get-Content -Path $tfPath -TotalCount 6719)[-1]
Write-Host "Length: $($line6718.Length)"
Write-Host $line6718.Substring(0, [Math]::Min(300, $line6718.Length))
