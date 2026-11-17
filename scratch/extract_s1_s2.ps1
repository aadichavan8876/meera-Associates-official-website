$nsdl = [System.IO.File]::ReadAllText("scratch/nsdl_real_utf8.html", [System.Text.Encoding]::UTF8)
$s1Start = $nsdl.IndexOf('<!-- SECTION 1: NSDL IDeAS Online Registration -->')
$s3Start = $nsdl.IndexOf('<!-- SECTION 3: Frequently Asked Questions & Troubleshooting -->')
$s1s2_nsdl = $nsdl.Substring($s1Start, $s3Start - $s1Start)

[System.IO.File]::WriteAllText("scratch/nsdl_s1_s2_clean.html", $s1s2_nsdl, [System.Text.Encoding]::UTF8)

$cdsl = [System.IO.File]::ReadAllText("scratch/cdsl_real_utf8.html", [System.Text.Encoding]::UTF8)
$s1StartCdsl = $cdsl.IndexOf('<!-- SECTION 1: CDSL Easiest Online Registration -->')
$s3StartCdsl = $cdsl.IndexOf('<!-- SECTION 3: Frequently Asked Questions & Troubleshooting -->')
$s1s2_cdsl = $cdsl.Substring($s1StartCdsl, $s3StartCdsl - $s1StartCdsl)

[System.IO.File]::WriteAllText("scratch/cdsl_s1_s2_clean.html", $s1s2_cdsl, [System.Text.Encoding]::UTF8)

Write-Output "Saved s1_s2 clean extracts. Checking contents..."
