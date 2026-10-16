# Add UTF-8 BOM to generator scripts so PowerShell reads them as UTF-8
$generators = @(
    "scratch/generate_ppfas.ps1",
    "scratch/generate_frick.ps1",
    "scratch/generate_sunday.ps1",
    "scratch/generate_carrier.ps1",
    "scratch/generate_cial.ps1"
)

$bom = [byte[]](0xEF, 0xBB, 0xBF)

foreach ($g in $generators) {
    $path = (Resolve-Path $g).Path
    $bytes = [System.IO.File]::ReadAllBytes($path)
    if ($bytes[0] -ne 0xEF -or $bytes[1] -ne 0xBB -or $bytes[2] -ne 0xBF) {
        [System.IO.File]::WriteAllBytes($path, $bom + $bytes)
        Write-Host "Added UTF-8 BOM to $g"
    }
}
