$tfPath = "C:\Users\Admin\.gemini\antigravity\brain\84542ae2-e889-4206-9836-362083c185ff\.system_generated\logs\transcript_full.jsonl"
$line = (Get-Content -Path $tfPath -TotalCount 4253)[-1]
Write-Host "Length of 4252: $($line.Length)"
Write-Host ($line.Substring(0, [Math]::Min(1000, $line.Length)))
