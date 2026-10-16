$tfPath = "C:\Users\Admin\.gemini\antigravity\brain\84542ae2-e889-4206-9836-362083c185ff\.system_generated\logs\transcript_full.jsonl"
$lines = [System.IO.File]::ReadAllLines($tfPath)

$steps = @(6620, 6624, 6628, 6632, 6636)

foreach ($idx in $steps) {
    $l = $lines[$idx]
    $json = $l | ConvertFrom-Json
    $tc = $json.tool_calls[0]
    $args = if ($tc.args) { $tc.args } else { $tc.parameters }
    $file = $args.TargetFile
    $target = $args.TargetContent.Replace("`r`n", "`n")
    $replacement = $args.ReplacementContent.Replace("`r`n", "`n")

    $content = [System.IO.File]::ReadAllText($file, [System.Text.Encoding]::UTF8).Replace("`r`n", "`n")
    if ($content.Contains($target)) {
        $newContent = $content.Replace($target, $replacement)
        # Write back with Windows CRLF
        $newContent = $newContent.Replace("`n", "`r`n")
        [System.IO.File]::WriteAllText($file, $newContent, [System.Text.Encoding]::UTF8)
        Write-Host "Applied replacement from step $idx to $file" -ForegroundColor Green
    } else {
        Write-Host "Target not found in $file for step $idx" -ForegroundColor Red
    }
}
