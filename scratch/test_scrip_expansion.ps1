$scrips = Get-ChildItem -Path scripts -Directory

$results = foreach ($s in $scrips) {
    $f = "scripts\$($s.Name)\$($s.Name).html"
    if (-not (Test-Path $f)) { continue }
    $c = [System.IO.File]::ReadAllText($f, [System.Text.Encoding]::UTF8)
    
    $titleMatch = [regex]::Match($c, '<h1[^>]*>(.*?)</h1>')
    $rawTitle = if ($titleMatch.Success) { ($titleMatch.Groups[1].Value -replace '<[^>]+>', '').Trim() } else { $s.Name }
    $shortName = $rawTitle -replace '\s+Limited.*', '' -replace '\s+Ltd.*', '' -replace '\s+Pvt.*', ''
    
    $isinMatch = [regex]::Match($c, 'INE[A-Z0-9]{9}')
    $isin = if ($isinMatch.Success) { $isinMatch.Value } else { "Active Demat" }
    
    # Existing questions
    $qMatches = [regex]::Matches($c, '(?s)<div class="faq-question">\s*<span>(.*?)</span>')
    $existingQs = @()
    for ($i = 0; $i -lt $qMatches.Count; $i++) {
        $existingQs += $qMatches[$i].Groups[1].Value.Trim()
    }
    
    $allQText = $existingQs -join " "
    
    $hasSelling = ($allQText -match '(?i)sell|liquidat|payout')
    $hasIPO = ($allQText -match '(?i)\bipo\b|lock-in|listing')
    $hasTax = ($allQText -match '(?i)tax|capital gains')
    $hasDividends = ($allQText -match '(?i)dividend|corporate action|bonus')
    
    [PSCustomObject]@{
        Scrip = $s.Name
        Count = $existingQs.Count
        Sell = if ($hasSelling) { "YES" } else { "NO" }
        IPO = if ($hasIPO) { "YES" } else { "NO" }
        Tax = if ($hasTax) { "YES" } else { "NO" }
        Div = if ($hasDividends) { "YES" } else { "NO" }
    }
}

$results | Format-Table Scrip, Count, Sell, IPO, Tax, Div -AutoSize
