$lines = Get-Content -Path 'C:\Users\Admin\.gemini\antigravity\brain\84542ae2-e889-4206-9836-362083c185ff\.system_generated\logs\transcript.jsonl'
$lines | Where-Object { 
    $obj = $_ | ConvertFrom-Json
    $obj.step_index -ge 7960 -and $obj.step_index -le 7976
} | ForEach-Object {
    $obj = $_ | ConvertFrom-Json
    $c = ""
    if ($obj.content) {
        $c = $obj.content.Substring(0, [Math]::Min(140, $obj.content.Length)).Replace("`n", " ")
    }
    Write-Output "Step $($obj.step_index) | Source: $($obj.source) | Type: $($obj.type) | Content: $c"
}
