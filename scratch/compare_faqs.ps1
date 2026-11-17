$nsdlCurrent = [System.IO.File]::ReadAllText("nsdl-ideas-guide.html", [System.Text.Encoding]::UTF8)
$nsdlOld = [System.IO.File]::ReadAllText("scratch/nsdl_real_utf8.html", [System.Text.Encoding]::UTF8)

Write-Output "--- NSDL Current FAQs ---"
[regex]::Matches($nsdlCurrent, '<details class="guide-faq-item">[\s\S]*?<summary><span>(.*?)</span>') | ForEach-Object { Write-Output $_.Groups[1].Value }

Write-Output "--- NSDL Old (f2624718) FAQs ---"
[regex]::Matches($nsdlOld, '<details class="guide-faq-item">[\s\S]*?<summary><span>(.*?)</span>') | ForEach-Object { Write-Output $_.Groups[1].Value }
