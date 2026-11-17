$css = [System.IO.File]::ReadAllText("styles.css", [System.Text.Encoding]::UTF8)

# 1. Hero replacement with regex
$heroPattern = '(?s)/\*\s*={10,}\s*REALISTIC 3D LAPTOP RUNNING MEERA UNLISTED MARKET TERMINAL.*?\.screen-quad-overlay\s*\{.*?\n\}'
$heroMatch = [regex]::Match($css, $heroPattern)
if ($heroMatch.Success) {
    Write-Output "Found hero block in styles.css! Replacing..."
    $newHero = @'
/* ==========================================================================
   REALISTIC IPAD PRO RUNNING MEERA UNLISTED MARKET TERMINAL
   - Apple iPad Pro Frame (600x452)
   - Dual-Row Smooth Marquee Moving Unlisted Company Cards
   - Interactive Hover States & Clickable Scrip Links to Unlisted Shares Directory
   ========================================================================== */
.hero-media {
    position: relative;
    width: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 480px;
    box-sizing: border-box;
    overflow: visible;
}

.laptop-3d-scaler,
.ipad-scaler {
    position: relative;
    width: 600px;
    height: 452px;
    flex-shrink: 0;
    transform-origin: center center;
    transition: transform 0.3s cubic-bezier(0.16, 1, 0.3, 1);
}

.laptop-3d-base-img,
.ipad-base-img {
    position: absolute;
    top: 0;
    left: 0;
    width: 600px;
    height: 452px;
    display: block;
    pointer-events: none;
    z-index: 10;
    filter: drop-shadow(0 25px 50px rgba(0, 0, 0, 0.85)) drop-shadow(0 0 35px rgba(2, 132, 199, 0.22));
}

/* SCREEN OVERLAY LAYER (Fits directly inside iPad inner screen bezels) */
.screen-quad-overlay {
    position: absolute;
    top: 29px;
    left: 29px;
    width: 542px;
    height: 394px;
    transform-origin: center center;
    transform: none;
    background: #0a131e;
    background-image: 
        radial-gradient(circle at 50% 25%, rgba(2, 132, 199, 0.18) 0%, transparent 65%),
        radial-gradient(circle at 15% 85%, rgba(0, 240, 255, 0.08) 0%, transparent 50%),
        #060c14;
    overflow: hidden;
    display: flex;
    flex-direction: column;
    border-radius: 13px;
    box-shadow: inset 0 0 25px rgba(0, 0, 0, 0.9);
    z-index: 5;
    box-sizing: border-box;
}
'@
    $css = $css.Substring(0, $heroMatch.Index) + $newHero + $css.Substring($heroMatch.Index + $heroMatch.Length)
} else {
    Write-Output "Hero block not found with regex"
}

# 2. Responsive scaler replacement with regex
$respPattern = '(?s)/\*\s*RESPONSIVE SCALING FOR 3D LAPTOP & MOVING CARDS\s*\*/.*?@media \(max-width: 380px\)\s*\{.*?\.laptop-3d-scaler\s*\{.*?\}\s*\}'
$respMatch = [regex]::Match($css, $respPattern)
if ($respMatch.Success) {
    Write-Output "Found responsive scaler block! Replacing..."
    $newResp = @'
/* RESPONSIVE SCALING FOR IPAD PRO & MOVING CARDS */
@media (max-width: 1200px) {
    .hero-media {
        min-height: 440px;
    }
    .laptop-3d-scaler,
    .ipad-scaler {
        transform: scale(0.92);
    }
}

@media (max-width: 992px) {
    .hero-media {
        min-height: 385px;
    }
    .laptop-3d-scaler,
    .ipad-scaler {
        transform: scale(0.80);
    }
}

@media (max-width: 768px) {
    .hero-media {
        min-height: 325px;
        width: 100%;
        max-width: 100%;
        overflow: hidden;
    }
    .laptop-3d-scaler,
    .ipad-scaler {
        transform: scale(0.68);
    }
}

@media (max-width: 640px) {
    .hero-media {
        min-height: 275px;
        width: 100%;
        max-width: 100%;
        overflow: hidden;
    }
    .laptop-3d-scaler,
    .ipad-scaler {
        transform: scale(0.56);
    }
}

@media (max-width: 480px) {
    .hero-media {
        min-height: 240px;
        width: 100%;
        max-width: 100%;
        overflow: hidden;
    }
    .laptop-3d-scaler,
    .ipad-scaler {
        transform: scale(0.48);
    }
}

@media (max-width: 380px) {
    .hero-media {
        min-height: 210px;
        width: 100%;
        max-width: 100%;
        overflow: hidden;
    }
    .laptop-3d-scaler,
    .ipad-scaler {
        transform: scale(0.42);
    }
}
'@
    $css = $css.Substring(0, $respMatch.Index) + $newResp + $css.Substring($respMatch.Index + $respMatch.Length)
} else {
    Write-Output "Responsive block not found with regex"
}

# 3. Table Shading replacement with regex
$tablePattern = '(?s)\.milestone-table\s*\{.*?\.milestone-table tbody tr:hover\s*\{[^}]*\}'
$tableMatch = [regex]::Match($css, $tablePattern)
if ($tableMatch.Success) {
    Write-Output "Found milestone-table block! Replacing..."
    $newTable = @'
.milestone-table {
    width: 100%;
    border-collapse: collapse;
    text-align: left;
    font-size: 0.86rem;
    border: 1px solid #b0c3e6;
}

.milestone-table th {
    background: #c1cfeb;
    color: #0f172a;
    font-weight: 800;
    font-size: 0.75rem;
    padding: 16px 14px;
    letter-spacing: 0.04em;
    border: 1px solid #b0c3e6;
    border-bottom: 2px solid #97b0de;
    text-transform: uppercase;
}

.milestone-table td {
    padding: 14px 14px;
    border: 1px solid #c1cfeb;
    color: #0f172a;
    font-weight: 700;
    vertical-align: middle;
}

.milestone-table tbody tr {
    transition: background 0.15s ease;
}

/* Zebra shading from user image: alternating #D9E1F2 and #FFFFFF */
.milestone-table tbody tr:nth-child(odd),
table[class*="-table"] tr:nth-child(odd) {
    background-color: #d9e1f2;
}

.milestone-table tbody tr:nth-child(even),
table[class*="-table"] tr:nth-child(even) {
    background-color: #ffffff;
}

.milestone-table tbody tr:hover,
table[class*="-table"] tr:hover {
    background-color: #c6d4ee;
}
'@
    $css = $css.Substring(0, $tableMatch.Index) + $newTable + $css.Substring($tableMatch.Index + $tableMatch.Length)
} else {
    Write-Output "Milestone table block not found with regex"
}

[System.IO.File]::WriteAllText("styles.css", $css, [System.Text.Encoding]::UTF8)
Write-Output "Saved styles.css successfully"
