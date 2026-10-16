[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$ua = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36'
$outDir = (Resolve-Path 'assets/logos').Path

# 1. CIAL
$urlCial = 'https://www.cial.aero/images/logo.png'
try {
    Invoke-WebRequest -Uri $urlCial -UserAgent $ua -OutFile "$outDir\cial.png"
    Write-Host "Downloaded cial.png"
} catch {
    Write-Host "Failed cial: $_"
}

# 2. Carrier
$urlCarrier = 'https://images.carriercms.com/image/upload/h_150,q_100,f_auto/v1573562016/common/logos/carrier-corp-logo.png'
try {
    Invoke-WebRequest -Uri $urlCarrier -UserAgent $ua -OutFile "$outDir\carrier.png"
    Write-Host "Downloaded carrier.png"
} catch {
    Write-Host "Failed carrier: $_"
}

# 3. Sunday Proptech
$urlSunday = 'https://www.sundayproptech.com/_assets/v11/26284cba4889af7999579c47502ffedef460c45d.svg'
try {
    Invoke-WebRequest -Uri $urlSunday -UserAgent $ua -OutFile "$outDir\sunday-proptech.svg"
    Write-Host "Downloaded sunday-proptech.svg"
} catch {
    Write-Host "Failed sunday-proptech: $_"
}

# 4. Frick India
$urlFrick = 'https://cdn-ilbknnb.nitrocdn.com/rxuyGIkiBzzlEwdtHOfEDrNGbYQJEqAl/assets/images/optimized/rev-caec9a1/frickweb.com/wp-content/themes/storefront/assets/images/new-logo.png'
try {
    Invoke-WebRequest -Uri $urlFrick -UserAgent $ua -OutFile "$outDir\frick-india.png"
    Write-Host "Downloaded frick-india.png"
} catch {
    Write-Host "Failed frick-india: $_"
}

# 5. PPFAS
$urlPpfas = 'https://amc.ppfas.com/Curve_logo.svg'
try {
    Invoke-WebRequest -Uri $urlPpfas -UserAgent $ua -OutFile "$outDir\ppfas.svg"
    Write-Host "Downloaded ppfas.svg"
} catch {
    Write-Host "Failed ppfas: $_"
}
