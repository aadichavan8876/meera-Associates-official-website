$tfPath = "C:\Users\Admin\.gemini\antigravity\brain\84542ae2-e889-4206-9836-362083c185ff\.system_generated\logs\transcript_full.jsonl"
$lines = [System.IO.File]::ReadAllLines($tfPath)

$json = $lines[6620] | ConvertFrom-Json
$tc = $json.tool_calls[0]
$args = if ($tc.args) { $tc.args } else { $tc.parameters }
Write-Host "TARGET CONTENT:"
Write-Host $args.TargetContent
Write-Host "REPLACEMENT CONTENT:"
Write-Host $args.ReplacementContent
