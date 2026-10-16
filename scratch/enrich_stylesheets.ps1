# Enrich 10 Scrip Stylesheets with complete layout, moats, compliance, peers, and responsive rules
$utf8NoBom = New-Object System.Text.UTF8Encoding($false)

$scrips = @(
    @{ file = "scripts/nerl/nerl.css"; prefix = "nerl" },
    @{ file = "scripts/nayaraenergy/nayaraenergy.css"; prefix = "nayara" },
    @{ file = "scripts/oyo/oyo.css"; prefix = "oyo" },
    @{ file = "scripts/hdfcsecurities/hdfcsecurities.css"; prefix = "hdfcsec" },
    @{ file = "scripts/motilaloswalhf/motilaloswalhf.css"; prefix = "mohf" },
    @{ file = "scripts/ppfas/ppfas.css"; prefix = "ppfas" },
    @{ file = "scripts/frickindia/frickindia.css"; prefix = "frick" },
    @{ file = "scripts/sundayproptech/sundayproptech.css"; prefix = "sunday" },
    @{ file = "scripts/carrier/carrier.css"; prefix = "carrier" },
    @{ file = "scripts/cial/cial.css"; prefix = "cial" }
)

$template = @"

/* ==========================================================================
   COMPLETE ASYMMETRIC GRID & TWO-COLUMN VIEWPORT LAYOUT
   ========================================================================== */
.__PREFIX__-main-grid {
    max-width: 1240px;
    margin: 36px auto 0;
    padding: 0 24px;
    display: grid;
    grid-template-columns: 1fr 340px;
    gap: 32px;
    align-items: start;
}

.__PREFIX__-content-col,
.__PREFIX__-main-col {
    min-width: 0;
    width: 100%;
}

.__PREFIX__-sidebar,
.__PREFIX__-sidebar-col {
    position: sticky;
    top: 100px;
    display: flex;
    flex-direction: column;
    gap: 24px;
    min-width: 0;
    width: 100%;
}

/* ==========================================================================
   STRATEGIC MOATS & COMPETITIVE ADVANTAGES GRID (2-COLUMN)
   ========================================================================== */
.moats-grid {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 16px;
}

.moat-card {
    background: #f8fafc;
    border: 1px solid #e2e8f0;
    border-radius: 12px;
    padding: 20px 18px;
    display: flex;
    flex-direction: column;
    gap: 8px;
    transition: transform 0.2s ease, border-color 0.2s ease, background 0.2s ease, box-shadow 0.2s ease;
}

.moat-card:hover {
    background: #ffffff;
    border-color: #0284c7;
    transform: translateY(-2px);
    box-shadow: 0 6px 16px rgba(2, 132, 199, 0.08);
}

.moat-icon {
    font-size: 1.5rem;
    line-height: 1;
    margin-bottom: 4px;
}

.moat-title {
    font-size: 0.98rem;
    font-weight: 800;
    color: #0f172a;
    margin: 0;
}

.moat-desc {
    font-size: 0.86rem;
    color: #475569;
    line-height: 1.55;
    margin: 0;
}

/* ==========================================================================
   SIDEBAR COMPLIANCE & SECTOR PEERS CARDS
   ========================================================================== */
.sidebar-compliance-card,
.sidebar-peers-card {
    background: #ffffff;
    border: 1px solid #e2e8f0;
    border-radius: 16px;
    padding: 24px;
    box-shadow: 0 4px 16px -2px rgba(15, 23, 42, 0.05);
}

.compliance-head,
.peers-head {
    display: flex;
    align-items: center;
    gap: 10px;
    margin-bottom: 16px;
    padding-bottom: 12px;
    border-bottom: 1px solid #e2e8f0;
}

.compliance-icon,
.peers-icon {
    font-size: 1.2rem;
    line-height: 1;
}

.compliance-title,
.peers-title {
    font-size: 0.98rem;
    font-weight: 800;
    color: #0f172a;
    margin: 0;
}

.compliance-list {
    list-style: none;
    padding: 0;
    margin: 0;
    display: flex;
    flex-direction: column;
    gap: 10px;
}

.compliance-list li {
    display: flex;
    justify-content: space-between;
    align-items: center;
    font-size: 0.84rem;
    padding-bottom: 8px;
    border-bottom: 1px dashed #f1f5f9;
}

.compliance-list li:last-child {
    border-bottom: none;
    padding-bottom: 0;
}

.comp-label {
    color: #64748b;
    font-weight: 600;
}

.comp-val {
    color: #0f172a;
    font-weight: 700;
}

.peers-links {
    display: flex;
    flex-direction: column;
    gap: 8px;
}

.peer-link-item {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 10px 14px;
    background: #f8fafc;
    border: 1px solid #e2e8f0;
    border-radius: 8px;
    text-decoration: none;
    transition: all 0.2s ease;
}

.peer-link-item:hover {
    background: #f0f9ff;
    border-color: #bae6fd;
    transform: translateX(3px);
}

.peer-name {
    font-size: 0.85rem;
    font-weight: 700;
    color: #0f172a;
}

.peer-arrow {
    color: #0284c7;
    font-weight: 700;
}

/* Responsive Grid Breakpoints */
@media (max-width: 1024px) {
    .__PREFIX__-main-grid {
        grid-template-columns: 1fr;
        gap: 24px;
        margin-top: 24px;
    }
    .__PREFIX__-sidebar,
    .__PREFIX__-sidebar-col {
        position: static;
        width: 100%;
    }
}

@media (max-width: 640px) {
    .moats-grid {
        grid-template-columns: 1fr;
    }
}
"@

foreach ($s in $scrips) {
    $filePath = (Resolve-Path $s.file).Path
    $css = [System.IO.File]::ReadAllText($filePath, [System.Text.Encoding]::UTF8)

    # Check if moats-grid is already present
    if (-not $css.Contains(".moats-grid")) {
        $addon = $template -replace '__PREFIX__', $s.prefix
        $css = $css + "`n" + $addon
        [System.IO.File]::WriteAllText($filePath, $css, $utf8NoBom)
        Write-Host "Enriched: $($s.file)"
    } else {
        Write-Host "Already has moats-grid: $($s.file)"
    }
}
