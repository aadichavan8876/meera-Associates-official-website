$rootFiles = Get-ChildItem -Path . -Filter *.html -File

foreach ($f in $rootFiles) {
    $lines = Get-Content $f.FullName -Encoding UTF8
    $matchesFound = @()
    for ($i = 0; $i -lt $lines.Count; $i++) {
        $l = $lines[$i]
        if ($l -match '(?i)<section[^>]*faq' -or $l -match '(?i)id="faq"' -or $l -match '(?i)class="[^"]*faq' -or $l -match '(?i)<h[1-4][^>]*>.*Frequently Asked') {
            $matchesFound += "Line $($i+1): $($l.Trim())"
        }
    }
    if ($matchesFound.Count -gt 0) {
        Write-Host "================ $($f.Name) ($($matchesFound.Count) matches) ================"
        $matchesFound | Select-Object -First 5 | ForEach-Object { Write-Host "  $_" }
    }
}
