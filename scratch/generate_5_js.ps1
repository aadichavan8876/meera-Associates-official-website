# Generate 5 Scrip JS Files with ISIN Copy & Chart Visualizer Hooks
$utf8NoBom = New-Object System.Text.UTF8Encoding($false)

# Helper template function
function Get-ScriptJsContent($compName, $isin, $chartFunctionCall = "") {
    $chartInit = ""
    if ($chartFunctionCall) {
        $chartInit = "    $chartFunctionCall;`n"
    }

    return @"
/**
 * $compName - Dedicated Page Script
 * Meera Associates Official Website
 */

document.addEventListener('DOMContentLoaded', () => {
    initIsinCopyFeature();
$chartInit});

/**
 * Copies the ISIN code to user clipboard and provides visual feedback
 * @param {string} isin - The ISIN code to copy (default: $isin)
 */
function copyIsinCode(isin = '$isin') {
    if (navigator.clipboard && window.isSecureContext) {
        navigator.clipboard.writeText(isin)
            .then(showCopiedState)
            .catch(err => {
                console.warn('Clipboard write failed, using fallback:', err);
                fallbackCopyText(isin);
            });
    } else {
        fallbackCopyText(isin);
    }
}

/**
 * Fallback copy method for non-HTTPS or legacy browsers
 * @param {string} text 
 */
function fallbackCopyText(text) {
    const textArea = document.createElement("textarea");
    textArea.value = text;
    textArea.style.position = "fixed";
    textArea.style.top = "0";
    textArea.style.left = "-999999px";
    textArea.setAttribute('readonly', '');
    document.body.appendChild(textArea);
    textArea.focus();
    textArea.select();
    
    try {
        const successful = document.execCommand('copy');
        if (successful) {
            showCopiedState();
        }
    } catch (err) {
        console.error('Fallback copy error:', err);
    } finally {
        document.body.removeChild(textArea);
    }
}

/**
 * Updates UI badge to show copy confirmation for 2 seconds
 */
function showCopiedState() {
    const statusEl = document.getElementById('copy-status-text');
    const badgeBtn = document.getElementById('copy-isin-btn');
    const tableStatus = document.getElementById('table-copy-status');
    const tableBtn = document.getElementById('table-copy-isin-btn');
    
    // Update Hero ISIN Badge
    if (statusEl) {
        const originalText = statusEl.innerHTML;
        statusEl.innerHTML = '✅ Copied!';
        statusEl.style.color = '#4ade80';
        if (badgeBtn) {
            badgeBtn.style.borderColor = '#22c55e';
            badgeBtn.style.backgroundColor = '#1e293b';
        }
        setTimeout(() => {
            statusEl.innerHTML = originalText;
            statusEl.style.color = '';
            if (badgeBtn) {
                badgeBtn.style.borderColor = '';
                badgeBtn.style.backgroundColor = '';
            }
        }, 2000);
    }

    // Update Table ISIN Badge
    if (tableStatus) {
        const originalTableText = tableStatus.innerHTML;
        tableStatus.innerHTML = '✅ Copied!';
        tableStatus.style.color = '#2563eb';
        if (tableBtn) {
            tableBtn.style.borderColor = '#2563eb';
        }
        setTimeout(() => {
            tableStatus.innerHTML = originalTableText;
            tableStatus.style.color = '';
            if (tableBtn) {
                tableBtn.style.borderColor = '';
            }
        }, 2000);
    }
}

/**
 * Attaches event listener to ISIN badge button
 */
function initIsinCopyFeature() {
    const badgeBtn = document.getElementById('copy-isin-btn');
    if (badgeBtn) {
        badgeBtn.addEventListener('click', () => {
            copyIsinCode('$isin');
        });
    }
    const tableBtn = document.getElementById('table-copy-isin-btn');
    if (tableBtn) {
        tableBtn.addEventListener('click', () => {
            copyIsinCode('$isin');
        });
    }
}
"@
}

# 1. PPFAS
$ppfasJs = Get-ScriptJsContent "Parag Parikh Financial Advisory Services Ltd (PPFAS)" "INE0FGC01012"
[System.IO.File]::WriteAllText((Join-Path (Get-Location).Path "scripts/ppfas/ppfas.js"), $ppfasJs, $utf8NoBom)
Write-Host "Generated: scripts/ppfas/ppfas.js"

