$tfPath = "C:\Users\Admin\.gemini\antigravity\brain\84542ae2-e889-4206-9836-362083c185ff\.system_generated\logs\transcript_full.jsonl"
$lines = [System.IO.File]::ReadAllLines($tfPath)

Write-Host "Total lines in transcript_full: $($lines.Count)"

$files10 = @(
    "carehealth", "hdfcsecurities", "hpx", "indofil", "motilaloswalhf",
    "msei", "nayaraenergy", "nerl", "oyo", "sterlitegrid5"
)

foreach ($f in $files10) {
    # Find latest line that contains <!DOCTYPE html> and $f
    for ($i = $lines.Count - 1; $i -ge 0; $i--) {
        $l = $lines[$i]
        if ($l.Contains("scripts/$f/$f.html") -and $l.Contains("<!DOCTYPE html>")) {
            Write-Host "$f => Found at line $i (Length: $($l.Length))"
            break
        }
    }
}
