# Fix HTML grid wrappers for the 5 newest scrips to match .[prefix]-main-grid and .[prefix]-content-col
$utf8NoBom = New-Object System.Text.UTF8Encoding($false)

$configs = @(
    @{ file = "scripts/ppfas/ppfas.html"; prefix = "ppfas" },
    @{ file = "scripts/frickindia/frickindia.html"; prefix = "frick" },
    @{ file = "scripts/sundayproptech/sundayproptech.html"; prefix = "sunday" },
    @{ file = "scripts/carrier/carrier.html"; prefix = "carrier" },
    @{ file = "scripts/cial/cial.html"; prefix = "cial" }
)

foreach ($c in $configs) {
    $p = $c.prefix
    $path = (Resolve-Path $c.file).Path
    $html = [System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)

    # Replace top opening
    $targetTop = @"
    <!-- 3. MAIN CONTENT BODY (2-COLUMN GRID) -->
    <main class="$p-page-wrap">
        <div class="$p-body-container">
            <div class="$p-content-grid">
                
                <!-- LEFT COLUMN: Main Specifications & Corporate Details -->
                <div class="$p-main-col">
"@

    $replacementTop = @"
    <!-- 3. MAIN CONTENT BODY (2-COLUMN GRID) -->
    <main class="$p-page-wrap">
        <div class="$p-main-grid">
            
            <!-- LEFT COLUMN: Main Specifications & Corporate Details -->
            <div class="$p-content-col">
"@

    # Normalize CRLF
    $targetTopNorm = $targetTop -replace "`r`n", "`n"
    $replacementTopNorm = $replacementTop -replace "`r`n", "`n"
    $htmlNorm = $html -replace "`r`n", "`n"

    if ($htmlNorm.Contains($targetTopNorm)) {
        $htmlNorm = $htmlNorm.Replace($targetTopNorm, $replacementTopNorm)
        Write-Host "Replaced top grid in $($c.file)"
    } else {
        Write-Host "Top grid pattern not found in $($c.file)" -ForegroundColor Yellow
    }

    # Replace bottom closing (before </main>)
    # Look for closing of sidebar-col followed by 2 extra closing divs before </main>
    $targetBottomRegex = @"
(?s)(\s*</div>\s*<!--\s*4\.\s*Sector Peer Equities\s*-->.*?</aside>|</div>\s*</div>\s*</div>\s*</main>)
"@

    # Let's do exact pattern matching for bottom
    $oldBottom = @"
                </div>

            </div>
        </div>
    </main>
"@ -replace "`r`n", "`n"

    $newBottom = @"
                </div>

            </div>
    </main>
"@ -replace "`r`n", "`n"

    if ($htmlNorm.Contains($oldBottom)) {
        $htmlNorm = $htmlNorm.Replace($oldBottom, $newBottom)
        Write-Host "Replaced bottom closing in $($c.file)"
    } else {
        Write-Host "Bottom pattern not found in $($c.file)" -ForegroundColor Yellow
    }

    # Convert back to CRLF
    $finalHtml = $htmlNorm -replace "`n", "`r`n"
    [System.IO.File]::WriteAllText($path, $finalHtml, $utf8NoBom)
}
