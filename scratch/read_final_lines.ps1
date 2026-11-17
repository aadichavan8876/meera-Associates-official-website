$lines = [System.IO.File]::ReadAllLines("scratch/nsdl_final.html", [System.Text.Encoding]::UTF8)
for ($i = 205; $i -le 240; $i++) {
    Write-Output "[$i] $($lines[$i])"
}
