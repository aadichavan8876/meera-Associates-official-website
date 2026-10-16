$tfPath = "C:\Users\Admin\.gemini\antigravity\brain\84542ae2-e889-4206-9836-362083c185ff\.system_generated\logs\transcript_full.jsonl"
$files10 = @('carehealth', 'hdfcsecurities', 'hpx', 'indofil', 'motilaloswalhf', 'msei', 'nayaraenergy', 'nerl', 'oyo', 'sterlitegrid5')

$lines = [System.IO.File]::ReadAllLines($tfPath)

foreach ($f in $files10) {
    $idxList = [System.Collections.Generic.List[int]]::new()
    for ($i = 0; $i -lt $lines.Count; $i++) {
        if ($lines[$i] -match "scripts[\\/]$f[\\/]$f\.html") {
            $idxList.Add($i)
        }
    }
    Write-Host "$f => $($idxList -join ', ')"
}
