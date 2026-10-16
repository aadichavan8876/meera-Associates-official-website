$utf8NoBom = New-Object System.Text.UTF8Encoding($false)

# 1. Update ppfas.html
$html = [System.IO.File]::ReadAllText('scripts/ppfas/ppfas.html', [System.Text.Encoding]::UTF8)

# Remove 4th metric card
$heroPattern = '(?s)(<div class="ppfas-metric-card">\s*<span class="ppfas-metric-label">.*?ISIN Depository Code</span>.*?</div>)\s*<div class="ppfas-metric-card">\s*<span class="ppfas-metric-label">.*?Sector Focus</span>.*?</div>\s*(</div>)'
if ($html -match $heroPattern) {
    $html = [regex]::Replace($html, $heroPattern, '$1' + "`r`n            " + '$2')
    Write-Host "PPFAS Hero strip 4th card removed successfully."
} else {
    Write-Host "Warning: Hero pattern did not match in PPFAS"
}

# Add Financial Card before Card 6: Annual Reports
$finCardHtml = @'
                    <!-- Card 6: Interactive Financial Trajectory (Visualizer Only - Zero Tables) -->
                    <div class="ppfas-card" id="ppfas-fin-graph-container">
                        <div class="ppfas-card-header">
                            <h2 class="ppfas-card-title">
                                <span class="ppfas-card-title-icon">&#128202;</span>
                                Audited Financial Performance &amp; Trajectory
                            </h2>
                            <span class="ppfas-card-tag">Interactive Analytics</span>
                        </div>

                        <!-- 4 High-Impact KPI Glance Cards -->
                        <div class="fin-kpi-summary-grid">
                            <div class="fin-kpi-card">
                                <div class="fin-kpi-header">
                                    <span class="fin-kpi-title">Revenue (FY25)</span>
                                    <span class="fin-kpi-badge">Audited</span>
                                </div>
                                <div class="fin-kpi-val">&#8377;336.02 Cr</div>
                                <div class="fin-kpi-sub">
                                    <span class="fin-pill-growth positive">Core Advisory</span>
                                    <span>FY 2024-25</span>
                                </div>
                            </div>

                            <div class="fin-kpi-card">
                                <div class="fin-kpi-header">
                                    <span class="fin-kpi-title">Operating EBITDA</span>
                                    <span class="fin-kpi-badge">Asset Scale</span>
                                </div>
                                <div class="fin-kpi-val">&#8377;1,214.90 L</div>
                                <div class="fin-kpi-sub">
                                    <span class="fin-pill-growth positive">&#8377;12.15 Cr</span>
                                    <span>Operating Earnings</span>
                                </div>
                            </div>

                            <div class="fin-kpi-card">
                                <div class="fin-kpi-header">
                                    <span class="fin-kpi-title">PAT (Net Profit)</span>
                                    <span class="fin-kpi-badge">After Tax</span>
                                </div>
                                <div class="fin-kpi-val">&#8377;3,426.20 L</div>
                                <div class="fin-kpi-sub">
                                    <span class="fin-pill-growth positive">+203.95% YoY</span>
                                    <span>&#8377;34.26 Cr Profit</span>
                                </div>
                            </div>

                            <div class="fin-kpi-card">
                                <div class="fin-kpi-header">
                                    <span class="fin-kpi-title">Diluted EPS</span>
                                    <span class="fin-kpi-badge">Per Share</span>
                                </div>
                                <div class="fin-kpi-val">&#8377;14.70</div>
                                <div class="fin-kpi-sub">
                                    <span class="fin-pill-growth positive">Per Equity Share</span>
                                    <span>FV &#8377;10/-</span>
                                </div>
                            </div>
                        </div>

                        <!-- Chart Controls Bar -->
                        <div class="fin-controls-bar">
                            <div class="fin-metric-tabs">
                                <button type="button" class="fin-metric-tab active" data-metric="all">&#128202; All Metrics</button>
                                <button type="button" class="fin-metric-tab" data-metric="revenue">&#128200; Revenue</button>
                                <button type="button" class="fin-metric-tab" data-metric="ebitda">&#9889; EBITDA</button>
                                <button type="button" class="fin-metric-tab" data-metric="pat">&#128176; PAT</button>
                                <button type="button" class="fin-metric-tab" data-metric="eps">&#127919; EPS</button>
                            </div>
                            <div class="fin-type-toggle">
                                <button type="button" class="fin-type-btn active" data-type="bar" title="Bar Chart View">&#128202; Bar</button>
                                <button type="button" class="fin-type-btn" data-type="line" title="Line Chart View">&#128200; Line</button>
                            </div>
                        </div>

                        <!-- Canvas Visualization Area -->
                        <div class="fin-chart-canvas-wrapper" style="margin-bottom: 0;">
                            <canvas id="ppfas-fin-canvas"></canvas>
                        </div>
                    </div>

                    <!-- Card 7: Annual Reports & Financial Disclosures -->
