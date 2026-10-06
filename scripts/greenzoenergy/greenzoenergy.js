/**
 * Greenzo Energy India Limited - Dedicated Page Script
 * Meera Associates Official Website
 */

document.addEventListener('DOMContentLoaded', () => {
    initIsinCopyFeature();
    initGreenzoFinancialChart();
});

/**
 * Initializes the Interactive Financial Performance Graph
 */
function initGreenzoFinancialChart() {
    if (window.initFinancialChart) {
        window.initFinancialChart({
            containerId: 'greenzo-fin-graph-container',
            canvasId: 'greenzo-fin-canvas',
            years: ['FY 2023-24', 'FY 2024-25', 'FY 2025-26'],
            revenue: [14.89, 15.97, 36.81],
            revenueRawLakhs: ['1,488,755.96', '1596969.2', '3,680,636.45'],
            ebitda: [1.36, null, null],
            ebitdaRaw: ['1,35,64,316', 'NA', 'NA'],
            secondMetricLabel: 'EBITDA',
            secondMetricUnit: '₹ Cr',
            pat: [2.00, 1.38, 3.43],
            patRawLakhs: ['20000000', '1.38,422.04', '343,075.38'],
            eps: [1.81, 1.18, 2.79],
            revenueLabel: 'Revenue',
            theme: 'anugraha',
            title: 'Greenzo Energy India Financial Trajectory'
        });
    }
}

/**
 * Copies the ISIN code to user clipboard and provides visual feedback
 * @param {string} isin - The ISIN code to copy (default: INE00A401013)
 */
function copyIsinCode(isin = 'INE00A401013') {
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
        statusEl.style.color = '#34d399';
        
        if (badgeBtn) {
            badgeBtn.style.borderColor = '#10b981';
            badgeBtn.style.backgroundColor = '#064e3b';
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
 * Initialize event listeners on page elements
 */
function initIsinCopyFeature() {
    const copyBtn = document.getElementById('copy-isin-btn');
    if (copyBtn && !copyBtn.dataset.bound) {
        copyBtn.dataset.bound = 'true';
        copyBtn.addEventListener('click', (e) => {
            e.preventDefault();
            copyIsinCode('INE00A401013');
        });
    }
}
