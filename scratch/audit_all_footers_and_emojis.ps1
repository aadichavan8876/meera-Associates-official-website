# Audit all HTML files for footer consistency and emoji integrity
$rootHtml = Get-ChildItem -Path . -Filter "*.html" -File
$scripHtml = Get-ChildItem -Path "scripts" -Filter "*.html" -Recurse

$allHtml = @($rootHtml) + @($scripHtml)

Write-Host "Total HTML files to inspect: $($allHtml.Count)"
Write-Host "  - Root pages: $($rootHtml.Count)"
Write-Host "  - Scrip profile pages: $($scripHtml.Count)"

$footerIssues = @()
$emojiIssues = @()

# Unicode code points for expected emojis
# 📅 = \uD83D\uDCC5
# 💰 = \uD83D\uDCB0
# 📋 = \uD83D\uDCCB
# 🏢 = \uD83C\uDFE2
# ⚡ = \u26A1
# 👥 = \uD83D\uDC65
# 📍 = \uD83D\uDCCD
# 📞 = \uD83D\uDCDE
# ☎️ = \u260E\uFE0F
# ✉️ = \u2709\uFE0F

$repChar = [char]0xFFFD

foreach ($file in $allHtml) {
    $rel = $file.FullName.Replace((Get-Location).Path + "\", "")
    $c = Get-Content $file.FullName -Raw -Encoding UTF8
    $isScrip = $file.Directory.Name -ne (Get-Item .).Name

    # 1. Check footer elements
    $hasFooter = $c.Contains('<footer class="footer">') -and $c.Contains('</footer>')
    $hasBrand = $c.Contains('class="footer-brand"')
    $hasQuickLinks = $c.Contains('Quick Links')
    $hasCoreServices = $c.Contains('Core Services') -or $c.Contains('Core Financial Solutions')
    $hasContactCol = $c.Contains('footer-contact-col') -or $c.Contains('Direct Investor Desk')
    $hasDisclaimer = $c.Contains('footer-disclaimer') -or $c.Contains('Regulatory Notice')
    $hasCopyright = $c.Contains('2026 Meera Associates. All Rights Reserved. Spearheaded by JasbirSingh Dhawda.')
    $hasSocial = $c.Contains('footer-social-wrap') -or $c.Contains('footer-social-btn')
    
    # 2. Check path correctness in footer links
    $footerMatch = [regex]::Match($c, '(?s)<footer\b.*?</footer>')
    $brokenFooterLinks = @()
    if ($footerMatch.Success) {
        $fHtml = $footerMatch.Value
        $linkMatches = [regex]::Matches($fHtml, 'href="([^"#:]+\.html)(?:#[^"]*)?"')
        foreach ($lm in $linkMatches) {
            $href = $lm.Groups[1].Value
            $targetPath = Join-Path $file.DirectoryName $href
            if (-not (Test-Path $targetPath)) {
                $brokenFooterLinks += "$href (not found at $targetPath)"
            }
        }
    }

    if (-not ($hasFooter -and $hasBrand -and $hasQuickLinks -and $hasCoreServices -and $hasContactCol -and $hasDisclaimer -and $hasCopyright)) {
        $footerIssues += [PSCustomObject]@{
            File = $rel
            HasFooter = $hasFooter
            HasBrand = $hasBrand
            HasQuickLinks = $hasQuickLinks
            HasCoreServices = $hasCoreServices
            HasContactCol = $hasContactCol
            HasDisclaimer = $hasDisclaimer
            HasCopyright = $hasCopyright
            BrokenLinks = ($brokenFooterLinks -join '; ')
        }
    }

    # 3. Check for replacement character (corrupted unicode)
    if ($c.Contains($repChar)) {
        $emojiIssues += [PSCustomObject]@{
            File = $rel
            Issue = "Contains Unicode Replacement Character (0xFFFD)"
        }
    }

    # 4. Check for double-encoded UTF8 / mojibake signatures
    $c1 = [char]0x00C3 + [char]0x00A2 # a^
    $c2 = [char]0x00F0 + [char]0x0178 # mojibake emoji prefix
    if ($c.Contains($c1) -or $c.Contains($c2)) {
        $emojiIssues += [PSCustomObject]@{
            File = $rel
            Issue = "Potential mojibake sequence found"
        }
    }
}

Write-Host "`n=================== FOOTER AUDIT RESULTS ==================="
Write-Host "Files with footer structural issues: $($footerIssues.Count)"
if ($footerIssues.Count -gt 0) {
    $footerIssues | Format-Table -AutoSize
} else {
    Write-Host "All $($allHtml.Count) HTML files have complete, compliant 4-column footers with disclaimers and copyright!" -ForegroundColor Green
}

Write-Host "`n=================== EMOJI & ENCODING RESULTS ==================="
Write-Host "Files with emoji/encoding issues: $($emojiIssues.Count)"
if ($emojiIssues.Count -gt 0) {
    $emojiIssues | Format-Table -AutoSize
} else {
    Write-Host "All $($allHtml.Count) HTML files have zero replacement characters and zero mojibake!" -ForegroundColor Green
}
