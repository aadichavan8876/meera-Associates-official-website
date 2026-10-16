$tfPath = "C:\Users\Admin\.gemini\antigravity\brain\84542ae2-e889-4206-9836-362083c185ff\.system_generated\logs\transcript_full.jsonl"
$files10 = @('carehealth', 'hdfcsecurities', 'hpx', 'indofil', 'motilaloswalhf', 'msei', 'nayaraenergy', 'nerl', 'oyo', 'sterlitegrid5')

$lines = [System.IO.File]::ReadAllLines($tfPath)

for ($i = 0; $i -lt [Math]::Min(6600, $lines.Count); $i++) {
    $l = $lines[$i]
    if ($l.Contains('"name":"write_to_file"')) {
        foreach ($scrip in $files10) {
            if ($l.Contains("$scrip.html")) {
                Write-Host "write_to_file for $scrip at line $i (length: $($l.Length))"
            }
        }
    }
}
