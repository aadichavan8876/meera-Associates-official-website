$tfPath = "C:\Users\Admin\.gemini\antigravity\brain\84542ae2-e889-4206-9836-362083c185ff\.system_generated\logs\transcript_full.jsonl"
$lines = [System.IO.File]::ReadAllLines($tfPath)

for ($i = 5000; $i -lt 7100; $i++) {
    $l = $lines[$i]
    if ($l.Contains("run_command") -and $l.Contains("CommandLine")) {
        if ($l.Contains("carehealth") -or $l.Contains("hdfcsecurities") -or $l.Contains("generate_") -or $l.Contains("apply_")) {
            Write-Host "$i : $($l.Substring(0, [Math]::Min(300, $l.Length)))"
        }
    }
}
