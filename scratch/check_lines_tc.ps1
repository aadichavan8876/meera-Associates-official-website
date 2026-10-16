$tfPath = "C:\Users\Admin\.gemini\antigravity\brain\84542ae2-e889-4206-9836-362083c185ff\.system_generated\logs\transcript_full.jsonl"
$lines = [System.IO.File]::ReadAllLines($tfPath)

$linesToCheck = @(4359, 4369, 4379, 4389, 4411, 5775, 5777, 5779, 5781, 5783, 6267, 6279, 6291)

foreach ($idx in $linesToCheck) {
    $l = $lines[$idx]
    try {
        $json = $l | ConvertFrom-Json
        Write-Host "--- Line $idx ---"
        foreach ($tc in $json.tool_calls) {
            $name = $tc.name
            $args = if ($tc.args) { $tc.args } else { $tc.parameters }
            $target = $args.TargetFile
            $cmd = $args.CommandLine
            $cmdPreview = ""
            if ($cmd) {
                $cmdPreview = $cmd.Substring(0, [Math]::Min(60, $cmd.Length))
            }
            Write-Host "   $name : Target=$target | Cmd=$cmdPreview"
        }
    } catch {
        Write-Host "Error parsing line $idx : $_"
    }
}
