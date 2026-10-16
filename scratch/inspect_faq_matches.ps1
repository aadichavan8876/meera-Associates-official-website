$matches = Select-String -Path *.html -Pattern 'Frequently Asked'
foreach ($m in $matches) {
    Write-Host "$($m.Filename):$($m.LineNumber) -> $($m.Line.Trim())"
}
