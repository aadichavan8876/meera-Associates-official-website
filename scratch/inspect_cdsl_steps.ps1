$c = [System.IO.File]::ReadAllText("scratch/cdsl_before_wipe.html")
$steps = [regex]::Matches($c, '(?si)<h3 class="step-heading">(.*?)</h3>')
Write-Output "CDSL Step Headings:"
foreach ($st in $steps) {
    Write-Output " - $($st.Groups[1].Value.Trim())"
}
