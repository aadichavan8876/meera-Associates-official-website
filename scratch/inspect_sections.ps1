$nsdl = [System.IO.File]::ReadAllText("scratch/nsdl_real_utf8.html", [System.Text.Encoding]::UTF8)
$cdsl = [System.IO.File]::ReadAllText("scratch/cdsl_real_utf8.html", [System.Text.Encoding]::UTF8)

Write-Output "--- NSDL ---"
$nsdlS1 = $nsdl.IndexOf('<!-- SECTION 1: NSDL IDeAS Online Registration -->')
$nsdlS2 = $nsdl.IndexOf('<!-- SECTION 2: Beneficiary Account Addition -->')
$nsdlS3 = $nsdl.IndexOf('<!-- SECTION 3: Frequently Asked Questions')
$nsdlSidebar = $nsdl.IndexOf('<!-- RIGHT SIDEBAR (Sticky Navigation & Direct Helpdesk) -->')

Write-Output "S1 Index: $nsdlS1"
Write-Output "S2 Index: $nsdlS2"
Write-Output "S3 Index: $nsdlS3"
Write-Output "Sidebar Index: $nsdlSidebar"

Write-Output "--- CDSL ---"
$cdslS1 = $cdsl.IndexOf('<!-- SECTION 1: CDSL Easiest Online Registration -->')
$cdslS2 = $cdsl.IndexOf('<!-- SECTION 2: Beneficiary Account Addition (Trusted Account Linking) -->')
$cdslS3 = $cdsl.IndexOf('<!-- SECTION 3: Frequently Asked Questions')
$cdslSidebar = $cdsl.IndexOf('<!-- RIGHT SIDEBAR (Sticky Navigation & Direct Helpdesk) -->')

Write-Output "S1 Index: $cdslS1"
Write-Output "S2 Index: $cdslS2"
Write-Output "S3 Index: $cdslS3"
Write-Output "Sidebar Index: $cdslSidebar"
