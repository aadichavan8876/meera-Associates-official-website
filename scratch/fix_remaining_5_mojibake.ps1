$map = @{
    0x20AC = 0x80;
    0x0152 = 0x8C; 0x0153 = 0x9C; 0x0160 = 0x8A; 0x0161 = 0x9A;
    0x0178 = 0x9F; 0x017D = 0x8E; 0x017E = 0x9E; 0x0192 = 0x83;
    0x02C6 = 0x88; 0x02DC = 0x98; 0x2013 = 0x96; 0x2014 = 0x97;
    0x2018 = 0x91; 0x2019 = 0x92; 0x201A = 0x82; 0x201C = 0x93;
    0x201D = 0x94; 0x201E = 0x84; 0x2020 = 0x86; 0x2021 = 0x87;
    0x2022 = 0x95; 0x2026 = 0x85; 0x2030 = 0x89; 0x2039 = 0x8B;
    0x203A = 0x9B; 0x2122 = 0x99;
}

function Decode-Mojibake([string]$s) {
    $sb = [System.Text.StringBuilder]::new()
    $i = 0
    $len = $s.Length
    while ($i -lt $len) {
        $c = [int]$s[$i]
        $b1 = if ($global:map.ContainsKey($c)) { $global:map[$c] } elseif ($c -le 0xFF) { $c } else { -1 }

        $expectedLen = 0
        if ($b1 -ge 0xC2 -and $b1 -le 0xDF) { $expectedLen = 2 }
        elseif ($b1 -ge 0xE0 -and $b1 -le 0xEF) { $expectedLen = 3 }
        elseif ($b1 -ge 0xF0 -and $b1 -le 0xF4) { $expectedLen = 4 }

        if ($expectedLen -ge 2 -and ($i + $expectedLen) -le $len) {
            $bytes = [byte[]]::new($expectedLen)
            $bytes[0] = [byte]$b1
            $valid = $true
            for ($j = 1; $j -lt $expectedLen; $j++) {
                $cj = [int]$s[$i + $j]
                $bj = if ($global:map.ContainsKey($cj)) { $global:map[$cj] } elseif ($cj -le 0xFF) { $cj } else { -1 }
                if ($bj -ge 0x80 -and $bj -le 0xBF) {
                    $bytes[$j] = [byte]$bj
                } else {
                    $valid = $false
                    break
                }
            }
            if ($valid) {
                try {
                    $decodedChar = [System.Text.Encoding]::UTF8.GetString($bytes)
                    [void]$sb.Append($decodedChar)
                    $i += $expectedLen
                    continue
                } catch { }
            }
        }
        [void]$sb.Append($s[$i])
        $i++
    }
    return $sb.ToString()
}

$files5 = @(
    "scripts\hdfcsecurities\hdfcsecurities.html",
    "scripts\motilaloswalhf\motilaloswalhf.html",
    "scripts\nayaraenergy\nayaraenergy.html",
    "scripts\nerl\nerl.html",
    "scripts\oyo\oyo.html"
)

foreach ($f in $files5) {
    $content = [System.IO.File]::ReadAllText($f, [System.Text.Encoding]::UTF8)
    $fixed = Decode-Mojibake $content
    [System.IO.File]::WriteAllText($f, $fixed, [System.Text.Encoding]::UTF8)
    Write-Host "Fixed mojibake in $f"
}
