$line = [System.IO.File]::ReadAllLines("scratch/nsdl_real_utf8.html", [System.Text.Encoding]::UTF8)[214]
Write-Output "Line: $line"
$chars = $line.ToCharArray()
foreach ($c in $chars) {
    Write-Output "Char '$c' -> Code $([int]$c) (Hex $([int]$c | Format-Hex))"
}
