/**
 * National Commodity & Derivatives Exchange Limited (NCDEX) - Dedicated Page Script
 * Meera Associates Official Website
 */

document.addEventListener('DOMContentLoaded', () => {
    initIsinCopyFeature();
    initNcdexFinancialChart();
});

/**
 * Initializes the Interactive Financial Performance Graph
 * Data source: Audited and reported exchange financials for FY 2024-25 & FY 2025-26
 */
function initNcdexFinancialChart() {
    if (window.initFinancialChart) {
        window.initFinancialChart({
            containerId: 'ncdex-fin-graph-container',
            canvasId: 'ncdex-fin-canvas',
            years: ['FY 2024-25', 'FY 2025-26'],
            revenue: [2448.00, 2530.00],
            revenueRawLakhs: ['2,448.00', '2,530.00'],
            ebitda: [null, 1165.00],
            ebitdaRaw: ['NA', '1,165.00'],
            secondMetricLabel: 'EBITDA',
            secondMetricUnit: '₹ Cr',
            pat: [4624.00, 23609.00],
            patRawLakhs: ['4,624.00', '23,609.00'],
            eps: [51.87, 5.93],
            revenueLabel: 'Revenue',
            theme: 'standard',
            title: 'National Commodity & Derivatives Exchange Limited (NCDEX) Financial Trajectory'
        });
    }
}

/**
 * Copies the ISIN code to user clipboard and provides visual feedback
 * @param {string} isin - The ISIN code to copy (default: INE127G01010)
 */
function copyIsinCode(isin = 'INE127G01010') {
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
            statusEl.style.color = '#94a3b8';
            if (badgeBtn) {
                badgeBtn.style.borderColor = '#334155';
                badgeBtn.style.backgroundColor = '#0f172a';
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
            copyIsinCode('INE127G01010');
        });
    }
}
