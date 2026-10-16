# Comprehensive CSS booster for Hero, Company Table, Financials, and FAQs across 5 new scrips (and recent ones)
$utf8NoBom = New-Object System.Text.UTF8Encoding($false)

$scrips = @(
    @{ file = "scripts/ppfas/ppfas.css"; prefix = "ppfas" },
    @{ file = "scripts/frickindia/frickindia.css"; prefix = "frick" },
    @{ file = "scripts/sundayproptech/sundayproptech.css"; prefix = "sunday" },
    @{ file = "scripts/carrier/carrier.css"; prefix = "carrier" },
    @{ file = "scripts/cial/cial.css"; prefix = "cial" },
    @{ file = "scripts/motilaloswalhf/motilaloswalhf.css"; prefix = "mohf" },
    @{ file = "scripts/nayaraenergy/nayaraenergy.css"; prefix = "nayara" }
)

$commonAddon = @"

/* ==========================================================================
   HERO METRIC CARDS ENHANCEMENT
   ========================================================================== */
.__PREFIX__-metric-card,
.metric-card {
    background: rgba(255, 255, 255, 0.06);
    backdrop-filter: blur(10px);
    -webkit-backdrop-filter: blur(10px);
    border: 1px solid rgba(255, 255, 255, 0.14);
    border-radius: 14px;
    padding: 16px 18px;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    min-height: 104px;
    transition: transform 0.2s ease, border-color 0.2s ease, background 0.2s ease;
}

.__PREFIX__-metric-card:hover,
.metric-card:hover {
    transform: translateY(-2px);
    border-color: rgba(56, 189, 248, 0.5);
    background: rgba(255, 255, 255, 0.1);
}

.__PREFIX__-metric-label,
.metric-label {
    font-size: 0.72rem;
    font-weight: 700;
    color: #94a3b8;
    text-transform: uppercase;
    letter-spacing: 0.5px;
    margin-bottom: 6px;
    display: block;
}

.__PREFIX__-metric-value,
.__PREFIX__-metric-val,
.metric-val {
    font-size: 1.3rem;
    font-weight: 800;
    color: #ffffff;
    line-height: 1.2;
    margin-bottom: 4px;
}

.metric-val.highlight {
    color: #38bdf8;
}

.metric-val.status-active {
    color: #4ade80;
}

.__PREFIX__-metric-sub,
.metric-sub {
    font-size: 0.78rem;
    color: #7dd3fc;
    font-weight: 600;
    display: block;
}

/* ==========================================================================
   COMPANY DETAILS MASTER SPECIFICATION TABLE
   ========================================================================== */
.__PREFIX__-table-responsive {
    width: 100%;
    overflow-x: auto;
    -webkit-overflow-scrolling: touch;
}

.__PREFIX__-table {
    width: 100%;
    border-collapse: collapse;
}

.__PREFIX__-table tr {
    border-bottom: 1px solid #f1f5f9;
}

.__PREFIX__-table tr:last-child {
    border-bottom: none;
}

.__PREFIX__-table .td-label,
.__PREFIX__-table .spec-label {
    width: 35%;
    padding: 14px 18px;
    font-size: 0.88rem;
    font-weight: 700;
    color: #475569;
    background: #f8fafc;
    border-right: 1px solid #f1f5f9;
    vertical-align: middle;
}

.__PREFIX__-table .td-val,
.__PREFIX__-table .spec-value {
    padding: 14px 18px;
    font-size: 0.92rem;
    font-weight: 600;
    color: #0f172a;
    vertical-align: middle;
}

.depository-badge {
    display: inline-block;
    padding: 3px 10px;
    font-size: 0.78rem;
    font-weight: 700;
    color: #0284c7;
    background: #f0f9ff;
    border: 1px solid #bae6fd;
    border-radius: 6px;
    margin-right: 6px;
}

.depository-sub {
    font-size: 0.82rem;
    color: #64748b;
    margin-left: 4px;
}

/* ==========================================================================
   FINANCIAL PERFORMANCE KPIS & CHART CONTROLS
   ========================================================================== */
.fin-kpi-grid,
.fin-kpi-summary-grid {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 16px;
    margin-bottom: 24px;
}

.fin-kpi-card {
    background: #f8fafc;
    border: 1px solid #e2e8f0;
    border-radius: 12px;
    padding: 16px 18px;
    display: flex;
    flex-direction: column;
    gap: 6px;
    position: relative;
    overflow: hidden;
    transition: transform 0.2s ease, border-color 0.2s ease, box-shadow 0.2s ease;
}

