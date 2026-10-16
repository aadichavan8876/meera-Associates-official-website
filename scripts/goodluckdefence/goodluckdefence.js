/**
 * Goodluck Defence and Aerospace Ltd - Dedicated Page Script
 * Meera Associates Official Website
 */

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

/**
 * Copies the ISIN code to user clipboard and provides visual feedback
 * @param {string} isin - The ISIN code to copy
 */
function copyIsinCode(isin = 'INE0S7401019') {
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
    
    if (statusEl) {
        const originalText = statusEl.innerHTML;
        statusEl.innerHTML = '\u2705 Copied!';
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

    if (tableStatus) {
        const originalTableText = tableStatus.innerHTML;
        tableStatus.innerHTML = '\u2705 Copied!';
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
            copyIsinCode('INE0S7401019');
        });
    }
    const tableBtn = document.getElementById('table-copy-isin-btn');
    if (tableBtn) {
        tableBtn.addEventListener('click', () => {
            copyIsinCode('INE0S7401019');
        });
    }
}

/**
 * Initializes interactive accordion behavior for FAQ questions
 */
function initFaqAccordion() {
    const faqItems = document.querySelectorAll('.faq-item, .faq-card');
    faqItems.forEach(item => {
        const toggleBtn = item.querySelector('.faq-question, .faq-card-question');
        if (toggleBtn) {
            toggleBtn.addEventListener('click', (e) => {
                e.preventDefault();
                const isActive = item.classList.contains('active');
                const parent = item.parentElement;
                if (parent) {
                    const siblings = parent.querySelectorAll('.faq-item, .faq-card');
                    siblings.forEach(s => { if (s !== item) s.classList.remove('active'); });
                }
                item.classList.toggle('active', !isActive);
            });
        }
    });
}