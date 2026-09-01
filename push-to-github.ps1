$gitCmd = "$env:LOCALAPPDATA\Programs\Git\cmd\git.exe"
$env:PATH = "$env:LOCALAPPDATA\Programs\Git\cmd;$env:PATH"

Write-Host "Configuring Git..."
& $gitCmd init -b main

$currentName = & $gitCmd config user.name
if (-not $currentName) {
    & $gitCmd config --global user.name "ajoysamanta045-commits"
}

$currentEmail = & $gitCmd config user.email
if (-not $currentEmail) {
    & $gitCmd config --global user.email "ajoysamanta045@gmail.com"
}

try {
    & $gitCmd remote remove origin 2>$null
} catch {}

& $gitCmd remote add origin "https://github.com/ajoysamanta045-commits/asbs-job-testing.git"

Write-Host "Staging files..."
& $gitCmd add .

Write-Host "Creating commit..."
& $gitCmd commit -m "Initial commit: ASB JOBS web application with dark/light mode"

Write-Host "Pushing to GitHub..."
& $gitCmd push -u origin main
