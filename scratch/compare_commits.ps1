$commits = @("55b5b4f4", "f2624718", "9b7c36cd")
foreach ($c in $commits) {
    $n = git show "$($c):nsdl-ideas-guide.html"
    $cd = git show "$($c):cdsl-easiest-guide.html"
    Write-Output "Commit $c - nsdl lines: $($n.Split("`n").Length), cdsl lines: $($cd.Split("`n").Length)"
}
