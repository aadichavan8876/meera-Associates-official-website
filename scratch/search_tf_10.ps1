# Extract original contents from transcript_full.jsonl for untracked files
$files10 = @(
    "scripts\carehealth\carehealth.html",
    "scripts\hdfcsecurities\hdfcsecurities.html",
    "scripts\hpx\hpx.html",
    "scripts\indofil\indofil.html",
    "scripts\motilaloswalhf\motilaloswalhf.html",
    "scripts\msei\msei.html",
    "scripts\nayaraenergy\nayaraenergy.html",
    "scripts\nerl\nerl.html",
    "scripts\oyo\oyo.html",
    "scripts\sterlitegrid5\sterlitegrid5.html"
)

$tfPath = "C:\Users\Admin\.gemini\antigravity\brain\84542ae2-e889-4206-9836-362083c185ff\.system_generated\logs\transcript_full.jsonl"

foreach ($f in $files10) {
    $searchKey = $f.Replace("\", "\\")
    $lineMatch = Select-String -Path $tfPath -Pattern $searchKey -SimpleMatch
    Write-Host "$f => Found $($lineMatch.Count) occurrences in transcript_full"
}
