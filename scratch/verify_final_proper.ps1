$files = @("scratch/nsdl_final.html", "scratch/cdsl_final.html")

foreach ($f in $files) {
    Write-Output "========================================"
    Write-Output "Verifying $f"
    $c = [System.IO.File]::ReadAllText($f)
    
    # Sections
    $sections = [regex]::Matches($c, '(?si)<section\b[^>]*id="([^"]*)"[^>]*>.*?<h2[^>]*>(.*?)</h2>')
    Write-Output "Found $($sections.Count) sections:"
    foreach ($s in $sections) {
        $id = $s.Groups[1].Value
        $h2 = [regex]::Replace($s.Groups[2].Value, '<[^>]+>', ' ').Trim()
        $h2 = [regex]::Replace($h2, '\s+', ' ')
        Write-Output "  - id='$id': $h2"
    }

    # Step headings
    $steps = [regex]::Matches($c, '(?si)<h3 class="step-heading">(.*?)</h3>')
    Write-Output "Found $($steps.Count) steps:"
    foreach ($st in $steps) {
        Write-Output "    * $($st.Groups[1].Value.Trim())"
    }

    # Check tags balance
    $tags = @('div', 'section', 'ul', 'li', 'header', 'footer', 'main', 'p', 'h1', 'h2', 'h3', 'h4')
    $errCount = 0
    foreach ($t in $tags) {
        $open = [regex]::Matches($c, "<$t\b[^>]*>", [System.Text.RegularExpressions.RegexOptions]::IgnoreCase).Count
        $close = [regex]::Matches($c, "</$t>", [System.Text.RegularExpressions.RegexOptions]::IgnoreCase).Count
        if ($open -ne $close) {
            Write-Output "  [ERROR] Tag mismatch for <$t>: open=$open, close=$close"
            $errCount++
        }
    }
    if ($errCount -eq 0) {
        Write-Output "Tag balance: 100% PERFECT (0 errors)"
    }
}
Write-Output "`nVerification complete!"
