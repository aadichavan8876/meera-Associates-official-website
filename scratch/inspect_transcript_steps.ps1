$tfPath = "C:\Users\Admin\.gemini\antigravity\brain\84542ae2-e889-4206-9836-362083c185ff\.system_generated\logs\transcript_full.jsonl"
$lines = [System.IO.File]::ReadAllLines($tfPath)

for ($i = 6900; $i -lt [Math]::Min(7150, $lines.Count); $i++) {
    $l = $lines[$i]
    if ($l.Contains("run_command") -or $l.Contains("write_to_file") -or $l.Contains("USER_INPUT")) {
        $sample = $l.Substring(0, [Math]::Min(150, $l.Length))
        Write-Host "$i : $sample"
    }
}
