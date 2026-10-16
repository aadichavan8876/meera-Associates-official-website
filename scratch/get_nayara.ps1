$url = 'https://upload.wikimedia.org/wikipedia/commons/5/5a/Logo_Nayara_Energy.jpg'
$ua = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36'
Invoke-WebRequest -Uri $url -UserAgent $ua -OutFile 'scratch/nayara_wiki.jpg'
Get-Item 'scratch/nayara_wiki.jpg'
