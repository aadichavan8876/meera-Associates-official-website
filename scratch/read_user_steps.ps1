$lines = Get-Content -Path "C:\Users\Admin\.gemini\antigravity\brain\84542ae2-e889-4206-9836-362083c185ff\.system_generated\logs\transcript.jsonl"
$userSteps = New-Object System.Collections.Generic.List[PSObject]
foreach ($l in $lines) {
    $obj = ConvertFrom-Json $l
    if ($obj.source -eq 'USER_EXPLICIT' -or $obj.type -eq 'USER_INPUT') {
        $userSteps.Add($obj)
    }
}
$recent = $userSteps | Select-Object -Last 10
foreach ($u in $recent) {
    Write-Output "------------------------------------"
    Write-Output "STEP: $($u.step_index)"
    Write-Output $u.content
}
