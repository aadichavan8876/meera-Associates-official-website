/**
 * Goa Shipyard Limited (GSL) - Dedicated Page Script
 * Meera Associates Official Website
 */

document.addEventListener('DOMContentLoaded', () => {
    initIsinCopyFeature();
    initGoaShipyardFinancialChart();
});

/**
 * Initializes the Interactive Financial Performance Graph
 */
function initGoaShipyardFinancialChart() {
    if (window.initFinancialChart) {
        window.initFinancialChart({
            containerId: 'gsl-fin-graph-container',
            canvasId: 'gsl-fin-canvas',
            years: ['FY 2023-24', 'FY 2024-25', 'FY 2025-26'],
            revenue: [1752.56, 2850.60, 3764.30], // Revenue from Operations (₹ Cr)
            ebitda: [439.92, 460.02, 522.40],   // Gross Margin EBITDA (₹ Cr)
            pat: [271.32, 288.44, 331.45],       // Profit After Tax (₹ Cr)
            eps: [23.31, 24.78, 28.47],          // EPS (₹)
            theme: 'standard',
            title: 'Goa Shipyard Financial Trajectory',
            revenueLabel: 'Revenue from Ops',
            secondMetricLabel: 'Gross Margin (EBITDA)'
        });
    }
}

/**
 * Copies the ISIN code to user clipboard and provides visual feedback
 * @param {string} isin - The ISIN code to copy (default: INE178Z01013)
 */
function copyIsinCode(isin = 'INE178Z01013') {
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
 * Setup Click Listener on ISIN badge
 */
function initIsinCopyFeature() {
    const copyBtn = document.getElementById('copy-isin-btn');
    if (copyBtn) {
        copyBtn.addEventListener('click', (e) => {
            e.preventDefault();
            const isin = copyBtn.getAttribute('data-isin') || 'INE178Z01013';
            copyIsinCode(isin);
        });
    }
}
