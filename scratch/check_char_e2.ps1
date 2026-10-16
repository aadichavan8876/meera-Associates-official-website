$target = [char]0x00E2 + [char]0x0153 # a^oe
$files = Get-ChildItem -Path . -Include *.css,*.html,*.js -Recurse | Where-Object {
    $_.FullName -notmatch '\\node_modules\\' -and 
    $_.FullName -notmatch '\\\.git\\' -and
    $_.FullName -notmatch '\\scratch\\'
}

$found = @()
foreach ($f in $files) {
    $text = [System.IO.File]::ReadAllText($f.FullName, [System.Text.Encoding]::UTF8)
    if ($text.Contains($target)) {
        $found += [PSCustomObject]@{
            File = $f.FullName.Replace((Get-Location).Path + "\", "")
            Occurrences = ([regex]::Matches($text, [regex]::Escape($target))).Count
        }
    }
}

Write-Host "Files found: $($found.Count)"
$found | Format-Table -AutoSize
