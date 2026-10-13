/**
 * Power Exchange India Limited (PXIL) - Dedicated Page Script
 * Meera Associates Official Website
 */

document.addEventListener('DOMContentLoaded', () => {
    initIsinCopyFeature();
    initPxilFinancialChart();
});

/**
 * Initializes the Interactive Financial Performance Graph
 * Data source: Audited and reported exchange financials for FY 2021-22, FY 2022-23 & FY 2023-24
 */
function initPxilFinancialChart() {
    if (window.initFinancialChart) {
        window.initFinancialChart({
            containerId: 'pxil-fin-graph-container',
            canvasId: 'pxil-fin-canvas',
            years: ['FY 2021-22', 'FY 2022-23', 'FY 2023-24'],
            revenue: [48.12, 55.50, 63.22],
            revenueRawLakhs: ['48.12', '55.50', '63.22'],
            ebitda: [24.10, 28.90, 33.40],
            ebitdaRaw: ['24.10', '28.90', '33.40'],
            secondMetricLabel: 'EBITDA',
            secondMetricUnit: '₹ Cr',
            pat: [15.60, 18.80, 22.10],
            patRawLakhs: ['15.60', '18.80', '22.10'],
            eps: [2.65, 3.70, 3.80],
            revenueLabel: 'Revenue',
            theme: 'standard',
            title: 'Power Exchange India Limited (PXIL) Financial Trajectory'
        });
    }
}

/**
 * Copies the ISIN code to user clipboard and provides visual feedback
 * @param {string} isin - The ISIN code to copy (default: INE03N601010)
 */
function copyIsinCode(isin = 'INE03N601010') {
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
 * Initialize event listener on the ISIN copy button
 */
function initIsinCopyFeature() {
    const copyBtn = document.getElementById('copy-isin-btn');
    if (copyBtn) {
        copyBtn.addEventListener('click', () => {
            copyIsinCode('INE03N601010');
        });
    }
}
