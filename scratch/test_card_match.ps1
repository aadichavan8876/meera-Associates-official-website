$files = Get-ChildItem -Path "scripts" -Recurse -Filter "*.html"
$pattern = '(?si)\s*<!--\s*Card\s*\d*:\s*(?:Awards|Upcoming|News|Recent Strategic|Turnkey|National Project|Services of Company|KEY HIGHLIGHTS)[^>]*-->\s*<div\s+class="[a-z0-9_-]+-card"[^>]*>.*?</div>\s*(?=\s*<!--\s*Card|\s*</div>\s*<!--\s*RIGHT|\s*</div>\s*<aside|\s*</aside)'

foreach ($f in $files) {
    $scrip = $f.Directory.Name
    $content = [System.IO.File]::ReadAllText($f.FullName)
    $matches = [regex]::Matches($content, $pattern)
    if ($matches.Count -gt 0) {
        Write-Output "[$scrip] Matches: $($matches.Count)"
        foreach ($m in $matches) {
            $firstLine = $m.Value.Trim().Split("`n")[0]
            Write-Output "   -> $firstLine"
        }
    }
}
