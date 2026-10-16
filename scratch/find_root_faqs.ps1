$rootFiles = Get-ChildItem -Path . -Filter *.html -File

foreach ($f in $rootFiles) {
    $c = [System.IO.File]::ReadAllText($f.FullName, [System.Text.Encoding]::UTF8)
    $hasFaqWord = $c -match '(?i)frequently asked questions'
    $hasFaqClass = $c -match '(?i)faq'
    if ($hasFaqWord -or $hasFaqClass) {
        Write-Host "$($f.Name) : WordMatch=$hasFaqWord, ClassMatch=$hasFaqClass"
    }
}
