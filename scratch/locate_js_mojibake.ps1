$target = [char]0x00E2 + [char]0x0153
$jsList = @(
    "scripts\carrier\carrier.js",
    "scripts\cial\cial.js",
    "scripts\frickindia\frickindia.js",
    "scripts\ppfas\ppfas.js",
    "scripts\sundayproptech\sundayproptech.js"
)

foreach ($f in $jsList) {
    $lines = Get-Content $f -Encoding UTF8
    for ($i = 0; $i -lt $lines.Count; $i++) {
        if ($lines[$i].Contains($target)) {
            Write-Host "$f : Line $($i+1) : $($lines[$i].Trim())"
        }
    }
}
