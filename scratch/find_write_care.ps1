$tfPath = "C:\Users\Admin\.gemini\antigravity\brain\84542ae2-e889-4206-9836-362083c185ff\.system_generated\logs\transcript_full.jsonl"
$lines = [System.IO.File]::ReadAllLines($tfPath)

for ($i = 0; $i -lt $lines.Count; $i++) {
    $l = $lines[$i]
    if ($l.Contains("TargetFile") -and $l.Contains("carehealth.html")) {
        Write-Host "write_to_file carehealth found at $i, length: $($l.Length)"
    }
}
