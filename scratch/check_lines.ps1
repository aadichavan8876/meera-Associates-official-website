$lines = [System.IO.File]::ReadAllLines("scratch/nsdl_real_utf8.html", [System.Text.Encoding]::UTF8)
for ($i = 210; $i -le 225; $i++) {
    Write-Output "[$i] $($lines[$i])"
}
