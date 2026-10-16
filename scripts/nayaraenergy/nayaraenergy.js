/**
 * Nayara Energy Limited - Dedicated Page Script
 * Meera Associates Official Website
 */

document.addEventListener('DOMContentLoaded', () => {
    initIsinCopyFeature();
    initFaqAccordion();
    initNayaraFinancialChart();
});

/**
 * Initializes the Interactive Financial Performance Graph
 * Data source: Audited and reported financials for FY 2023-24, FY 2024-25, and FY 2025-26
 */
function initNayaraFinancialChart() {
    if (window.initFinancialChart) {
        window.initFinancialChart({
            containerId: 'nayara-fin-graph-container',
            canvasId: 'nayara-fin-canvas',
            years: ['FY 2023-24', 'FY 2024-25', 'FY 2025-26'],
            revenue: [15509.15, 14921.74, 1451.34],
            revenueRawLakhs: ['15,50,915', '14,92,174', '1,45,134'],
            ebitda: [1642.97, 845.82, 138.88],
            ebitdaRaw: ['1,64,297', '84,582', '13,888'],
            secondMetricLabel: 'EBITDA',
            secondMetricUnit: '₹ Cr',
            pat: [1232.10, 607.95, 91.01],
            patRawLakhs: ['1,23,210', '60,795', '9,101'],
            eps: [82.66, 40.79, 61.13],
            revenueLabel: 'Revenue',
            theme: 'standard',
            title: 'Nayara Energy Limited Financial Trajectory'
        });
    }
}

/**
 * Copies the ISIN code to user clipboard and provides visual feedback
 * @param {string} isin - The ISIN code to copy (default: INE011A01019)
 */
function copyIsinCode(isin = 'INE011A01019') {
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
            copyIsinCode('INE011A01019');
        });
    }
    const tableBtn = document.getElementById('table-copy-isin-btn');
    if (tableBtn) {
        tableBtn.addEventListener('click', () => {
            copyIsinCode('INE011A01019');
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