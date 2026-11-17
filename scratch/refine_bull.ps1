$css = [System.IO.File]::ReadAllText("styles.css", [System.Text.Encoding]::UTF8)

$oldBullImg = @'
.screen-bull-img {
    max-width: 550px;
    max-height: 360px;
    width: 96%;
    height: 96%;
    object-fit: contain;
    filter: drop-shadow(0 20px 35px rgba(15, 23, 42, 0.3));
    animation: bullFloat 3.5s ease-in-out infinite alternate;
}
'@

$newBullImg = @'
.screen-bull-img {
    max-width: 480px;
    max-height: 240px;
    width: auto;
    height: auto;
    object-fit: contain;
    filter: drop-shadow(0 20px 35px rgba(15, 23, 42, 0.3));
    animation: bullFloat 3.5s ease-in-out infinite alternate;
}
'@

$css = $css.Replace($oldBullImg.Trim(), $newBullImg.Trim())

$oldBullPadding = 'padding: 10px 16px 10px 16px;'
$newBullPadding = 'padding: 14px 18px 16px 18px;'

$css = $css.Replace($oldBullPadding, $newBullPadding)

[System.IO.File]::WriteAllText("styles.css", $css, [System.Text.Encoding]::UTF8)
Write-Output "Refined bull screen sizing in styles.css"
