$lines = Get-Content -Path "C:\Users\Admin\.gemini\antigravity\brain\84542ae2-e889-4206-9836-362083c185ff\.system_generated\logs\transcript.jsonl"
$lastLines = $lines | Select-Object -Last 12
foreach ($l in $lastLines) {
    $obj = ConvertFrom-Json $l
    Write-Output "=== STEP $($obj.step_index) | SOURCE: $($obj.source) | TYPE: $($obj.type) ==="
    if ($obj.content) {
        $preview = if ($obj.content.Length -gt 300) { $obj.content.Substring(0, 300) + '...' } else { $obj.content }
        Write-Output $preview
    }
}
