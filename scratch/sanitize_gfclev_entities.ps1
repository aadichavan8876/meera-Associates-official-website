$filePath = 'scripts/gfclev/gfclev.html'
$c = [System.IO.File]::ReadAllText($filePath, [System.Text.Encoding]::UTF8)

# Checkmark
$c = $c.Replace('âœ“', '&#10003;')
$c = $c.Replace('✓', '&#10003;')

# Specific mojibake emoji sequences
$replacements = @{
    'ðŸ“…' = '&#128197;'
    'ðŸ’°' = '&#128176;'
    'ðŸ“‹' = '&#128203;'
    'ðŸ ¢' = '&#127970;'
    'ðŸ‘¥' = '&#128101;'
    'ðŸ“ '  = '&#128205;'
    'ðŸŒ '  = '&#127760;'
    'ðŸ”‹' = '&#128267;'
    'ðŸ§ª' = '&#129514;'
    'ðŸ”—' = '&#128279;'
    'ðŸ“ˆ' = '&#128200;'
    'ðŸ“‘' = '&#128193;'
    'ðŸ“Š' = '&#128202;'
    '📅'    = '&#128197;'
    '💰'    = '&#128176;'
    '📋'    = '&#128203;'
    '🏢'    = '&#127970;'
    '👥'    = '&#128101;'
    '📍'    = '&#128205;'
    '🌐'    = '&#127760;'
    '🔋'    = '&#128267;'
    '🧪'    = '&#129514;'
    '🔗'    = '&#128279;'
    '📈'    = '&#128200;'
    '📑'    = '&#128193;'
    '📊'    = '&#128202;'
}

foreach ($k in $replacements.Keys) {
    $c = $c.Replace($k, $replacements[$k])
}

[System.IO.File]::WriteAllText($filePath, $c, [System.Text.Encoding]::UTF8)
Write-Host "Sanitized $filePath with pure HTML entities!"
