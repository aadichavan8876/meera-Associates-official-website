$allHtmlFiles = Get-ChildItem -Path . -Recurse -Filter "*.html" | Where-Object { $_.FullName -notmatch '\\scratch\\' }

Write-Output "Step 1: Removing Our Gallery footer links across all HTML files..."
$galleryRegex = '(?i)\s*<li><a href="(?:\.\./\.\./)?index\.html#gallery">Our Gallery</a></li>'
$galleryCount = 0

foreach ($f in $allHtmlFiles) {
    $content = [System.IO.File]::ReadAllText($f.FullName)
    if ($content -match $galleryRegex) {
        $newContent = [regex]::Replace($content, $galleryRegex, "")
        [System.IO.File]::WriteAllText($f.FullName, $newContent, [System.Text.Encoding]::UTF8)
        $galleryCount++
    }
}
Write-Output "Cleaned Our Gallery link from $galleryCount files."

Write-Output "`nStep 2: Removing extra filler cards from scrips..."

$scripFiles = Get-ChildItem -Path "scripts" -Recurse -Filter "*.html"

# List of regexes for extra filler cards
$cardPatterns = @(
    # Awards & Accolades
    '(?si)\s*<!--\s*Card\s*\d*:\s*(?:Awards|Accolades|Industry Recognitions)[^>]*-->\s*<div\s+class="[a-z0-9_-]+-card"[^>]*>.*?</div>\s*(?=\s*<!--\s*Card|\s*</div>\s*<!--\s*RIGHT|\s*</div>\s*<aside|\s*</aside)',
    # Upcoming Projects
    '(?si)\s*<!--\s*Card\s*\d*:\s*Upcoming[^>]*-->\s*<div\s+class="[a-z0-9_-]+-card"[^>]*>.*?</div>\s*(?=\s*<!--\s*Card|\s*</div>\s*<!--\s*RIGHT|\s*</div>\s*<aside|\s*</aside)',
    # News & Media
    '(?si)\s*<!--\s*Card\s*\d*:\s*(?:News|Recent Developments|Recent Strategic)[^>]*-->\s*<div\s+class="[a-z0-9_-]+-card"[^>]*>.*?</div>\s*(?=\s*<!--\s*Card|\s*</div>\s*<!--\s*RIGHT|\s*</div>\s*<aside|\s*</aside)',
    # Services of Company (Pharmed)
    '(?si)\s*<!--\s*Card\s*\d*:\s*Services of Company[^>]*-->\s*<div\s+class="[a-z0-9_-]+-card"[^>]*>.*?</div>\s*(?=\s*<!--\s*Card|\s*</div>\s*<!--\s*RIGHT|\s*</div>\s*<aside|\s*</aside)',
    # KEY HIGHLIGHTS (Sterlite Power)
    '(?si)\s*<!--\s*Card\s*\d*:\s*Key Highlights[^>]*-->\s*<div\s+class="[a-z0-9_-]+-card"[^>]*>.*?</div>\s*(?=\s*<!--\s*Card|\s*</div>\s*<!--\s*RIGHT|\s*</div>\s*<aside|\s*</aside)'
)

# 9 scrips with unverified old financials
$unverifiedFinScrips = @('anugrahavalve', 'goashipyard', 'greenzoenergy', 'nayaraenergy', 'pharmed', 'pxil', 'ritewater', 'sterlitegrid5', 'sterlitepower')

# Regex for financial card
$finCardPattern = '(?si)\s*<!--\s*Card\s*\d*:\s*(?:Financial Performance|Audited Financial Performance)[^>]*-->\s*<div\s+class="[a-z0-9_-]+-card(?:\s+fin-graph-card)?"[^>]*id="[^"]*fin-graph-container"[^>]*>.*?</div>\s*(?=\s*<!--\s*Card|\s*</div>\s*<!--\s*RIGHT|\s*</div>\s*<aside|\s*</aside)'

# Regex for Chart.js script and inline chart init
$chartScriptPattern = '(?si)\s*<!--\s*(?:Chart\.js|ChartJS).*?-->\s*<script\s+src="https://cdn\.jsdelivr\.net/npm/chart\.js"></script>\s*<script>.*?</script>'
$chartScriptPattern2 = '(?si)\s*<script\s+src="https://cdn\.jsdelivr\.net/npm/chart\.js"></script>\s*<script>.*?</script>'

foreach ($f in $scripFiles) {
    $scrip = $f.Directory.Name
    $content = [System.IO.File]::ReadAllText($f.FullName)
    $orig = $content
    
    # Remove filler cards
    foreach ($cp in $cardPatterns) {
        $content = [regex]::Replace($content, $cp, "")
    }
    
    # Remove unverified old financials
    if ($unverifiedFinScrips -contains $scrip) {
        $content = [regex]::Replace($content, $finCardPattern, "")
        $content = [regex]::Replace($content, $chartScriptPattern, "")
        $content = [regex]::Replace($content, $chartScriptPattern2, "")
    }
    
    if ($content.Length -ne $orig.Length) {
        [System.IO.File]::WriteAllText($f.FullName, $content, [System.Text.Encoding]::UTF8)
        Write-Output "Updated [$scrip]: reduced by $($orig.Length - $content.Length) chars."
    }
}

Write-Output "`nRunning integrity audit on all files..."
& "$PSScriptRoot\audit_all_integrity.ps1"
