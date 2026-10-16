$scrips19 = @(
    "anugrahavalve", "carehealth", "goashipyard", "greenzoenergy", "hdfcsecurities",
    "hpx", "incredcapital", "indofil", "motilaloswalhf", "msei",
    "nayaraenergy", "ncdex", "nerl", "oyo", "pharmed",
    "pxil", "ritewater", "sterlitegrid5", "sterlitepower"
)

foreach ($s in $scrips19) {
    $file = "scripts/$s/$s.html"
    $content = Get-Content $file -Raw -Encoding UTF8
    $idx = $content.IndexOf("faq-accordion-container")
    if ($idx -gt 0) {
        $sub = $content.Substring($idx)
        # Find where aside starts or next card starts
        $endIdx = $sub.IndexOf("</aside>")
        if ($endIdx -lt 0) { $endIdx = $sub.IndexOf("<aside") }
        if ($endIdx -gt 0) {
            $chunk = $sub.Substring(0, $endIdx)
            $divCloses = ([regex]::Matches($chunk, '</div>')).Count
            Write-Host "$s : divCloses=$divCloses before aside"
        }
    }
}
