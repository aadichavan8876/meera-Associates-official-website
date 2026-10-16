$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
$masterFooter = [System.IO.File]::ReadAllText("scratch/ncdex_footer.html", [System.Text.Encoding]::UTF8)

$scrips = @(
    @{ name = "orbisfinancial"; js = "orbisfinancial.js"; label = "Orbis Financial" },
    @{ name = "herofincorp"; js = "herofincorp.js"; label = "Hero FinCorp" },
    @{ name = "csk"; js = "csk.js"; label = "Chennai Super Kings" },
    @{ name = "goodluckdefence"; js = "goodluckdefence.js"; label = "Goodluck Defence" },
    @{ name = "kineco"; js = "kineco.js"; label = "Kineco" }
)

foreach ($s in $scrips) {
    $file = "scripts/$($s.name)/$($s.name).html"
    $path = (Resolve-Path $file).Path
    $content = [System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)

    # Cut off from <footer to end of file
    $idx = $content.IndexOf('<footer class="footer">')
    if ($idx -lt 0) {
        $idx = $content.IndexOf('<footer')
    }

    if ($idx -ge 0) {
        $preFooter = $content.Substring(0, $idx)

        $tail = @"
$masterFooter

    <!-- Dedicated Script for $($s.label) -->
    <script src="$($s.js)"></script>

    <!-- Global Interactive Scripts -->
    <script src="../../script.js"></script>
    <script src="../../chatbot-kb.js"></script>
    <script src="../../chatbot.js"></script>
</body>
</html>
"@

        $newContent = $preFooter + $tail
        [System.IO.File]::WriteAllText($path, $newContent, $utf8NoBom)
        Write-Host "Updated footer in $file" -ForegroundColor Green
    } else {
        Write-Host "Could not find <footer> in $file" -ForegroundColor Red
    }
}
