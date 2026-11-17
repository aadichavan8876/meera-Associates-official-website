$allHtml = Get-ChildItem -Path . -Recurse -Filter *.html | Where-Object { 
    $_.FullName -notmatch '\\\.git\\' -and 
    $_.FullName -notmatch '\\scratch\\'
}

foreach ($f in $allHtml) {
    $content = [System.IO.File]::ReadAllText($f.FullName, [System.Text.Encoding]::UTF8)
    if (-not $content.Contains("facilitates transactions strictly through compliant offline depository transfer")) {
        $rel = $f.FullName.Replace((Get-Location).Path + "\", "")
        Write-Output "Does not contain: $rel"
    }
}
