# Extract and categorize all emojis used across HTML pages
$htmlFiles = Get-ChildItem -Path . -Include *.html -Recurse | Where-Object { 
    $_.FullName -notmatch '\\node_modules\\' -and 
    $_.FullName -notmatch '\\\.git\\' -and
    $_.FullName -notmatch '\\scratch\\'
}

# Regex to match Emoji ranges in Unicode
$emojiPattern = '[\uD83C-\uDBFF\uDC00-\uDFFF\u2600-\u26FF\u2700-\u27BF]'

$emojiUsage = @{}

foreach ($hf in $htmlFiles) {
    $content = Get-Content $hf.FullName -Raw -Encoding UTF8
    $matches = [regex]::Matches($content, '[\uD83C-\uD83E][\uDC00-\uDFFF]|[\u2600-\u27BF]')
    foreach ($m in $matches) {
        $em = $m.Value
        if (-not $emojiUsage.ContainsKey($em)) {
            $emojiUsage[$em] = 0
        }
        $emojiUsage[$em]++
    }
}

Write-Host "Total unique emoji symbols found across site: $($emojiUsage.Keys.Count)"
Write-Host "Top Emojis by occurrence:"
$emojiUsage.GetEnumerator() | Sort-Object Value -Descending | Select-Object -First 35 | ForEach-Object {
    Write-Host ("  {0}  :  {1} occurrences" -f $_.Key, $_.Value)
}
