$tfPath = "C:\Users\Admin\.gemini\antigravity\brain\84542ae2-e889-4206-9836-362083c185ff\.system_generated\logs\transcript_full.jsonl"
$files10 = @('carehealth', 'hdfcsecurities', 'hpx', 'indofil', 'motilaloswalhf', 'msei', 'nayaraenergy', 'nerl', 'oyo', 'sterlitegrid5')

$lines = [System.IO.File]::ReadAllLines($tfPath)

for ($i = 0; $i -lt [Math]::Min(7080, $lines.Count); $i++) {
    $l = $lines[$i]
    foreach ($scrip in $files10) {
        $k1 = "scripts/$scrip/$scrip.html"
        $k2 = "scripts\$scrip\$scrip.html"
        if ($l.Contains($k1) -or $l.Contains($k2)) {
            if ($l.Contains('"write_to_file"') -or $l.Contains('"replace_file_content"')) {
                try {
                    $json = $l | ConvertFrom-Json
                    foreach ($tc in $json.tool_calls) {
                        $args = $tc.args
                        if (-not $args) { $args = $tc.parameters }
                        $tf = $args.TargetFile
                        if ($tf -and ($tf.Contains($k1) -or $tf.Contains($k2))) {
                            Write-Host "Line $i : $($tc.name) on $scrip (Target: $tf)"
                        }
                    }
                } catch {}
            }
        }
    }
}
