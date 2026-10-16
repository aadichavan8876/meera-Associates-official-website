$targetDir = "scripts/gfclev"
if (-not (Test-Path $targetDir)) {
    New-Item -ItemType Directory -Path $targetDir -Force | Out-Null
}

$utf8NoBom = New-Object System.Text.UTF8Encoding($false)

# 1. Generate gfclev.css from csk.css
$baseCss = [System.IO.File]::ReadAllText("scripts/csk/csk.css", [System.Text.Encoding]::UTF8)
$gfclCss = $baseCss -replace "csk", "gfclev"
[System.IO.File]::WriteAllText("$targetDir/gfclev.css", $gfclCss, $utf8NoBom)
Write-Host "Created $targetDir/gfclev.css"

# 2. Generate gfclev.js
$gfclJs = @"
/**
 * GFCL EV Products Limited - Dedicated Page Script
 * Meera Associates Official Website
 */

document.addEventListener('DOMContentLoaded', () => {
    initIsinCopyFeature();
});

/**
 * Copies the ISIN code to user clipboard and provides visual feedback
 * @param {string} isin - The ISIN code to copy
 */
function copyIsinCode(isin = 'INE0KA501014') {
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
        const originalText = statusEl.textContent;
        statusEl.textContent = 'COPIED!';
        if (badgeBtn) badgeBtn.style.borderColor = '#22c55e';
        setTimeout(() => {
            statusEl.textContent = originalText;
            if (badgeBtn) badgeBtn.style.borderColor = '';
        }, 2000);
    }
}
"@

[System.IO.File]::WriteAllText("$targetDir/gfclev.js", $gfclJs, $utf8NoBom)
Write-Host "Created $targetDir/gfclev.js"
