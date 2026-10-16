$tfPath = "C:\Users\Admin\.gemini\antigravity\brain\84542ae2-e889-4206-9836-362083c185ff\.system_generated\logs\transcript_full.jsonl"
$lines = [System.IO.File]::ReadAllLines($tfPath)

Write-Host "--- Line 6652 ---"
$l1 = $lines[6652]
Write-Host ($l1.Substring(0, [Math]::Min(500, $l1.Length)))

Write-Host "--- Line 6720 ---"
$l2 = $lines[6720]
Write-Host ($l2.Substring(0, [Math]::Min(500, $l2.Length)))
