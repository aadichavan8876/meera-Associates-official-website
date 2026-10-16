$cssFiles = Get-ChildItem -Path . -Filter "*.css" -Recurse | Where-Object {
    $_.FullName -notmatch '\\node_modules\\' -and 
    $_.FullName -notmatch '\\\.git\\' -and
    $_.FullName -notmatch '\\scratch\\'
}

$results = @()
foreach ($cf in $cssFiles) {
    $lines = Get-Content $cf.FullName -Encoding UTF8
    for ($i = 0; $i -lt $lines.Count; $i++) {
        $l = $lines[$i]
        if ($l -match 'content:\s*[''"]') {
            # Check if content has non-ascii or escape
            $m = [regex]::Match($l, 'content:\s*[''"]([^''"]*)[''"]')
            if ($m.Success) {
                $val = $m.Groups[1].Value
                $results += [PSCustomObject]@{
                    File = $cf.FullName.Replace((Get-Location).Path + "\", "")
                    Line = $i + 1
                    Value = $val
                }
            }
        }
    }
}

Write-Host "Total CSS content declarations found: $($results.Count)"
$results | Where-Object { $_.Value -ne "" } | Format-Table -AutoSize
