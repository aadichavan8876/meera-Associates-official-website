$utf8NoBom = New-Object System.Text.UTF8Encoding($false)

# 1. Fix CSS files
$cssFiles = @(
    "scripts\orbisfinancial\orbisfinancial.css",
    "scripts\herofincorp\herofincorp.css",
    "scripts\csk\csk.css",
    "scripts\goodluckdefence\goodluckdefence.css",
    "scripts\kineco\kineco.css"
)

$targetCssMojibake = [char]0x00E2 + [char]0x0153 + [char]0x201C # âœ“
# Also try without the quote if different
foreach ($cf in $cssFiles) {
    $path = (Resolve-Path $cf).Path
    $content = [System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)
    
    # Replace content: 'âœ“'; or any variation with content: '\2713';
    $newContent = [regex]::Replace($content, "content:\s*['""][^'""]*[\x{00E2}\x{0153}\x{201C}]+[^'""]*['""]", "content: '\2713'")
    if ($newContent -ne $content) {
        [System.IO.File]::WriteAllText($path, $newContent, $utf8NoBom)
        Write-Host "Fixed CSS mojibake in $cf" -ForegroundColor Green
    } else {
        # Fallback string replace
        $lines = Get-Content $path -Encoding UTF8
        $modified = $false
        for ($i = 0; $i -lt $lines.Count; $i++) {
            if ($lines[$i] -match "content:\s*['""]") {
                if ($lines[$i] -match [char]0x00E2) {
                    $lines[$i] = "    content: '\2713';"
                    $modified = $true
                }
            }
        }
        if ($modified) {
            [System.IO.File]::WriteAllLines($path, $lines, $utf8NoBom)
            Write-Host "Fixed CSS mojibake (fallback) in $cf" -ForegroundColor Green
        } else {
            Write-Host "Could not find pattern in $cf" -ForegroundColor Red
        }
    }
}

# 2. Fix JS files
$jsFiles = @(
    "scripts\carrier\carrier.js",
    "scripts\cial\cial.js",
    "scripts\frickindia\frickindia.js",
    "scripts\ppfas\ppfas.js",
    "scripts\sundayproptech\sundayproptech.js"
)

foreach ($jf in $jsFiles) {
    $path = (Resolve-Path $jf).Path
    $lines = Get-Content $path -Encoding UTF8
    $modified = $false
    for ($i = 0; $i -lt $lines.Count; $i++) {
        if ($lines[$i] -match "Copied!['""]") {
            if ($lines[$i] -match [char]0x00E2) {
                # Replace with clean \u2705 Copied!
                $lines[$i] = [regex]::Replace($lines[$i], "['""][^'""]*Copied!['""]", "'\u2705 Copied!'")
                $modified = $true
            }
        }
    }
    if ($modified) {
        [System.IO.File]::WriteAllLines($path, $lines, $utf8NoBom)
        Write-Host "Fixed JS mojibake in $jf" -ForegroundColor Green
    } else {
        Write-Host "Could not find pattern in $jf" -ForegroundColor Red
    }
}
