$c = [System.IO.File]::ReadAllText('scripts/ncdex/ncdex.html', [System.Text.Encoding]::UTF8)
$m = [regex]::Match($c, '<span class="faq-arrow">([^<]+)</span>')
$bytes = [System.Text.Encoding]::UTF8.GetBytes($m.Groups[1].Value)
Write-Host "Bytes in ncdex: $(($bytes | ForEach-Object { $_.ToString('X2') }) -join ' ')"
