$files = @("nsdl-ideas-guide.html", "cdsl-easiest-guide.html")

foreach ($f in $files) {
    Write-Output "========================================"
    Write-Output "Auditing LIVE file: $f"
    $c = [System.IO.File]::ReadAllText($f, [System.Text.Encoding]::UTF8)
    
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
    Write-Output "Found $($steps.Count) step-headings:"
    foreach ($st in $steps) {
        Write-Output "    * $($st.Groups[1].Value.Trim())"
    }

    # FAQs
    $faqs = [regex]::Matches($c, '<div class="faq-question">[\s\S]*?<span>(.*?)</span>')
    Write-Output "Found $($faqs.Count) FAQ questions:"
    foreach ($faq in $faqs) {
        Write-Output "    ? $($faq.Groups[1].Value.Trim())"
    }

    # Tag balance
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
