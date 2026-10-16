/**
 * Care Health Insurance Limited - Dedicated Page Script
 * Meera Associates Official Website
 */

document.addEventListener('DOMContentLoaded', () => {
    initIsinCopyFeature();
    initCareFinancialChart();
});

/**
 * Initializes the Interactive Financial Performance Graph
 * Data source: Audited and reported financials for FY 2023-24, FY 2024-25, and FY 2025-26
 */
function initCareFinancialChart() {
    if (window.initFinancialChart) {
        window.initFinancialChart({
            containerId: 'care-fin-graph-container',
            canvasId: 'care-fin-canvas',
            years: ['FY 2023-24', 'FY 2024-25', 'FY 2025-26'],
            revenue: [5328.67, 6347.22, 7255.94],
            revenueRawLakhs: ['5,32,867', '6,34,722', '7,25,594'],
            ebitda: [410.07, 208.20, 17.81],
            ebitdaRaw: ['41,007', '20,820', '1,781'],
            secondMetricLabel: 'EBITDA',
            secondMetricUnit: '₹ Cr',
            pat: [304.90, 155.18, 12.16],
            patRawLakhs: ['30,490', '15,518', '1,216'],
            eps: [3.18, 1.60, 0.12],
            revenueLabel: 'Revenue',
            theme: 'standard',
            title: 'Care Health Insurance Limited Financial Trajectory'
        });
    }
}

/**
 * Copies the ISIN code to user clipboard and provides visual feedback
 * @param {string} isin - The ISIN code to copy (default: INE119J01011)
 */
function copyIsinCode(isin = 'INE119J01011') {
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
        tableStatus.style.color = '#4ade80';
        if (tableBtn) {
            tableBtn.style.borderColor = '#22c55e';
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
            copyIsinCode('INE119J01011');
        });
    }
    const tableBtn = document.getElementById('table-copy-isin-btn');
    if (tableBtn) {
        tableBtn.addEventListener('click', () => {
            copyIsinCode('INE119J01011');
        });
    }
}