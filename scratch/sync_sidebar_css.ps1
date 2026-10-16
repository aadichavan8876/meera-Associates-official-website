$sidebarCss = @"

/* ==========================================================================
   STANDARDIZED SIDEBAR FACTSHEET CARD STYLING
   ========================================================================== */
.sidebar-factsheet-card {
    background: #ffffff !important;
    border: 1px solid #e2e8f0 !important;
    border-radius: 16px !important;
    padding: 24px !important;
    box-shadow: 0 4px 20px -4px rgba(15, 23, 42, 0.06) !important;
    display: flex !important;
    flex-direction: column !important;
    gap: 12px !important;
}

.sidebar-scrip-badge {
    display: flex !important;
    align-items: center !important;
    gap: 16px !important;
    padding-bottom: 16px !important;
    border-bottom: 1px solid #f1f5f9 !important;
    margin-bottom: 6px !important;
}

.sidebar-scrip-logo {
    max-height: 52px !important;
    max-width: 130px !important;
    object-fit: contain !important;
    background: #f8fafc;
    padding: 6px 10px;
    border-radius: 8px;
    border: 1px solid #f1f5f9;
}

.sidebar-scrip-name {
    display: block !important;
    font-size: 1.05rem !important;
    font-weight: 800 !important;
    color: #0f172a !important;
    line-height: 1.25 !important;
}

.sidebar-scrip-isin {
    display: block !important;
    font-size: 0.8rem !important;
    font-family: monospace !important;
    color: #0284c7 !important;
    font-weight: 700 !important;
    margin-top: 3px !important;
}

.sidebar-fact-row {
    display: flex !important;
    justify-content: space-between !important;
    align-items: center !important;
    padding: 10px 0 !important;
    border-bottom: 1px solid #f8fafc !important;
    font-size: 0.88rem !important;
}

.sidebar-fact-row:last-of-type {
    border-bottom: none !important;
}

.sidebar-fact-label {
    color: #64748b !important;
    font-weight: 600 !important;
}

.sidebar-fact-val {
    color: #0f172a !important;
    font-weight: 700 !important;
    text-align: right !important;
}

.sidebar-copy-isin-btn {
    width: 100% !important;
    display: flex !important;
    align-items: center !important;
    justify-content: space-between !important;
    padding: 12px 16px !important;
    background: #f0fdf4 !important;
    border: 1.5px dashed #22c55e !important;
    border-radius: 10px !important;
    font-size: 0.88rem !important;
    font-family: monospace !important;
    font-weight: 700 !important;
    color: #15803d !important;
    cursor: pointer !important;
    transition: all 0.2s ease !important;
    margin-top: 8px !important;
    box-sizing: border-box !important;
}

.sidebar-copy-isin-btn:hover {
    background: #dcfce7 !important;
    border-color: #16a34a !important;
    box-shadow: 0 4px 12px rgba(34, 197, 94, 0.15) !important;
}

.sidebar-copy-isin-btn .copy-hint {
    font-size: 0.78rem !important;
    font-family: 'Plus Jakarta Sans', sans-serif !important;
    color: #16a34a !important;
    font-weight: 700 !important;
}
"@

$cssFiles = @(
    'scripts/csk/csk.css',
    'scripts/kineco/kineco.css',
    'scripts/herofincorp/herofincorp.css',
    'scripts/goodluckdefence/goodluckdefence.css',
    'scripts/orbisfinancial/orbisfinancial.css'
)

foreach ($f in $cssFiles) {
    if (Test-Path $f) {
        $c = [System.IO.File]::ReadAllText($f, [System.Text.Encoding]::UTF8)
        if (-not $c.Contains('.sidebar-factsheet-card')) {
            $c += "`n" + $sidebarCss
            [System.IO.File]::WriteAllText($f, $c, [System.Text.Encoding]::UTF8)
            Write-Host "Synced sidebar CSS into $f"
        }
    }
}
