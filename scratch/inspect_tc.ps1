$tfPath = "C:\Users\Admin\.gemini\antigravity\brain\84542ae2-e889-4206-9836-362083c185ff\.system_generated\logs\transcript_full.jsonl"
$lines = [System.IO.File]::ReadAllLines($tfPath)

for ($i = 6635; $i -le 6655; $i++) {
    $l = $lines[$i]
    if ($l.Contains("tool_calls")) {
        $json = $l | ConvertFrom-Json
        foreach ($tc in $json.tool_calls) {
            Write-Host "$i : $($tc.name)"
            if ($tc.name -eq "run_command") {
                Write-Host "   Command: $($tc.args.CommandLine)"
            }
            if ($tc.name -eq "write_to_file") {
                Write-Host "   File: $($tc.args.TargetFile)"
            }
        }
    }
}
