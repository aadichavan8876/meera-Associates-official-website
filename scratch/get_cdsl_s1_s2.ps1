$cdsl = [System.IO.File]::ReadAllText("scratch/cdsl_real_utf8.html", [System.Text.Encoding]::UTF8)
$s1Start = $cdsl.IndexOf('<!-- SECTION 1: CDSL Easiest Online Registration -->')
$s2Start = $cdsl.IndexOf('<!-- SECTION 2: Beneficiary Account Addition (Trusted Account) -->')
$s3Start = $cdsl.IndexOf('<!-- SECTION 3: Frequently Asked Questions & Troubleshooting -->')

Write-Output "Section 1 starts at $s1Start, Section 2 starts at $s2Start, Section 3 starts at $s3Start"
Write-Output "Section 1 + Section 2 total length: $($s3Start - $s1Start)"
