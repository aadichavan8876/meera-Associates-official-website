$nsdl = [System.IO.File]::ReadAllText("scratch/nsdl_real_utf8.html", [System.Text.Encoding]::UTF8)
$s1Start = $nsdl.IndexOf('<!-- SECTION 1: NSDL IDeAS Online Registration -->')
$s2Start = $nsdl.IndexOf('<!-- SECTION 2: Beneficiary Addition -->')
$s3Start = $nsdl.IndexOf('<!-- SECTION 3: Frequently Asked Questions & Troubleshooting -->')

Write-Output "Section 1 starts at $s1Start, Section 2 starts at $s2Start, Section 3 starts at $s3Start"
Write-Output "Section 1 + Section 2 total length: $($s3Start - $s1Start)"
