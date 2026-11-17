$files = @("scratch/nsdl_final.html", "scratch/cdsl_final.html")

foreach ($filePath in $files) {
    Write-Output "========================================"
    Write-Output "Verifying $filePath"
    $content = [System.IO.File]::ReadAllText($filePath, [System.Text.Encoding]::UTF8)

    # 1. Check sections
    $sections = [regex]::Matches($content, '<section class="guide-card" id="([^"]+)">[\s\S]*?<h2 class="guide-card-title">(.*?)</h2>')
    Write-Output "Found $($sections.Count) sections:"
    foreach ($s in $sections) {
        $id = $s.Groups[1].Value
        $title = $s.Groups[2].Value.Trim() -replace '\s+', ' '
        Write-Output "  - id='$id': $title"
    }

    # 2. Check steps
    $steps = [regex]::Matches($content, '<h3 class="guide-step-title">(.*?)</h3>')
    Write-Output "Found $($steps.Count) steps:"
    foreach ($step in $steps) {
        $stepTitle = $step.Groups[1].Value.Trim() -replace '\s+', ' '
        Write-Output "    * $stepTitle"
    }

    # 3. Check FAQs
    $faqs = [regex]::Matches($content, '<div class="faq-question">[\s\S]*?<span>(.*?)</span>')
    Write-Output "Found $($faqs.Count) FAQ questions:"
    foreach ($faq in $faqs) {
        Write-Output "    ? $($faq.Groups[1].Value.Trim())"
    }

    # 4. Check Tag Balance for crucial tags
    $tagsToTest = @('section', 'div', 'ul', 'ol', 'p', 'h1', 'h2', 'h3', 'a', 'span', 'button', 'details')
    $balanceErrors = 0
    foreach ($tag in $tagsToTest) {
        $opens = [regex]::Matches($content, "<$tag(\s+[^>]*)?>", [System.Text.RegularExpressions.RegexOptions]::IgnoreCase).Count
        $closes = [regex]::Matches($content, "</$tag>", [System.Text.RegularExpressions.RegexOptions]::IgnoreCase).Count
        if ($opens -ne $closes) {
            Write-Output "  [ERROR] Tag <$tag> mismatch: $opens opened vs $closes closed"
            $balanceErrors++
        }
    }
    if ($balanceErrors -eq 0) {
        Write-Output "  Tag balance check: PERFECT (0 errors across all tags)"
    }

    # 5. Check for any mojibake or suspicious characters
    $suspicious = @('A', '', '??', 'dY')
    $suspiciousCount = 0
    foreach ($pat in $suspicious) {
        $m = [regex]::Matches($content, [regex]::Escape($pat))
        if ($m.Count -gt 0) {
            Write-Output "  [WARN] Found $($m.Count) instances of suspicious pattern '$pat'"
            $suspiciousCount += $m.Count
        }
    }
    if ($suspiciousCount -eq 0) {
        Write-Output "  Suspicious/mojibake character check: CLEAN (0 issues)"
    }
}
Write-Output "========================================"
Write-Output "Final verification finished!"
