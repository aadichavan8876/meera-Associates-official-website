$tfPath = "C:\Users\Admin\.gemini\antigravity\brain\84542ae2-e889-4206-9836-362083c185ff\.system_generated\logs\transcript_full.jsonl"
$lines = [System.IO.File]::ReadAllLines($tfPath)

$steps = @(
    @{ Name = "hpx"; Line = 4359 },
    @{ Name = "carehealth"; Line = 4369 },
    @{ Name = "msei"; Line = 4379 },
    @{ Name = "indofil"; Line = 4389 },
    @{ Name = "sterlitegrid5"; Line = 4411 },
    @{ Name = "nerl"; Line = 5775 },
    @{ Name = "nayaraenergy"; Line = 6291 },
    @{ Name = "oyo"; Line = 6279 },
    @{ Name = "hdfcsecurities"; Line = 6267 },
    @{ Name = "motilaloswalhf"; Line = 6267 }
)

foreach ($item in $steps) {
    $l = $lines[$item.Line]
    $json = $l | ConvertFrom-Json
    foreach ($tc in $json.tool_calls) {
        $args = if ($tc.args) { $tc.args } else { $tc.parameters }
        $tf = $args.TargetFile
        if ($tf -and $tf.Contains($item.Name + ".html")) {
            $code = $args.CodeContent
            Write-Host "$($item.Name) at line $($item.Line) has CodeContent of length $($code.Length)"
        }
    }
}
