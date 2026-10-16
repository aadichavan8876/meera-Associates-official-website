# Check if any financial tables exist in Frick or CIAL
$frick = Get-Content "scripts/frickindia/frickindia.html" -Raw -Encoding UTF8
$cial = Get-Content "scripts/cial/cial.html" -Raw -Encoding UTF8

# Check lines from "fin-graph-container" to "</canvas>"
function CheckFinBlock($html, $name) {
    $idx1 = $html.IndexOf("fin-graph-container")
    $idx2 = $html.IndexOf("</canvas>", $idx1)
    if ($idx1 -ge 0 -and $idx2 -ge 0) {
        $sub = $html.Substring($idx1, $idx2 - $idx1 + 10)
        $hasTable = $sub.Contains("<table")
        Write-Host "$name Financial Section contains <table: $hasTable (Length: $($sub.Length))"
    } else {
        Write-Host "${name}: fin container not found"
    }
}

CheckFinBlock $frick "Frick India"
CheckFinBlock $cial "CIAL"
