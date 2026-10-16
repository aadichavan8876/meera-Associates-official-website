# Generate 5 Scrip CSS stylesheets
$baseCss = Get-Content "scripts/motilaloswalhf/motilaloswalhf.css" -Raw -Encoding UTF8

$newsCss = @"

/* News Cards Grid & News Cards */
.news-cards-grid {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 16px;
}

.news-card {
    background: #f8fafc;
    border: 1px solid #e2e8f0;
    border-radius: 12px;
    padding: 18px 20px;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    gap: 12px;
    transition: all 0.2s ease;
}

.news-card:hover {
    border-color: #38bdf8;
    background: #ffffff;
    box-shadow: 0 4px 14px rgba(15, 23, 42, 0.06);
}

.news-card-badge {
    display: inline-block;
    align-self: flex-start;
    font-size: 0.72rem;
    font-weight: 800;
    text-transform: uppercase;
    letter-spacing: 0.4px;
    background: #f0f9ff;
    color: #0284c7;
    border: 1px solid #bae6fd;
    padding: 3px 10px;
    border-radius: 999px;
}

.news-card-title {
    font-size: 0.95rem;
    font-weight: 800;
    color: #0f172a;
    line-height: 1.45;
    margin: 4px 0 0;
}

.news-card-desc {
    font-size: 0.84rem;
    color: #64748b;
    line-height: 1.5;
    margin: 0;
}

.news-link-btn {
    display: inline-flex;
    align-items: center;
    gap: 6px;
    color: #0284c7;
    font-size: 0.84rem;
    font-weight: 700;
    text-decoration: none;
    transition: color 0.2s ease;
    align-self: flex-start;
}

.news-link-btn:hover {
    color: #0369a1;
    text-decoration: underline;
}

@media (max-width: 768px) {
    .news-cards-grid {
        grid-template-columns: 1fr;
    }
}
"@

$configs = @(
    @{ prefix = "ppfas"; file = "scripts/ppfas/ppfas.css"; name = "Parag Parikh Financial Advisory Services Limited (PPFAS)" },
    @{ prefix = "frick"; file = "scripts/frickindia/frickindia.css"; name = "Frick India Limited" },
    @{ prefix = "sunday"; file = "scripts/sundayproptech/sundayproptech.css"; name = "Sunday Proptech Limited" },
    @{ prefix = "carrier"; file = "scripts/carrier/carrier.css"; name = "Carrier Airconditioning & Refrigeration Ltd" },
    @{ prefix = "cial"; file = "scripts/cial/cial.css"; name = "Cochin International Airport Ltd (CIAL)" }
)

$utf8NoBom = New-Object System.Text.UTF8Encoding($false)

foreach ($cfg in $configs) {
    $p = $cfg.prefix
    $targetPath = $cfg.file
    
    $css = $baseCss -replace 'mohf', $p
    $css = $css -replace 'MOTILAL OSWAL HOME FINANCE LIMITED', $cfg.name.ToUpper()
    $css = $css + "`n" + $newsCss
    
    $fullPath = Join-Path (Get-Location).Path $targetPath
    [System.IO.File]::WriteAllText($fullPath, $css, $utf8NoBom)
    Write-Host "Generated: $targetPath"
}
