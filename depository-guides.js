/**
 * Depository Guides Interactive Handler (NSDL & CDSL)
 * Meera Associates Official Portal
 */

document.addEventListener('DOMContentLoaded', () => {
    initFaqAccordion();
    initCopyButtons();
    initSmoothScroll();
});

/**
 * Initializes FAQ Accordion open/close behavior
 */
function initFaqAccordion() {
    const faqButtons = document.querySelectorAll('.faq-question');
    faqButtons.forEach(button => {
        button.addEventListener('click', () => {
            const faqItem = button.closest('.faq-item');
            if (faqItem) {
                const isActive = faqItem.classList.contains('active');
                
                // Optional: close other open items in the same container
                const parent = faqItem.closest('.faq-list');
                if (parent) {
                    parent.querySelectorAll('.faq-item').forEach(item => {
                        if (item !== faqItem) item.classList.remove('active');
                    });
                }

                faqItem.classList.toggle('active', !isActive);
            }
        });
    });
}

/**
 * Initializes interactive one-click copy buttons
 */
function initCopyButtons() {
    const copyButtons = document.querySelectorAll('.btn-copy-code');
    copyButtons.forEach(btn => {
        btn.addEventListener('click', () => {
            const textToCopy = btn.getAttribute('data-copy') || '';
            if (!textToCopy) return;

            if (navigator.clipboard && window.isSecureContext) {
                navigator.clipboard.writeText(textToCopy)
                    .then(() => showCopiedFeedback(btn))
                    .catch(() => fallbackCopy(textToCopy, btn));
            } else {
                fallbackCopy(textToCopy, btn);
            }
        });
    });
}

function fallbackCopy(text, btn) {
    const textArea = document.createElement("textarea");
    textArea.value = text;
    textArea.style.position = "fixed";
    textArea.style.top = "0";
    textArea.style.left = "-999999px";
    document.body.appendChild(textArea);
    textArea.focus();
    textArea.select();
    try {
        document.execCommand('copy');
        showCopiedFeedback(btn);
    } catch (e) {
        console.error('Copy fallback failed', e);
    } finally {
        document.body.removeChild(textArea);
    }
}

function showCopiedFeedback(btn) {
    const origText = btn.innerHTML;
    btn.innerHTML = '✓ Copied!';
    btn.style.background = '#10b981';
    btn.style.borderColor = '#059669';

    setTimeout(() => {
        btn.innerHTML = origText;
        btn.style.background = '';
        btn.style.borderColor = '';
    }, 2000);
}

/**
 * Smooth scrolling for sidebar navigation links
 */
function initSmoothScroll() {
    const navLinks = document.querySelectorAll('.sidebar-nav-links a, .guide-jump-link');
    navLinks.forEach(link => {
        link.addEventListener('click', (e) => {
            const targetId = link.getAttribute('href');
            if (targetId && targetId.startsWith('#')) {
                const targetEl = document.querySelector(targetId);
                if (targetEl) {
                    e.preventDefault();
                    targetEl.scrollIntoView({ behavior: 'smooth', block: 'start' });
                }
            }
        });
    });
}