'@

$html = $html.Replace("<!-- Card 6: Annual Reports & Financial Disclosures -->", $finCardHtml)
$html = $html.Replace("<!-- Card 7: Frequently Asked Questions -->", "<!-- Card 8: Frequently Asked Questions -->")

# Add Chart dependencies scripts
$chartScripts = @'
    <!-- Financial Charts Dependencies -->
    <script src="../../assets/chart.min.js"></script>
    <script src="../../assets/financial-charts.js"></script>

    <!-- Dedicated Script for PPFAS -->
'@

$html = $html.Replace("<!-- Dedicated Script for PPFAS -->", $chartScripts)

[System.IO.File]::WriteAllText('scripts/ppfas/ppfas.html', $html, $utf8NoBom)
Write-Host "Updated ppfas.html successfully."

# 2. Update ppfas.js
$js = [System.IO.File]::ReadAllText('scripts/ppfas/ppfas.js', [System.Text.Encoding]::UTF8)
$chartJs = @'
document.addEventListener('DOMContentLoaded', () => {
    initIsinCopyFeature();
    initFaqAccordion();
    initPpfasFinancialChart();
});

/**
 * Initializes the Interactive Financial Performance Graph
 * Data source: Audited and reported financials for FY 2023-24 and FY 2024-25
 */
function initPpfasFinancialChart() {
    if (window.initFinancialChart) {
        window.initFinancialChart({
            containerId: 'ppfas-fin-graph-container',
            canvasId: 'ppfas-fin-canvas',
            years: ['FY 2023-24', 'FY 2024-25'],
            revenue: [479.00, 336.02],
            revenueRawLakhs: ['479.00', '336.02'],
            ebitda: [41.83, 12.15],
            ebitdaRaw: ['4,183.26', '1,214.90'],
            secondMetricLabel: 'EBITDA',
            secondMetricUnit: '\u20B9 Cr',
            pat: [11.27, 34.26],
            patRawLakhs: ['1,127.02', '3,426.20'],
            eps: [44.66, 14.70],
            revenueLabel: 'Revenue',
            theme: 'standard',
            title: 'Parag Parikh Financial Advisory Services Limited Financial Trajectory'
        });
    }
}
'@

$js = [regex]::Replace($js, '(?s)document\.addEventListener\(''DOMContentLoaded'',\s*\(\)\s*=>\s*\{.*?\}\);', $chartJs)
[System.IO.File]::WriteAllText('scripts/ppfas/ppfas.js', $js, $utf8NoBom)
Write-Host "Updated ppfas.js successfully."

# 3. Update ppfas.css
$css = [System.IO.File]::ReadAllText('scripts/ppfas/ppfas.css', [System.Text.Encoding]::UTF8)
$css = $css.Replace(".ppfas-metrics-strip {`r`n    display: grid;`r`n    grid-template-columns: repeat(4, 1fr);", ".ppfas-metrics-strip {`r`n    display: grid;`r`n    grid-template-columns: repeat(3, 1fr);")
$css = $css.Replace(".ppfas-metrics-strip {`n    display: grid;`n    grid-template-columns: repeat(4, 1fr);", ".ppfas-metrics-strip {`n    display: grid;`n    grid-template-columns: repeat(3, 1fr);")
[System.IO.File]::WriteAllText('scripts/ppfas/ppfas.css', $css, $utf8NoBom)
Write-Host "Updated ppfas.css successfully."
