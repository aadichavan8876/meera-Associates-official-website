/**
 * OFB Tech Limited (OfBusiness) - Interactive Controller
 * ISIN: INE06DH01023
 */

document.addEventListener('DOMContentLoaded', () => {
    // 1. ISIN Copy Functionality with fallback & visual feedback
    const isinBtn = document.getElementById('copy-isin-btn');
    const statusText = document.getElementById('copy-status-text');
    const isinCode = 'INE06DH01023';

    if (isinBtn && statusText) {
        isinBtn.addEventListener('click', async () => {
            let copied = false;
            if (navigator.clipboard && window.isSecureContext) {
                try {
                    await navigator.clipboard.writeText(isinCode);
                    copied = true;
                } catch (err) {
                    console.warn('Clipboard API error, using fallback:', err);
                }
            }

            if (!copied) {
                const textarea = document.createElement('textarea');
                textarea.value = isinCode;
                textarea.style.position = 'fixed';
                textarea.style.opacity = '0';
                textarea.style.top = '0';
                textarea.style.left = '0';
                document.body.appendChild(textarea);
                textarea.focus();
                textarea.select();
                try {
                    document.execCommand('copy');
                    copied = true;
                } catch (err) {
                    console.error('Fallback copy failed:', err);
                }
                document.body.removeChild(textarea);
            }

            if (copied) {
                const originalText = statusText.textContent;
                statusText.textContent = '✓ Copied!';
                statusText.style.color = '#0891b2';
                isinBtn.style.borderColor = '#0891b2';

                setTimeout(() => {
                    statusText.textContent = originalText;
                    statusText.style.color = '';
                    isinBtn.style.borderColor = '';
                }, 2200);
            }
        });
    }

    // 2. Mobile Hamburger Menu Toggle
    const hamburgerBtn = document.getElementById('hamburger-btn');
    const navMenu = document.getElementById('nav-menu');

    if (hamburgerBtn && navMenu) {
        hamburgerBtn.addEventListener('click', () => {
            navMenu.classList.toggle('active');
            hamburgerBtn.classList.toggle('active');
        });
    }

    // 3. Mouse light follower (standardized across pages)
    const mouseFollower = document.getElementById('mouse-light-follower');
    if (mouseFollower) {
        window.addEventListener('mousemove', (e) => {
            mouseFollower.style.transform = `translate3d(${e.clientX}px, ${e.clientY}px, 0)`;
        });
    }
});
