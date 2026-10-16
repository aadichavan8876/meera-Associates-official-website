$files = Get-ChildItem -Path scripts -Recurse -Filter *.html

$iconIssues = @()
foreach ($f in $files) {
    $c = [System.IO.File]::ReadAllText($f.FullName, [System.Text.Encoding]::UTF8)
    if ($c -match '<span class="[a-zA-Z0-9_-]+-card-title-icon">([^<]+)</span>\s*Frequently Asked Questions') {
        $icon = $Matches[1]
        $bytes = [System.Text.Encoding]::UTF8.GetBytes($icon)
        $hex = ($bytes | ForEach-Object { $_.ToString("X2") }) -join " "
        if ($hex -ne 'E2 9D 93') { # ❓ is U+2753 (E2 9D 93)
            $iconIssues += [PSCustomObject]@{
                File = $f.Directory.Name
                Icon = $icon
                Hex = $hex
            }
        }
    }
}

Write-Host "Total files with non-standard FAQ title icon: $($iconIssues.Count)"
$iconIssues | Format-Table -AutoSize
