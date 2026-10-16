$files = Get-ChildItem -Path . -Filter *.html -Recurse | Where-Object {
    $_.FullName -notmatch '\\node_modules\\' -and 
    $_.FullName -notmatch '\\\.git\\' -and
    $_.FullName -notmatch '\\scratch\\'
}

$accordionCount = 0
$itemCount = 0
$oldContainerCount = 0
$oldCardCount = 0
$filesWithFaq = @()

foreach ($f in $files) {
    $rel = $f.FullName.Replace((Get-Location).Path + "\", "")
    $c = [System.IO.File]::ReadAllText($f.FullName, [System.Text.Encoding]::UTF8)
    
    $acc = ([regex]::Matches($c, '<div class="faq-accordion')).Count
    $items = ([regex]::Matches($c, '<div class="faq-item')).Count
    $oldCont = ([regex]::Matches($c, '<div class="faq-accordion-container')).Count
    $oldCard = ([regex]::Matches($c, '<div class="faq-card[\s"]').Count)
    
    if ($acc -gt 0 -or $items -gt 0 -or $oldCont -gt 0 -or $oldCard -gt 0) {
        $filesWithFaq += [PSCustomObject]@{
            File = $rel
            Accordion = $acc
            Items = $items
            OldContainer = $oldCont
            OldCard = $oldCard
        }
        $accordionCount += $acc
        $itemCount += $items
        $oldContainerCount += $oldCont
        $oldCardCount += $oldCard
    }
}

Write-Host "Total files with FAQ: $($filesWithFaq.Count)"
Write-Host "Total .faq-accordion: $accordionCount"
Write-Host "Total .faq-item:      $itemCount"
Write-Host "Total old container:  $oldContainerCount"
Write-Host "Total old cards:      $oldCardCount"

$filesWithFaq | Format-Table -AutoSize
