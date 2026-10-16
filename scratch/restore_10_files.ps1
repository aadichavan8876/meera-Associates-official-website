# Restore 10 untracked files
$tfPath = "C:\Users\Admin\.gemini\antigravity\brain\84542ae2-e889-4206-9836-362083c185ff\.system_generated\logs\transcript_full.jsonl"
$lines = [System.IO.File]::ReadAllLines($tfPath)

# 1. Run the 5 brain generators
$brainScratch = "C:\Users\Admin\.gemini\antigravity\brain\84542ae2-e889-4206-9836-362083c185ff\scratch"
& "$brainScratch\generate_care_html.ps1"
& "$brainScratch\generate_hpx_html.ps1"
& "$brainScratch\generate_indofil_html.ps1"
& "$brainScratch\generate_msei_html.ps1"
& "$brainScratch\generate_sgl5_html.ps1"

# 2. Extract the 5 files from lines 5775, 5777, 5779, 5781, 5783
$map5 = @{
    5775 = "scripts\nerl\nerl.html"
    5777 = "scripts\nayaraenergy\nayaraenergy.html"
    5779 = "scripts\oyo\oyo.html"
    5781 = "scripts\hdfcsecurities\hdfcsecurities.html"
    5783 = "scripts\motilaloswalhf\motilaloswalhf.html"
}

foreach ($lineIdx in $map5.Keys) {
    $target = $map5[$lineIdx]
    $json = $lines[$lineIdx] | ConvertFrom-Json
    $tc = $json.tool_calls[0]
    $args = if ($tc.args) { $tc.args } else { $tc.parameters }
    $code = $args.CodeContent
    [System.IO.File]::WriteAllText($target, $code, [System.Text.Encoding]::UTF8)
    Write-Host "Restored $target from line $lineIdx (len: $($code.Length))"
}
