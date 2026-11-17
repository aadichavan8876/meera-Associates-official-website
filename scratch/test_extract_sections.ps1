$nsdlCurrent = [System.IO.File]::ReadAllText("nsdl-ideas-guide.html")
$nsdlOld = [System.IO.File]::ReadAllText("scratch/nsdl_utf8.html")

# In nsdlOld, extract Section 1 and Section 2:
$s1Start = $nsdlOld.IndexOf('<!-- SECTION 1: NSDL IDeAS Online Registration -->')
$s3Start = $nsdlOld.IndexOf('<!-- SECTION 3: Frequently Asked Questions')
$sections1and2 = $nsdlOld.Substring($s1Start, $s3Start - $s1Start)

Write-Output "Extracted sections 1 and 2 length: $($sections1and2.Length)"
Write-Output "First 200 chars:"
Write-Output $sections1and2.Substring(0, 200)
Write-Output "Last 200 chars:"
Write-Output $sections1and2.Substring($sections1and2.Length - 200)
