/**
 * Pharmed Limited - Dedicated Page Script
 * Meera Associates Official Website
 */

document.addEventListener('DOMContentLoaded', () => {
    initIsinCopyFeature();
    initPharmedFinancialChart();
});

/**
 * Initializes the Interactive Financial Performance Graph
 * Data source: Audited and reported specialty pharmaceutical financials for FY 2024-25 & FY 2025-26
 */
function initPharmedFinancialChart() {
    if (window.initFinancialChart) {
        window.initFinancialChart({
            containerId: 'pharmed-fin-graph-container',
            canvasId: 'pharmed-fin-canvas',
            years: ['FY 2024-25', 'FY 2025-26'],
            revenue: [50560.00, 59522.00],
            revenueRawLakhs: ['50,560.00', '59,522.00'],
            ebitda: [11127.00, 10675.00],
            ebitdaRaw: ['11,127.00', '10,675.00'],
            secondMetricLabel: 'EBITDA',
            secondMetricUnit: '₹ Cr',
            pat: [8075.00, 7635.00],
            patRawLakhs: ['8,075.00', '7,635.00'],
            eps: [187.51, 177.29],
            revenueLabel: 'Revenue',
            theme: 'standard',
            title: 'Pharmed Limited Financial Trajectory'
        });
    }
}

/**
 * Copies the ISIN code to user clipboard and provides visual feedback
 * @param {string} isin - The ISIN code to copy (default: INE0EEI01017)
 */
function copyIsinCode(isin = 'INE0EEI01017') {
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
            copyIsinCode('INE0EEI01017');
        });
    }
}
