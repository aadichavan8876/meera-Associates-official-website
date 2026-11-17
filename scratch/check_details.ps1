$nsdlCurrent = [System.IO.File]::ReadAllText("nsdl-ideas-guide.html", [System.Text.Encoding]::UTF8)
[regex]::Matches($nsdlCurrent, '<details[^>]*>[\s\S]*?</details>') | ForEach-Object {
    Write-Output "Found details: $($_.Value.Substring(0, [Math]::Min(120, $_.Value.Length)))"
}
