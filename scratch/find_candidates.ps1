$tfPath = "C:\Users\Admin\.gemini\antigravity\brain\84542ae2-e889-4206-9836-362083c185ff\.system_generated\logs\transcript_full.jsonl"
$files10 = @('carehealth', 'hdfcsecurities', 'hpx', 'indofil', 'motilaloswalhf', 'msei', 'nayaraenergy', 'nerl', 'oyo', 'sterlitegrid5')

$lines = [System.IO.File]::ReadAllLines($tfPath)

foreach ($f in $files10) {
    Write-Host "=== $f ==="
    # Find lines before 7000 that mention this file
    for ($i = 7000; $i -ge 0; $i--) {
        $line = $lines[$i]
        if ($line.Contains("scripts\$f\$f.html") -or $line.Contains("scripts/$f/$f.html")) {
            if ($line.Contains("write_to_file") -or $line.Contains("Set-Content") -or $line.Contains("<!DOCTYPE html>")) {
                Write-Host "Found candidate line $i, length: $($line.Length)"
                if ($line.Length -gt 15000) {
                    Write-Host "  -> Large line candidate at $i"
                    break
                }
            }
        }
    }
}
