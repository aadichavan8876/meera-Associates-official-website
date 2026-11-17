$commits = @("HEAD", "9b7c36cd~1", "55b5b4f4")
foreach ($com in $commits) {
    Write-Output "========================================"
    Write-Output "COMMIT: $com"
    $nsdl = git show "$($com):nsdl-ideas-guide.html"
    $sections = [regex]::Matches($nsdl, '(?si)<section\b[^>]*id="([^"]*)"[^>]*>.*?<h2[^>]*>(.*?)</h2>')
    Write-Output "NSDL-IDEAS Sections: $($sections.Count)"
    foreach ($s in $sections) {
        $id = $s.Groups[1].Value
        $h2 = [regex]::Replace($s.Groups[2].Value, '<[^>]+>', ' ').Trim()
        $h2 = [regex]::Replace($h2, '\s+', ' ')
        Write-Output "  - id='$id': $h2"
    }

    $cdsl = git show "$($com):cdsl-easiest-guide.html"
    $sectionsCdsl = [regex]::Matches($cdsl, '(?si)<section\b[^>]*id="([^"]*)"[^>]*>.*?<h2[^>]*>(.*?)</h2>')
    Write-Output "CDSL-EASIEST Sections: $($sectionsCdsl.Count)"
    foreach ($s in $sectionsCdsl) {
        $id = $s.Groups[1].Value
        $h2 = [regex]::Replace($s.Groups[2].Value, '<[^>]+>', ' ').Trim()
        $h2 = [regex]::Replace($h2, '\s+', ' ')
        Write-Output "  - id='$id': $h2"
    }
}
