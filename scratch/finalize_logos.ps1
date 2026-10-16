# 1. Base64 embed for nayara-energy.svg
$nayaraBytes = [System.IO.File]::ReadAllBytes((Resolve-Path 'assets/logos/nayara-energy.png').Path)
$nayaraB64 = [Convert]::ToBase64String($nayaraBytes)
$nayaraSvg = @"
<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 600 512" width="600" height="512">
  <image width="600" height="512" xlink:href="data:image/png;base64,$nayaraB64"/>
</svg>
"@
[System.IO.File]::WriteAllText((Resolve-Path 'assets/logos').Path + '\nayara-energy.svg', $nayaraSvg, [System.Text.Encoding]::UTF8)
Write-Host "Updated assets/logos/nayara-energy.svg"

# 2. Base64 embed for oyo.svg
$oyoBytes = [System.IO.File]::ReadAllBytes((Resolve-Path 'assets/logos/oyo.png').Path)
$oyoB64 = [Convert]::ToBase64String($oyoBytes)
$oyoSvg = @"
<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 400 140" width="400" height="140">
  <image width="400" height="140" xlink:href="data:image/png;base64,$oyoB64"/>
</svg>
"@
[System.IO.File]::WriteAllText((Resolve-Path 'assets/logos').Path + '\oyo.svg', $oyoSvg, [System.Text.Encoding]::UTF8)
Write-Host "Updated assets/logos/oyo.svg"

# 3. Update unlisted-shares.js
$jsPath = 'unlisted-shares.js'
$jsText = Get-Content $jsPath -Raw -Encoding UTF8
$jsText = $jsText.Replace("'assets/logos/nayara-energy.svg'", "'assets/logos/nayara-energy.png'")
$jsText = $jsText.Replace("'assets/logos/oyo.svg'", "'assets/logos/oyo.png'")
$utf8NoBom = New-Object System.Text.UTF8Encoding $false
[System.IO.File]::WriteAllText((Resolve-Path $jsPath).Path, $jsText, $utf8NoBom)
Write-Host "Updated unlisted-shares.js logos"

# 4. Update HTML pages
$htmlUpdates = @(
    @{
        Path = 'scripts/nayaraenergy/nayaraenergy.html'
        Old = '<div class="sidebar-logo-frame">' + "`n" + '                            <img src="../../assets/logos/nayara-energy.svg" alt="Nayara Energy Limited Logo" class="sidebar-logo-img">'
        New = '<div class="sidebar-logo-box">' + "`n" + '                            <img src="../../assets/logos/nayara-energy.png" alt="Nayara Energy Limited Logo" class="sidebar-logo-img">'
    },
    @{
        Path = 'scripts/oyo/oyo.html'
        Old = '<div class="sidebar-logo-frame">' + "`n" + '                            <img src="../../assets/logos/oyo.svg" alt="Oravel Stays Limited Logo" class="sidebar-logo-img">'
        New = '<div class="sidebar-logo-box">' + "`n" + '                            <img src="../../assets/logos/oyo.png" alt="Oravel Stays Limited Logo" class="sidebar-logo-img">'
    },
    @{
        Path = 'scripts/hdfcsecurities/hdfcsecurities.html'
        Old = '<div class="sidebar-logo-frame">'
        New = '<div class="sidebar-logo-box">'
    },
    @{
        Path = 'scripts/nerl/nerl.html'
        Old = '<div class="sidebar-logo-frame">'
        New = '<div class="sidebar-logo-box">'
    },
    @{
        Path = 'scripts/motilaloswalhf/motilaloswalhf.html'
        Old = '<div class="sidebar-logo-frame">'
        New = '<div class="sidebar-logo-box">'
    }
)

foreach ($u in $htmlUpdates) {
    $p = $u.Path
    $content = Get-Content $p -Raw -Encoding UTF8
    if ($content.Contains($u.Old)) {
        $content = $content.Replace($u.Old, $u.New)
        [System.IO.File]::WriteAllText((Resolve-Path $p).Path, $content, $utf8NoBom)
        Write-Host "Updated $p"
    } else {
        Write-Host "Pattern not found in $p"
    }
}
