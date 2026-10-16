$files = Get-ChildItem -Path . -Include *.css,*.html,*.js -Recurse | Where-Object {
    $_.FullName -notmatch '\\node_modules\\' -and 
    $_.FullName -notmatch '\\\.git\\' -and
    $_.FullName -notmatch '\\scratch\\'
}

$patterns = @(
    @{ Name = "E2_153 (a^oe / checkmark mojibake)"; P = [char]0x00E2 + [char]0x0153 },
    @{ Name = "E2_20AC (a^euro / bullet/quote mojibake)"; P = [char]0x00E2 + [char]0x20AC },
    @{ Name = "C3 (A~ / latin1 mojibake)"; P = [string][char]0x00C3 },
    @{ Name = "C2 (A^ / latin1 mojibake)"; P = [string][char]0x00C2 },
    @{ Name = "F0_178 (mojibake emoji prefix)"; P = [char]0x00F0 + [char]0x0178 },
    @{ Name = "FFFD (replacement char)"; P = [string][char]0xFFFD }
)

$allFound = @()

foreach ($f in $files) {
    $rel = $f.FullName.Replace((Get-Location).Path + "\", "")
    $text = [System.IO.File]::ReadAllText($f.FullName, [System.Text.Encoding]::UTF8)

    foreach ($pat in $patterns) {
        if ($text.Contains($pat.P)) {
            $count = ([regex]::Matches($text, [regex]::Escape($pat.P))).Count
            $allFound += [PSCustomObject]@{
                File = $rel
                PatternName = $pat.Name
                Count = $count
            }
        }
    }
}

Write-Host "Total findings: $($allFound.Count)"
$allFound | Format-Table -AutoSize
