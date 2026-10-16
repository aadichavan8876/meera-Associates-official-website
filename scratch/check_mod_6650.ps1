$tfPath = "C:\Users\Admin\.gemini\antigravity\brain\84542ae2-e889-4206-9836-362083c185ff\.system_generated\logs\transcript_full.jsonl"
$files10 = @('carehealth', 'hdfcsecurities', 'hpx', 'indofil', 'motilaloswalhf', 'msei', 'nayaraenergy', 'nerl', 'oyo', 'sterlitegrid5')

$lines = [System.IO.File]::ReadAllLines($tfPath)

for ($i = 6650; $i -lt $lines.Count; $i++) {
    $l = $lines[$i]
    foreach ($f in $files10) {
        if ($l.Contains("scripts\$f\$f.html") -or $l.Contains("scripts/$f/$f.html")) {
            Write-Host "Line $i touched $f"
        }
    }
}
