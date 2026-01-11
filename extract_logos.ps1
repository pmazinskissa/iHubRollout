$content = Get-Content 'proposal-app\index.html' -Raw -Encoding UTF8

# Extract SSA logo
$ssaPattern = 'const SSA_LOGO_BASE64 = "([^"]+)"'
$ssaMatch = [regex]::Match($content, $ssaPattern)
if ($ssaMatch.Success) {
    $ssaMatch.Groups[1].Value | Out-File -FilePath 'ssa_logo_full.txt' -Encoding UTF8 -NoNewline
    Write-Host "SSA logo extracted: $($ssaMatch.Groups[1].Value.Length) characters"
}

# Extract Capgemini logo
$capPattern = 'const CAPGEMINI_LOGO_BASE64 = "([^"]+)"'
$capMatch = [regex]::Match($content, $capPattern)
if ($capMatch.Success) {
    $capMatch.Groups[1].Value | Out-File -FilePath 'capgemini_logo_full.txt' -Encoding UTF8 -NoNewline
    Write-Host "Capgemini logo extracted: $($capMatch.Groups[1].Value.Length) characters"
}