.fin-kpi-card::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 4px;
    height: 100%;
    background: #0284c7;
}

.fin-kpi-card.kpi-revenue::before { background: #0284c7; }
.fin-kpi-card.kpi-ebitda::before  { background: #0d9488; }
.fin-kpi-card.kpi-pat::before     { background: #d97706; }
.fin-kpi-card.kpi-eps::before     { background: #7c3aed; }

.fin-kpi-card:hover {
    transform: translateY(-2px);
    border-color: #38bdf8;
    background: #ffffff;
    box-shadow: 0 4px 14px rgba(15, 23, 42, 0.06);
}

.fin-kpi-header,
.fin-kpi-top {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.fin-kpi-title,
.fin-kpi-name {
    font-size: 0.8rem;
    font-weight: 700;
    color: #64748b;
    text-transform: uppercase;
    letter-spacing: 0.04em;
}

.fin-kpi-badge {
    font-size: 0.72rem;
    font-weight: 700;
    color: #0284c7;
    background: #f0f9ff;
    border: 1px solid #bae6fd;
    padding: 2px 8px;
    border-radius: 999px;
}

.fin-kpi-val {
    font-size: 1.45rem;
    font-weight: 800;
    color: #0f172a;
    line-height: 1.2;
    letter-spacing: -0.02em;
}

.fin-kpi-sub {
    display: flex;
    align-items: center;
    gap: 6px;
    font-size: 0.76rem;
    color: #64748b;
    font-weight: 600;
}

.fin-pill-growth {
    display: inline-flex;
    align-items: center;
    padding: 2px 7px;
    border-radius: 12px;
    font-size: 0.74rem;
    font-weight: 700;
}

.fin-pill-growth.positive {
    background: #dcfce7;
    color: #15803d;
}

.fin-controls-bar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    flex-wrap: wrap;
    gap: 12px;
    padding: 12px 16px;
    background: #f8fafc;
    border: 1px solid #e2e8f0;
    border-radius: 10px;
    margin-bottom: 20px;
}

.fin-metric-tabs {
    display: flex;
    flex-wrap: wrap;
    gap: 6px;
}

.fin-metric-tab {
    background: #ffffff;
    border: 1px solid #cbd5e1;
    color: #475569;
    padding: 7px 14px;
    border-radius: 8px;
    font-size: 0.82rem;
    font-weight: 700;
    cursor: pointer;
    transition: all 0.2s ease;
    display: inline-flex;
    align-items: center;
    gap: 6px;
}

.fin-metric-tab:hover {
    background: #f1f5f9;
    color: #0f172a;
    border-color: #94a3b8;
}

.fin-metric-tab.active {
    background: #0284c7;
    color: #ffffff;
    border-color: #0284c7;
}

.fin-type-toggle {
    display: flex;
    gap: 4px;
}

.fin-type-btn {
    background: #ffffff;
    border: 1px solid #cbd5e1;
    color: #475569;
    padding: 6px 12px;
    border-radius: 6px;
    font-size: 0.78rem;
    font-weight: 700;
    cursor: pointer;
    transition: all 0.2s ease;
}

.fin-type-btn:hover {
    background: #f1f5f9;
    color: #0f172a;
}

.fin-type-btn.active {
    background: #0f172a;
    color: #ffffff;
    border-color: #0f172a;
}

.fin-chart-canvas-wrapper {
    position: relative;
    width: 100%;
    min-height: 380px;
}

/* ==========================================================================
   INTERACTIVE FAQS SECTION
   ========================================================================== */
.faq-accordion-container {
    width: 100%;
    display: flex;
    flex-direction: column;
    gap: 12px;
}

.faq-card {
    background: #ffffff;
    border: 1px solid #e2e8f0;
    border-radius: 12px;
    overflow: hidden;
    transition: all 0.2s ease;
}

.faq-card:hover {
    border-color: #bae6fd;
    box-shadow: 0 4px 14px rgba(2, 132, 199, 0.06);
}

.faq-card.active {
    border-color: #38bdf8;
    box-shadow: 0 6px 20px rgba(2, 132, 199, 0.1);
}

.faq-card-question {
    width: 100%;
    padding: 18px 20px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    background: transparent;
    border: none;
    cursor: pointer;
    text-align: left;
    gap: 16px;
}

.faq-question-content {
    display: flex;
    align-items: center;
    gap: 12px;
    flex: 1;
}

.faq-cat-tag {
    font-size: 0.72rem;
    font-weight: 800;
    text-transform: uppercase;
    letter-spacing: 0.04em;
    background: #f0f9ff;
    color: #0284c7;
    border: 1px solid #bae6fd;
    padding: 3px 10px;
    border-radius: 999px;
    white-space: nowrap;
}

.faq-q-text {
    font-size: 0.98rem;
    font-weight: 700;
    color: #0f172a;
    line-height: 1.45;
}

.faq-chevron-icon {
    width: 30px;
    height: 30px;
    border-radius: 50%;
    background: #f1f5f9;
    color: #64748b;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 0.82rem;
    transition: transform 0.25s ease, background 0.25s ease, color 0.25s ease;
    flex-shrink: 0;
}

.faq-card.active .faq-chevron-icon {
    background: #0284c7;
    color: #ffffff;
    transform: rotate(180deg);
}

.faq-card-answer {
    display: none;
    padding: 0 20px 20px 20px;
    font-size: 0.92rem;
    color: #475569;
    line-height: 1.65;
    border-top: 1px solid #f1f5f9;
    margin-top: 2px;
    padding-top: 14px;
}

.faq-card.active .faq-card-answer {
    display: block;
}

.faq-card-answer p {
    margin: 0;
}

/* Fallback for legacy .faq-accordion markup */
.faq-accordion {
    display: flex;
    flex-direction: column;
    gap: 12px;
}

.faq-item {
    background: #ffffff;
    border: 1px solid #e2e8f0;
    border-radius: 12px;
    overflow: hidden;
    transition: all 0.2s ease;
}

.faq-item:hover {
    border-color: #bae6fd;
    box-shadow: 0 4px 14px rgba(2, 132, 199, 0.06);
}

.faq-item.active {
    border-color: #38bdf8;
    box-shadow: 0 6px 20px rgba(2, 132, 199, 0.1);
}

.faq-question {
    padding: 18px 20px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    cursor: pointer;
    font-size: 0.98rem;
    font-weight: 700;
    color: #0f172a;
    gap: 16px;
}

.faq-arrow {
    width: 28px;
    height: 28px;
    border-radius: 50%;
    background: #f1f5f9;
    color: #64748b;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 0.82rem;
    transition: transform 0.25s ease, background 0.25s ease, color 0.25s ease;
    flex-shrink: 0;
}

.faq-item.active .faq-arrow {
    background: #0284c7;
    color: #ffffff;
    transform: rotate(180deg);
}

.faq-answer {
    display: none;
    padding: 0 20px 18px 20px;
    font-size: 0.92rem;
    color: #475569;
    line-height: 1.65;
    border-top: 1px solid #f1f5f9;
    padding-top: 14px;
}

.faq-item.active .faq-answer {
    display: block;
}

/* Responsive Rules for KPIs & Strip */
@media (max-width: 992px) {
    .__PREFIX__-metrics-strip {
        grid-template-columns: repeat(2, 1fr);
        gap: 12px;
    }
    .fin-kpi-grid,
    .fin-kpi-summary-grid {
        grid-template-columns: repeat(2, 1fr);
    }
}

@media (max-width: 576px) {
    .__PREFIX__-metrics-strip {
        grid-template-columns: 1fr;
    }
    .fin-kpi-grid,
    .fin-kpi-summary-grid {
        grid-template-columns: 1fr;
    }
    .__PREFIX__-table .td-label,
    .__PREFIX__-table .spec-label {
        width: 40%;
        font-size: 0.82rem;
        padding: 10px 12px;
    }
    .__PREFIX__-table .td-val,
    .__PREFIX__-table .spec-value {
        font-size: 0.85rem;
        padding: 10px 12px;
    }
    .faq-card-question {
        padding: 14px 16px;
    }
    .faq-q-text {
        font-size: 0.92rem;
    }
}
"@

foreach ($s in $scrips) {
    $filePath = (Resolve-Path $s.file).Path
    $css = [System.IO.File]::ReadAllText($filePath, [System.Text.Encoding]::UTF8)

    if (-not $css.Contains(".metric-card")) {
        $addon = $commonAddon -replace '__PREFIX__', $s.prefix
        $css = $css + "`n" + $addon
        [System.IO.File]::WriteAllText($filePath, $css, $utf8NoBom)
        Write-Host "Enriched: $($s.file)"
    } else {
        Write-Host "Already has metric-card: $($s.file)"
    }
}
