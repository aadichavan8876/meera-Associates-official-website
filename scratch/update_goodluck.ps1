$utf8NoBom = New-Object System.Text.UTF8Encoding($false)

# 1. Update goodluckdefence.html
$html = [System.IO.File]::ReadAllText('scripts/goodluckdefence/goodluckdefence.html', [System.Text.Encoding]::UTF8)

# Remove 4th metric card
$heroPattern = '(?s)(<div class="goodluck-metric-card">\s*<span class="goodluck-metric-label">.*?ISIN Depository Code</span>.*?</div>)\s*<div class="goodluck-metric-card">\s*<span class="goodluck-metric-label">.*?Manufacturing Edge</span>.*?</div>\s*(</div>)'
if ($html -match $heroPattern) {
    $html = [regex]::Replace($html, $heroPattern, '$1' + "`r`n            " + '$2')
    Write-Host "Goodluck Hero strip 4th card removed successfully."
} else {
    Write-Host "Warning: Hero pattern did not match in Goodluck"
}

# Add Financial Card before Card 5: Annual Reports
$finCardHtml = @'
                    <!-- Card 5: Interactive Financial Trajectory (Visualizer Only - Zero Tables) -->
                    <div class="goodluck-card" id="goodluck-fin-graph-container">
                        <div class="goodluck-card-header">
                            <h2 class="goodluck-card-title">
                                <span class="goodluck-card-title-icon">&#128202;</span>
                                Audited Financial Performance &amp; Trajectory
                            </h2>
                            <span class="goodluck-card-tag">Interactive Analytics</span>
                        </div>

                        <!-- 4 High-Impact KPI Glance Cards -->
                        <div class="fin-kpi-summary-grid">
                            <div class="fin-kpi-card">
                                <div class="fin-kpi-header">
                                    <span class="fin-kpi-title">Revenue (FY25)</span>
                                    <span class="fin-kpi-badge">Audited</span>
                                </div>
                                <div class="fin-kpi-val">&#8377;3,535 L</div>
                                <div class="fin-kpi-sub">
                                    <span class="fin-pill-growth positive">&#8377;35.35 Cr</span>
                                    <span>FY 2024-25</span>
                                </div>
                            </div>

                            <div class="fin-kpi-card">
                                <div class="fin-kpi-header">
                                    <span class="fin-kpi-title">Operating EBITDA</span>
                                    <span class="fin-kpi-badge">Defense Scale</span>
                                </div>
                                <div class="fin-kpi-val">&#8377;216 L</div>
                                <div class="fin-kpi-sub">
                                    <span class="fin-pill-growth positive">+20.00% YoY</span>
                                    <span>&#8377;2.16 Cr EBITDA</span>
                                </div>
                            </div>

                            <div class="fin-kpi-card">
                                <div class="fin-kpi-header">
                                    <span class="fin-kpi-title">PAT (Net Profit)</span>
                                    <span class="fin-kpi-badge">After Tax</span>
                                </div>
                                <div class="fin-kpi-val">&#8377;131 L</div>
                                <div class="fin-kpi-sub">
                                    <span class="fin-pill-growth positive">&#8377;1.31 Cr</span>
                                    <span>Net Profit After Tax</span>
                                </div>
                            </div>

                            <div class="fin-kpi-card">
                                <div class="fin-kpi-header">
                                    <span class="fin-kpi-title">Diluted EPS</span>
                                    <span class="fin-kpi-badge">Per Share</span>
                                </div>
                                <div class="fin-kpi-val">&#8377;45.92</div>
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
                            <canvas id="goodluck-fin-canvas"></canvas>
                        </div>
                    </div>

                    <!-- Card 6: Annual Reports & Statutory Disclosures -->
'@

$html = $html.Replace("<!-- Card 5: Annual Reports & Statutory Disclosures -->", $finCardHtml)
$html = $html.Replace("<!-- Card 6: Frequently Asked Questions -->", "<!-- Card 7: Frequently Asked Questions -->")

# Add Chart dependencies scripts
$chartScripts = @'
    <!-- Financial Charts Dependencies -->
    <script src="../../assets/chart.min.js"></script>
    <script src="../../assets/financial-charts.js"></script>

    <!-- Dedicated Script for Goodluck Defence -->
'@

$html = $html.Replace("<!-- Dedicated Script for Goodluck Defence -->", $chartScripts)

[System.IO.File]::WriteAllText('scripts/goodluckdefence/goodluckdefence.html', $html, $utf8NoBom)
Write-Host "Updated goodluckdefence.html successfully."

# 2. Update goodluckdefence.js
$js = [System.IO.File]::ReadAllText('scripts/goodluckdefence/goodluckdefence.js', [System.Text.Encoding]::UTF8)
$chartJs = @'
document.addEventListener('DOMContentLoaded', () => {
    initIsinCopyFeature();
    initFaqAccordion();
    initGoodluckFinancialChart();
});

/**
 * Initializes the Interactive Financial Performance Graph
 * Data source: Audited and reported financials for FY 2023-24 and FY 2024-25
 */
function initGoodluckFinancialChart() {
    if (window.initFinancialChart) {
        window.initFinancialChart({
            containerId: 'goodluck-fin-graph-container',
            canvasId: 'goodluck-fin-canvas',
            years: ['FY 2023-24', 'FY 2024-25'],
            revenue: [39.66, 35.35],
            revenueRawLakhs: ['3,966', '3,535'],
            ebitda: [1.80, 2.16],
            ebitdaRaw: ['180', '216'],
            secondMetricLabel: 'EBITDA',
            secondMetricUnit: '\u20B9 Cr',
            pat: [1.62, 1.31],
            patRawLakhs: ['162', '131'],
            eps: [49.71, 45.92],
            revenueLabel: 'Revenue',
            theme: 'standard',
            title: 'Goodluck Defence and Aerospace Limited Financial Trajectory'
        });
    }
}
'@

$js = [regex]::Replace($js, '(?s)document\.addEventListener\(''DOMContentLoaded'',\s*\(\)\s*=>\s*\{.*?\}\);', $chartJs)
[System.IO.File]::WriteAllText('scripts/goodluckdefence/goodluckdefence.js', $js, $utf8NoBom)
Write-Host "Updated goodluckdefence.js successfully."

# 3. Update goodluckdefence.css
$css = [System.IO.File]::ReadAllText('scripts/goodluckdefence/goodluckdefence.css', [System.Text.Encoding]::UTF8)
$css = $css.Replace(".goodluck-metrics-strip {`r`n    display: grid;`r`n    grid-template-columns: repeat(4, 1fr);", ".goodluck-metrics-strip {`r`n    display: grid;`r`n    grid-template-columns: repeat(3, 1fr);")
$css = $css.Replace(".goodluck-metrics-strip {`n    display: grid;`n    grid-template-columns: repeat(4, 1fr);", ".goodluck-metrics-strip {`n    display: grid;`n    grid-template-columns: repeat(3, 1fr);")
[System.IO.File]::WriteAllText('scripts/goodluckdefence/goodluckdefence.css', $css, $utf8NoBom)
Write-Host "Updated goodluckdefence.css successfully."
