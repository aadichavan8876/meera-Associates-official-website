$scrips = Get-ChildItem -Path scripts -Directory
foreach ($s in $scrips) {
    $f = "scripts\$($s.Name)\$($s.Name).html"
    if (Test-Path $f) {
        $c = [System.IO.File]::ReadAllText($f, [System.Text.Encoding]::UTF8)
        $qMatches = [regex]::Matches($c, '(?s)<div class="faq-question">\s*<span>(.*?)</span>')
        $qs = @()
        for ($i = 0; $i -lt $qMatches.Count; $i++) {
            $qs += $qMatches[$i].Groups[1].Value.Trim()
        }
        Write-Host "$($s.Name) ($($qs.Count)): $($qs -join ' | ')"
    }
}
