$tfPath = "C:\Users\Admin\.gemini\antigravity\brain\84542ae2-e889-4206-9836-362083c185ff\.system_generated\logs\transcript_full.jsonl"
$lines = [System.IO.File]::ReadAllLines($tfPath)

$steps = @(6620, 6624, 6628, 6632, 6636)

foreach ($idx in $steps) {
    $l = $lines[$idx]
    $json = $l | ConvertFrom-Json
    $tc = $json.tool_calls[0]
    $args = if ($tc.args) { $tc.args } else { $tc.parameters }
    Write-Host "--- Step $($idx) - TargetFile = $($args.TargetFile) ---"
    Write-Host "Instruction: $($args.Instruction)"
    Write-Host "StartLine: $($args.StartLine) EndLine: $($args.EndLine)"
    Write-Host "TargetContent len: $($args.TargetContent.Length) | ReplacementContent len: $($args.ReplacementContent.Length)"
}
