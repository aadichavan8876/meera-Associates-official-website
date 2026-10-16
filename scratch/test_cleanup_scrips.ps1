$files = Get-ChildItem -Path "scripts" -Recurse -Filter "*.html"

$extraPatterns = @(
    '(?si)\s*<!--\s*Card\s*\d*:\s*(?:Awards|Accolades|Upcoming|News|Recent Strategic|Turnkey|Services of Company|KEY HIGHLIGHTS|Key Highlights)[^>]*-->\s*<div\s+class="[a-z0-9_-]+-card"[^>]*>.*?</div>\s*(?=\s*<!--\s*Card|\s*</div>\s*<!--\s*RIGHT|\s*</div>\s*<aside|\s*</aside)'
)

$unverifiedFinScrips = @('anugrahavalve', 'goashipyard', 'greenzoenergy', 'nayaraenergy', 'pharmed', 'pxil', 'ritewater', 'sterlitegrid5', 'sterlitepower')

foreach ($f in $files) {
    $scrip = $f.Directory.Name
    $content = [System.IO.File]::ReadAllText($f.FullName)
    $orig = $content
    
    # 1. Remove extra filler cards
    foreach ($p in $extraPatterns) {
        $content = [regex]::Replace($content, $p, "")
    }
    
    # 2. If it's one of the 9 unverified fin scrips, remove the fin card
    if ($unverifiedFinScrips -contains $scrip) {
        $finPattern = '(?si)\s*<!--\s*Card\s*\d*:\s*(?:Financial Performance|Audited Financial Performance)[^>]*-->\s*<div\s+class="[a-z0-9_-]+-card"[^>]*id="[^"]*-fin-graph-container"[^>]*>.*?</div>\s*(?=\s*<!--\s*Card|\s*</div>\s*<!--\s*RIGHT|\s*</div>\s*<aside|\s*</aside)'
        $content = [regex]::Replace($content, $finPattern, "")
        
        # Also remove Chart.js and chart init scripts
        $scriptPattern = '(?si)\s*<script\s+src="https://cdn\.jsdelivr\.net/npm/chart\.js"></script>\s*<script>.*?</script>'
        $content = [regex]::Replace($content, $scriptPattern, "")
    }
    
    # 3. Remove "Our Gallery" footer link
    $content = [regex]::Replace($content, '(?i)\s*<li><a href="(?:\.\./\.\./)?index\.html#gallery">Our Gallery</a></li>', "")
    
    if ($content.Length -ne $orig.Length) {
        Write-Output "[$scrip] Content changed by $($orig.Length - $content.Length) chars"
    }
}
