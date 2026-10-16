$tfPath = "C:\Users\Admin\.gemini\antigravity\brain\84542ae2-e889-4206-9836-362083c185ff\.system_generated\logs\transcript_full.jsonl"
$files10 = @('carehealth', 'hdfcsecurities', 'hpx', 'indofil', 'motilaloswalhf', 'msei', 'nayaraenergy', 'nerl', 'oyo', 'sterlitegrid5')

$lines = [System.IO.File]::ReadAllLines($tfPath)

foreach ($f in $files10) {
    Write-Host "================== $f =================="
    for ($i = 0; $i -le 6650; $i++) {
        $l = $lines[$i]
        $k1 = "scripts/$f/$f.html"
        $k2 = "scripts\$f\$f.html"
        if ($l.Contains($k1) -or $l.Contains($k2)) {
            if ($l.Contains("tool_calls")) {
                try {
                    $json = $l | ConvertFrom-Json
                    foreach ($tc in $json.tool_calls) {
                        $args = if ($tc.args) { $tc.args } else { $tc.parameters }
                        $tf = $args.TargetFile
                        $cmd = $args.CommandLine
                        if ($tf -and ($tf.Contains($k1) -or $tf.Contains($k2))) {
                            Write-Host "Step $($i) - $($tc.name) TargetFile: $tf"
                        } elseif ($cmd -and ($cmd.Contains($k1) -or $cmd.Contains($k2))) {
                            Write-Host "Step $($i) - run_command: $cmd"
                        }
                    }
                } catch {}
            }
        }
    }
}
