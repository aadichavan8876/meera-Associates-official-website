# Check all JS and CSS files for any unencoded non-ASCII or broken strings
$jsFiles = Get-ChildItem -Path . -Filter "*.js" -Recurse | Where-Object { 
    $_.FullName -notmatch '\\node_modules\\' -and 
    $_.FullName -notmatch '\\\.git\\' -and
    $_.FullName -notmatch '\\scratch\\'
}

$cssFiles = Get-ChildItem -Path . -Filter "*.css" -Recurse | Where-Object { 
    $_.FullName -notmatch '\\node_modules\\' -and 
    $_.FullName -notmatch '\\\.git\\' -and
    $_.FullName -notmatch '\\scratch\\'
}

Write-Host "Total JS files checked: $($jsFiles.Count)"
Write-Host "Total CSS files checked: $($cssFiles.Count)"

$jsIssues = @()
foreach ($jf in $jsFiles) {
    $c = Get-Content $jf.FullName -Raw -Encoding UTF8
    if ($c.Contains([char]0xFFFD)) {
        $jsIssues += "Replacement char in $($jf.Name)"
    }
}

$cssIssues = @()
foreach ($cf in $cssFiles) {
    $c = Get-Content $cf.FullName -Raw -Encoding UTF8
    if ($c.Contains([char]0xFFFD)) {
        $cssIssues += "Replacement char in $($cf.Name)"
    }
}

Write-Host "JS issues: $($jsIssues.Count)"
Write-Host "CSS issues: $($cssIssues.Count)"
