$target = [char]0x00E2 + [char]0x0153
$cssList = @(
    "scripts\csk\csk.css",
    "scripts\goodluckdefence\goodluckdefence.css",
    "scripts\herofincorp\herofincorp.css",
    "scripts\kineco\kineco.css",
    "scripts\orbisfinancial\orbisfinancial.css"
)

foreach ($f in $cssList) {
    $lines = Get-Content $f -Encoding UTF8
    for ($i = 0; $i -lt $lines.Count; $i++) {
        if ($lines[$i].Contains($target)) {
            Write-Host "$f : Line $($i+1) : $($lines[$i].Trim())"
        }
    }
}
