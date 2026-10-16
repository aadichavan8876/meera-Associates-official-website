$care = Get-Content 'scripts/carehealth/carehealth.html' -Raw -Encoding UTF8
$header = [regex]::Match($care, '(?s)<header class="navbar" id="main-header">.*?</header>').Value
$footer = [regex]::Match($care, '(?s)<footer class="footer">.*?</footer>').Value

Write-Host "Header extracted length: $($header.Length)"
Write-Host "Footer extracted length: $($footer.Length)"
Write-Host "Header contains hamburger: $($header.Contains('id=""hamburger-btn""'))"
Write-Host "Footer contains Dashmesh: $($footer.Contains('Dashmesh Square'))"
