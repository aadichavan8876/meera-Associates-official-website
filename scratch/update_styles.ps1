$css = [System.IO.File]::ReadAllText("styles.css", [System.Text.Encoding]::UTF8)

# 1. Replace Hero Laptop styles with iPad styles
$oldHero = @'
/* ==========================================================================
   REALISTIC 3D LAPTOP RUNNING MEERA UNLISTED MARKET TERMINAL
   - 3D Perspective Screen Projection onto Real Asus Laptop Frame (570x388)
   - Dual-Row Smooth Marquee Moving Unlisted Company Cards
   - Interactive Hover States & Clickable Scrip Links to Unlisted Shares Directory
   ========================================================================== */
.hero-media {
    position: relative;
    width: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 420px;
    box-sizing: border-box;
    overflow: visible;
}

.laptop-3d-scaler {
    position: relative;
    width: 570px;
    height: 387px;
    flex-shrink: 0;
    transform-origin: center center;
    transition: transform 0.3s cubic-bezier(0.16, 1, 0.3, 1);
}

.laptop-3d-base-img {
    position: absolute;
    top: 0;
    left: 0;
    width: 570px;
    height: 387px;
    display: block;
    pointer-events: none;
    z-index: 1;
    filter: drop-shadow(0 25px 50px rgba(0, 0, 0, 0.85)) drop-shadow(0 0 35px rgba(2, 132, 199, 0.18));
}

/* 3D PERSPECTIVE SCREEN PROJECTION LAYER (Hugs laptop inner screen bezel) */
.screen-quad-overlay {
    position: absolute;
    top: 0;
    left: 0;
    width: 600px;
    height: 440px;
    transform-origin: 0 0;
    transform: matrix3d(0.578635, -0.030634, 0, 0.00023553, 0.096691, 0.565984, 0, 0.00000289, 0, 0, 1, 0, 15.09, 32.41, 0, 1);
    background: #0a131e;
    background-image: 
        radial-gradient(circle at 50% 25%, rgba(2, 132, 199, 0.18) 0%, transparent 65%),
        radial-gradient(circle at 15% 85%, rgba(0, 240, 255, 0.08) 0%, transparent 50%),
        #060c14;
    overflow: hidden;
    display: flex;
    flex-direction: column;
    border-radius: 4px;
    box-shadow: inset 0 0 25px rgba(0, 0, 0, 0.9);
    z-index: 5;
    box-sizing: border-box;
}
'@

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

$css = $css.Replace($oldHero.Trim(), $newHero.Trim())

# 2. Update Responsive Scaler
$oldResp = @'
/* RESPONSIVE SCALING FOR 3D LAPTOP & MOVING CARDS */
@media (max-width: 1200px) {
    .hero-media {
        min-height: 380px;
    }
    .laptop-3d-scaler {
        transform: scale(0.92);
    }
}

@media (max-width: 992px) {
    .hero-media {
        min-height: 340px;
    }
    .laptop-3d-scaler {
        transform: scale(0.80);
    }
}

@media (max-width: 768px) {
    .hero-media {
        min-height: 275px;
        width: 100%;
        max-width: 100%;
        overflow: hidden;
    }
    .laptop-3d-scaler {
        transform: scale(0.68);
    }
}

@media (max-width: 640px) {
    .hero-media {
        min-height: 240px;
        width: 100%;
        max-width: 100%;
        overflow: hidden;
    }
    .laptop-3d-scaler {
        transform: scale(0.56);
    }
}

@media (max-width: 480px) {
    .hero-media {
        min-height: 205px;
        width: 100%;
        max-width: 100%;
        overflow: hidden;
    }
    .laptop-3d-scaler {
        transform: scale(0.48);
    }
}

@media (max-width: 380px) {
    .hero-media {
        min-height: 180px;
        width: 100%;
        max-width: 100%;
        overflow: hidden;
    }
    .laptop-3d-scaler {
        transform: scale(0.42);
    }
}
'@

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

$css = $css.Replace($oldResp.Trim(), $newResp.Trim())

# 3. Update Table Shading (.milestone-table and all tables like image #D9E1F2 and #FFFFFF)
$oldTable = @'
.milestone-table {
    width: 100%;
    border-collapse: collapse;
    text-align: left;
    font-size: 0.86rem;
}

.milestone-table th {
    background: #f1f5f9;
    color: var(--text-main);
    font-weight: 800;
    font-size: 0.75rem;
    padding: 16px 14px;
    letter-spacing: 0.04em;
    border-bottom: 2px solid #cbd5e1;
    text-transform: uppercase;
}

.milestone-table td {
    padding: 14px 14px;
    border-bottom: 1px solid var(--border-color);
    color: var(--text-main);
    font-weight: 700;
    vertical-align: middle;
}

.milestone-table tbody tr {
    transition: background 0.2s ease;
}

.milestone-table tbody tr:hover {
    background: #f8fafc;
}
'@

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

$css = $css.Replace($oldTable.Trim(), $newTable.Trim())

# 4. Add styling for disclaimer note block
$disclaimerNoteCSS = @'
/* Disclaimer Highlight Callout Block */
.disclaimer-note-block {
    background: #f0f7ff;
    border-left: 4px solid #0284c7;
    border-radius: 6px;
    padding: 12px 16px;
    margin-top: 14px;
}

.disclaimer-note-block p {
    font-size: 0.88rem !important;
    color: #0369a1 !important;
    line-height: 1.55 !important;
    margin: 0 !important;
    font-weight: 600 !important;
}

.footer-disclaimer-note {
    margin-top: 10px;
    padding: 10px 14px;
    background: rgba(2, 132, 199, 0.08);
    border-left: 3px solid #0284c7;
    border-radius: 6px;
    color: #94a3b8;
    font-size: 0.8rem;
    line-height: 1.5;
}
'@

if (-not $css.Contains(".disclaimer-note-block")) {
    $css += "`r`n`r`n" + $disclaimerNoteCSS
}

[System.IO.File]::WriteAllText("styles.css", $css, [System.Text.Encoding]::UTF8)
Write-Output "Successfully updated styles.css"
