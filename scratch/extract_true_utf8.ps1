$psi = New-Object System.Diagnostics.ProcessStartInfo
$psi.FileName = "git"
$psi.Arguments = "show 9b7c36cd~1:nsdl-ideas-guide.html"
$psi.StandardOutputEncoding = [System.Text.Encoding]::UTF8
$psi.UseShellExecute = $false
$psi.RedirectStandardOutput = $true
$p = [System.Diagnostics.Process]::Start($psi)
$contentNsdl = $p.StandardOutput.ReadToEnd()
$p.WaitForExit()
[System.IO.File]::WriteAllText("scratch/nsdl_real_utf8.html", $contentNsdl, [System.Text.Encoding]::UTF8)

$psi2 = New-Object System.Diagnostics.ProcessStartInfo
$psi2.FileName = "git"
$psi2.Arguments = "show 9b7c36cd~1:cdsl-easiest-guide.html"
$psi2.StandardOutputEncoding = [System.Text.Encoding]::UTF8
$psi2.UseShellExecute = $false
$psi2.RedirectStandardOutput = $true
$p2 = [System.Diagnostics.Process]::Start($psi2)
$contentCdsl = $p2.StandardOutput.ReadToEnd()
$p2.WaitForExit()
[System.IO.File]::WriteAllText("scratch/cdsl_real_utf8.html", $contentCdsl, [System.Text.Encoding]::UTF8)

Write-Output "Successfully extracted nsdl_real_utf8.html and cdsl_real_utf8.html"
