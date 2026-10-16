# Scan all HTML, CSS, JS files for mojibake, footer consistency, and emoji usage
$files = Get-ChildItem -Path . -Include *.html,*.js,*.css -Recurse | Where-Object { 
    $_.FullName -notmatch '\\node_modules\\' -and 
    $_.FullName -notmatch '\\\.git\\' -and
    $_.FullName -notmatch '\\scratch\\'
}

$mojibakePatterns = @('â€', 'Ã¢', 'Ã©', 'Ã', 'ï¿½', [string][char]0xFFFD, 'ðŸ', 'â€™', 'â€œ', 'â€')

$mojibakeList = @()
foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw -Encoding UTF8
    foreach ($pat in $mojibakePatterns) {
        if ($content.IndexOf($pat) -ge 0) {
            $mojibakeList += [PSCustomObject]@{
                File = $file.FullName.Replace((Get-Location).Path + "\", "")
                Pattern = $pat
            }
            break
        }
    }
}

Write-Host "=================== MOJIBAKE / ENCODING AUDIT ==================="
Write-Host "Total files scanned: $($files.Count)"
Write-Host "Files with mojibake: $($mojibakeList.Count)"
if ($mojibakeList.Count -gt 0) {
    $mojibakeList | Format-Table -AutoSize
}

Write-Host "`n=================== FOOTER AUDIT ==================="
$htmlFiles = Get-ChildItem -Path . -Include *.html -Recurse | Where-Object { 
    $_.FullName -notmatch '\\node_modules\\' -and 
    $_.FullName -notmatch '\\\.git\\' -and
    $_.FullName -notmatch '\\scratch\\'
}

$footerIssues = @()
foreach ($hf in $htmlFiles) {
    $rel = $hf.FullName.Replace((Get-Location).Path + "\", "")
    $c = Get-Content $hf.FullName -Raw -Encoding UTF8

    $hasFooterTag = $c -match '<footer\b'
    $hasClosingFooter = $c -match '</footer>'
    $hasCopyright = $c -match '2026 Meera Associates' -or $c -match 'Meera Associates'
    $hasSocial = $c -match 'Instagram|YouTube|Facebook'
    $hasDisclaimers = $c -match 'Disclaimer|SEBI'
    
    # Check for emojis in footer
    $footerMatch = [regex]::Match($c, '(?s)<footer\b.*?</footer>')
    $footerEmojis = @()
    if ($footerMatch.Success) {
        $footerHtml = $footerMatch.Value
        # Find all emojis in footer
        $emojiMatches = [regex]::Matches($footerHtml, '[\x{1F300}-\x{1F9FF}\x{2600}-\x{26FF}\x{2700}-\x{27BF}]')
        foreach ($em in $emojiMatches) {
            $footerEmojis += $em.Value
        }
    }

    $footerIssues += [PSCustomObject]@{
        File = $rel
        FooterTag = ($hasFooterTag -and $hasClosingFooter)
        Copyright = $hasCopyright
        Social = $hasSocial
        Disclaimers = $hasDisclaimers
        FooterEmojiCount = $footerEmojis.Count
        SampleEmojis = ($footerEmojis | Select-Object -Unique) -join " "
    }
}

Write-Host "Total HTML files checked: $($htmlFiles.Count)"
$missingFooters = $footerIssues | Where-Object { -not $_.FooterTag }
Write-Host "Files missing proper <footer> tag: $($missingFooters.Count)"
if ($missingFooters.Count -gt 0) {
    $missingFooters | Format-Table -AutoSize
}

Write-Host "`nSummary of Footer Emoji Usage across all HTML files:"
$footerIssues | Select-Object -First 10 | Format-Table File, FooterTag, Copyright, Social, FooterEmojiCount, SampleEmojis -AutoSize