# 2. Sunday Proptech
$sundayJs = Get-ScriptJsContent "Sunday Proptech Limited" "INE1DBV01024"
[System.IO.File]::WriteAllText((Join-Path (Get-Location).Path "scripts/sundayproptech/sundayproptech.js"), $sundayJs, $utf8NoBom)
Write-Host "Generated: scripts/sundayproptech/sundayproptech.js"

# 3. Carrier
$carrierJs = Get-ScriptJsContent "Carrier Airconditioning & Refrigeration Ltd" "INE040I01011"
[System.IO.File]::WriteAllText((Join-Path (Get-Location).Path "scripts/carrier/carrier.js"), $carrierJs, $utf8NoBom)
Write-Host "Generated: scripts/carrier/carrier.js"

# 4. Frick India (with Chart.js Visualizer)
$frickChartFunction = @"

/**
 * Initializes the Interactive Financial Performance Graph
 * Data source: Audited and reported financials for FY 2023-24, FY 2024-25, and FY 2025-26
 */
function initFrickFinancialChart() {
    if (window.initFinancialChart) {
        window.initFinancialChart({
            containerId: 'frick-fin-graph-container',
            canvasId: 'frick-fin-canvas',
            years: ['FY 2023-24', 'FY 2024-25', 'FY 2025-26'],
            revenue: [481.29, 447.62, 476.53],
            revenueRawLakhs: ['48,128.91', '44,762.00', '47,653.00'],
            ebitda: [52.93, 52.16, 35.27],
            ebitdaRaw: ['5,292.71', '5,216.00', '3,526.78'],
            secondMetricLabel: 'EBITDA',
            secondMetricUnit: '₹ Cr',
            pat: [42.32, 34.83, 20.22],
            patRawLakhs: ['4,232.35', '3,483.00', '2,022.00'],
            eps: [705.00, 58.06, 33.71],
            revenueLabel: 'Revenue',
            theme: 'standard',
            title: 'Frick India Limited Financial Trajectory'
        });
    }
}
"@
$frickJs = (Get-ScriptJsContent "Frick India Limited" "INE499C01012" "initFrickFinancialChart()") + $frickChartFunction
[System.IO.File]::WriteAllText((Join-Path (Get-Location).Path "scripts/frickindia/frickindia.js"), $frickJs, $utf8NoBom)
Write-Host "Generated: scripts/frickindia/frickindia.js"

# 5. CIAL (with Chart.js Visualizer)
$cialChartFunction = @"

/**
 * Initializes the Interactive Financial Performance Graph
 * Data source: Audited and reported financials for FY 2023-24, FY 2024-25, and FY 2025-26
 */
function initCialFinancialChart() {
    if (window.initFinancialChart) {
        window.initFinancialChart({
            containerId: 'cial-fin-graph-container',
            canvasId: 'cial-fin-canvas',
            years: ['FY 2023-24', 'FY 2024-25', 'FY 2025-26'],
            revenue: [1014.00, 1142.17, 1219.96],
            revenueRawLakhs: ['1,014.00', '1,142.17', '1,219.96'],
            ebitda: [822.07, 727.92, 845.34],
            ebitdaRaw: ['822.07', '727.92', '845.34'],
            secondMetricLabel: 'EBITDA',
            secondMetricUnit: '₹ Cr',
            pat: [412.58, 489.85, 502.21],
            patRawLakhs: ['412.58', '489.85', '502.21'],
            eps: [8.77, 10.24, 10.50],
            revenueLabel: 'Revenue',
            theme: 'standard',
            title: 'Cochin International Airport Limited (CIAL) Financial Trajectory'
        });
    }
}
"@
$cialJs = (Get-ScriptJsContent "Cochin International Airport Ltd (CIAL)" "INE02KH01019" "initCialFinancialChart()") + $cialChartFunction
[System.IO.File]::WriteAllText((Join-Path (Get-Location).Path "scripts/cial/cial.js"), $cialJs, $utf8NoBom)
Write-Host "Generated: scripts/cial/cial.js"
