$tfPath = "C:\Users\Admin\.gemini\antigravity\brain\84542ae2-e889-4206-9836-362083c185ff\.system_generated\logs\transcript_full.jsonl"
$lines = [System.IO.File]::ReadAllLines($tfPath)

for ($i = 7080; $i -lt 7120; $i++) {
    $l = $lines[$i]
    if ($l.Contains("convert_29_scrips_faq.ps1")) {
        Write-Host "Found at line $i : $($l.Substring(0, [Math]::Min(200, $l.Length)))"
    }
}
