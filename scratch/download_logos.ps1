[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$url1 = 'https://www.nayaraenergy.com/images/logo.png'
$url2 = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQ573DWSsXmJnJti-xLfr91L0Kpf1aSbiH3W-5nIxr4Q&s=10'
$url3 = 'https://www.hdfcsec.com/Content/main1/Images/HDFC_Securities_Logo.svg'

$userAgent = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36'

try {
    Invoke-WebRequest -Uri $url1 -UserAgent $userAgent -OutFile 'assets/logos/nayara-energy.png'
    Write-Host "Downloaded url1 to assets/logos/nayara-energy.png"
} catch {
    Write-Host "Failed url1: $_"
}

try {
    Invoke-WebRequest -Uri $url2 -UserAgent $userAgent -OutFile 'scratch/url2.png'
    Write-Host "Downloaded url2 to scratch/url2.png"
} catch {
    Write-Host "Failed url2: $_"
}

try {
    Invoke-WebRequest -Uri $url3 -UserAgent $userAgent -OutFile 'assets/logos/hdfc-securities.svg'
    Write-Host "Downloaded url3 to assets/logos/hdfc-securities.svg"
} catch {
    Write-Host "Failed url3: $_"
}
