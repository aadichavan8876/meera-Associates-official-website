$testScrips = @('csk', 'kineco', 'herofincorp', 'ppfas', 'orbisfinancial', 'frickindia')

foreach ($s in $testScrips) {
    $path = "scripts\$s\$s.html"
    if (Test-Path $path) {
        $c = [System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)
        $qMatches = [regex]::Matches($c, '(?s)<div class="faq-question">\s*<span>(.*?)</span>')
        Write-Host "=== $s ($($qMatches.Count) questions) ==="
        for ($i = 0; $i -lt $qMatches.Count; $i++) {
            Write-Host "  Q$($i+1): $($qMatches[$i].Groups[1].Value.Trim())"
        }
    }
}
