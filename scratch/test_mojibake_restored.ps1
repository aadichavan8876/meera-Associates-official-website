$patterns = @(
    'â‚¬', 'â„¢', 'â€œ', 'â€', 'â€™', 'â€”', 'â€“', 'â€¢', 'â€¦', 'Ã©', 'Ã¨', 'Ã±', 'Ã¡',
    'Ã³', 'Ãº', 'Ã', 'Â°', 'Â©', 'Â®', 'Â±', 'Â', 'âœ“', 'âœ', 'ðŸ', 'ï¿½', 'â˜', 'â–',
    'â–²', 'â–¼', 'â–º', 'â–„', 'â”', 'â–ª'
)

$files = @("scratch/nsdl_restored.html", "scratch/cdsl_restored.html")
$found = 0

foreach ($f in $files) {
    $content = [System.IO.File]::ReadAllText($f)
    foreach ($p in $patterns) {
        $matches = [regex]::Matches($content, [regex]::Escape($p))
        if ($matches.Count -gt 0) {
            Write-Output "[$f] Found $($matches.Count) instances of mojibake pattern '$p'"
            $found += $matches.Count
        }
    }
}
Write-Output "Total mojibake findings: $found"
