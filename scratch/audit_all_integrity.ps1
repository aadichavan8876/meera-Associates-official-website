$allHtml = Get-ChildItem -Path . -Filter *.html -Recurse

$report = foreach ($f in $allHtml) {
    if ($f.FullName -match 'scratch|node_modules|\.git') { continue }
    $c = Get-Content $f.FullName -Raw -Encoding UTF8
    
    $divOpen = ([regex]::Matches($c, '<div[\s>]')).Count
    $divClose = ([regex]::Matches($c, '</div>')).Count
    $sectionOpen = ([regex]::Matches($c, '<section[\s>]')).Count
    $sectionClose = ([regex]::Matches($c, '</section>')).Count
    $mainOpen = ([regex]::Matches($c, '<main[\s>]')).Count
    $mainClose = ([regex]::Matches($c, '</main>')).Count
    $headerOpen = ([regex]::Matches($c, '<header[\s>]')).Count
    $headerClose = ([regex]::Matches($c, '</header>')).Count
    $footerOpen = ([regex]::Matches($c, '<footer[\s>]')).Count
    $footerClose = ([regex]::Matches($c, '</footer>')).Count
    
    $divDiff = $divOpen - $divClose
    $secDiff = $sectionOpen - $sectionClose
    $mainDiff = $mainOpen - $mainClose
    $hdrDiff = $headerOpen - $headerClose
    $ftrDiff = $footerOpen - $footerClose
    
    if ($divDiff -ne 0 -or $secDiff -ne 0 -or $mainDiff -ne 0 -or $hdrDiff -ne 0 -or $ftrDiff -ne 0) {
        [PSCustomObject]@{
            File = $f.FullName.Replace('D:\meera Associates official website\', '')
            Div = "$divOpen / $divClose ($divDiff)"
            Section = "$sectionOpen / $sectionClose ($secDiff)"
            Main = "$mainOpen / $mainClose ($mainDiff)"
            Header = "$headerOpen / $headerClose ($hdrDiff)"
            Footer = "$footerOpen / $footerClose ($ftrDiff)"
        }
    }
}

Write-Host "Files with tag imbalance: $($report.Count)"
$report | Format-Table -AutoSize
