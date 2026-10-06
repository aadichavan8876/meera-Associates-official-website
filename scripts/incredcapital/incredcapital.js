/**
 * InCred Capital Financial Services Limited - Dedicated Page Script
 * Meera Associates Official Website
 */

document.addEventListener('DOMContentLoaded', () => {
    initIsinCopyFeature();
});

/**
 * Copies the ISIN code to user clipboard and provides visual feedback
 * @param {string} isin - The ISIN code to copy (default: INE970X01014)
 */
function copyIsinCode(isin = 'INE970X01014') {
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
            copyIsinCode('INE970X01014');
        });
    }
}
