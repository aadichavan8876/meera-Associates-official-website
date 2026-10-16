$tfPath = "C:\Users\Admin\.gemini\antigravity\brain\84542ae2-e889-4206-9836-362083c185ff\.system_generated\logs\transcript_full.jsonl"
$lines = [System.IO.File]::ReadAllLines($tfPath)
$l = $lines[7092]
Write-Host ($l.Substring(0, [Math]::Min(2000, $l.Length)))
