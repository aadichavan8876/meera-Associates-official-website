$cssFiles = Get-ChildItem -Path . -Filter "*.css" -Recurse | Where-Object { 
    $_.FullName -notmatch '\\node_modules\\' -and 
    $_.FullName -notmatch '\\\.git\\' -and
    $_.FullName -notmatch '\\scratch\\'
}

$htmlFiles = Get-ChildItem -Path . -Filter "*.html" -Recurse | Where-Object { 
    $_.FullName -notmatch '\\node_modules\\' -and 
    $_.FullName -notmatch '\\\.git\\' -and
    $_.FullName -notmatch '\\scratch\\'
}

$jsFiles = Get-ChildItem -Path . -Filter "*.js" -Recurse | Where-Object { 
    $_.FullName -notmatch '\\node_modules\\' -and 
    $_.FullName -notmatch '\\\.git\\' -and
    $_.FullName -notmatch '\\scratch\\'
}

$allFiles = @($cssFiles) + @($htmlFiles) + @($jsFiles)

$found = @()

foreach ($f in $allFiles) {
    $lines = Get-Content $f.FullName -Encoding UTF8
    for ($i = 0; $i -lt $lines.Count; $i++) {
        $line = $lines[$i]
        if ($line -match 'â|Ã|ð|ï¿½') {
            $found += [PSCustomObject]@{
                File = $f.FullName.Replace((Get-Location).Path + "\", "")
                LineNum = $i + 1
                Line = $line.Trim()
            }
        }
    }
}

Write-Host "Total occurrences of mojibake found: $($found.Count)"
$found | Format-Table -AutoSize
