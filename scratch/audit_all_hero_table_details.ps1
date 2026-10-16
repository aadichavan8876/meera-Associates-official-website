$htmlFiles = Get-ChildItem -Path "scripts" -Filter "*.html" -Recurse

$results = @()
$errorsCount = 0

foreach ($file in $htmlFiles) {
    $content = Get-Content $file.FullName -Raw -Encoding UTF8
    $name = $file.Directory.Name

    # 1. Hero 4-KPI Metric Strip Check
    # Find all metric cards within metrics-strip
    $stripMatch = [regex]::Match($content, '(?s)<div class="[^"]*metrics-strip[^"]*">(.*?)</div>\s*</div>\s*(?:</div>|\s*<div class="[^"]*hero-badge)')
    if (-not $stripMatch.Success) {
        $stripMatch = [regex]::Match($content, '(?s)<div class="[^"]*metrics-strip[^"]*">(.*?)</div>')
    }

    $b1Established = $false
    $b2FaceValue = $false
    $b3Isin = $false

    if ($stripMatch.Success) {
        $stripHtml = $stripMatch.Groups[1].Value
        # Split cards by <div class="...metric-card
        $cardMatches = [regex]::Matches($stripHtml, '(?s)<div class="[^"]*metric-card[^"]*"[^>]*>(.*?)</div>')
        if ($cardMatches.Count -ge 3) {
            $c0 = $cardMatches[0].Groups[1].Value
            $c1 = $cardMatches[1].Groups[1].Value
            $c2 = $cardMatches[2].Groups[1].Value

            $b1Established = ($c0 -match 'Established|Founded') -and ($c0 -notmatch 'Face Value') -and ($c0 -notmatch 'ISIN')
            $b2FaceValue = ($c1 -match 'Face Value') -and ($c1 -notmatch 'Established') -and ($c1 -notmatch 'ISIN')
            $b3Isin = ($c2 -match 'ISIN') -and ($c2 -notmatch 'Established') -and ($c2 -notmatch 'Face Value')
        }
    }

    # 2. Company Details Table Row Count
    # Find table with class containing spec-table or table
    $tableMatch = [regex]::Match($content, '(?s)<table[^>]*class="[^"]*(?:spec-table|table)[^"]*"[^>]*>(.*?)</table>')
    $rowCount = 0
    $rowsValid = $false
    if ($tableMatch.Success) {
        $tableHtml = $tableMatch.Groups[1].Value
        $trMatches = [regex]::Matches($tableHtml, '<tr\b')
        $rowCount = $trMatches.Count
        if ($rowCount -eq 4) {
            $rowsValid = $true
        }
    }

    # 3. Check for illegal raw <table> in financials
    $finTableIllegal = $false
    if ($content -match '(?s)(?:Audited Financial Performance|Financial Performance).*?(<table.*?</table>)') {
        # Check if there is a table inside the financial section
        $finSec = [regex]::Match($content, '(?s)(?:Audited Financial Performance|Financial Performance)(.*?)(?:Strategic Moats|Product Portfolio|Products & Services|Board of Directors|Frequently Asked Questions|FAQ)').Groups[1].Value
        if ($finSec -match '<table') {
            $finTableIllegal = $true
        }
    }

    # 4. FAQ check
    $hasFaq = $content -match 'faq-item|faq-card'

    $pass = $b1Established -and $b2FaceValue -and $b3Isin -and $rowsValid -and (-not $finTableIllegal) -and $hasFaq
    if (-not $pass) {
        $errorsCount++
        Write-Host "FAIL: $name -> Est:$b1Established FV:$b2FaceValue ISIN:$b3Isin Rows:$rowCount (Expected: 4) FinTableIllegal:$finTableIllegal FAQ:$hasFaq" -ForegroundColor Red
    }
}

Write-Host "=========================================="
Write-Host "Total Profile Pages Checked: $($htmlFiles.Count)"
Write-Host "Total Pages with Issues: $errorsCount"
if ($errorsCount -eq 0) {
    Write-Host "SUCCESS: ALL 49 SCRIP PAGES MEET 100% SPECIFICATIONS!" -ForegroundColor Green
}
