/**
 * Sterlite Grid 5 Limited - Dedicated Page Script
 * Meera Associates Official Website
 */

document.addEventListener('DOMContentLoaded', () => {
    initIsinCopyFeature();
    initSGL5FinancialChart();
});

/**
 * Initializes the Interactive Financial Performance Graph
 */
function initSGL5FinancialChart() {
    if (window.initFinancialChart) {
        window.initFinancialChart({
            containerId: 'sgl5-fin-graph-container',
            canvasId: 'sgl5-fin-canvas',
            years: ['FY 2023-24', 'FY 2024-25', 'FY 2025-26'],
            revenue: [4917.89, 4955.76, 6253.55],
            revenueRawLakhs: ['49,178.94', '49,557.60', '62,535.53'],
            ebitda: [506.63, 472.42, 490.60],
            ebitdaRaw: ['5,066.32', '4,724.24', '4,906.00'],
            secondMetricLabel: 'EBITDA',
            secondMetricUnit: '₹ Cr',
            pat: [230.13, 183.03, 237.19],
            patRawLakhs: ['2,301.27', '1,830.30', '2,371.92'],
            eps: [null, 13.78, 14.49],
            revenueLabel: 'Revenue from Operations',
            theme: 'sterlite',
            title: 'Sterlite Grid 5 Financial Trajectory (Demerger Pro-Forma)'
        });
    }
}

/**
 * Copies the ISIN code to user clipboard and provides visual feedback
 * @param {string} isin - The ISIN code to copy (default: INE03QT01027)
 */
function copyIsinCode(isin = 'INE03QT01027') {
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
        statusEl.style.color = '#38bdf8';
        if (badgeBtn) {
            badgeBtn.style.borderColor = '#0284c7';
            badgeBtn.style.backgroundColor = '#0c2033';
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
        tableStatus.style.color = '#0284c7';
        if (tableBtn) {
            tableBtn.style.borderColor = '#0284c7';
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
            copyIsinCode('INE03QT01027');
        });
    }
    const tableBtn = document.getElementById('table-copy-isin-btn');
    if (tableBtn) {
        tableBtn.addEventListener('click', () => {
            copyIsinCode('INE03QT01027');
        });
    }
}