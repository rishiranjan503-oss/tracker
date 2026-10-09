# Script to fix navigation links in all HTML pages

$userPages = @(
    "goals.html",
    "time-tracking.html", 
    "wellness.html",
    "recommendations.html",
    "reports.html",
    "profile.html",
    "settings.html"
)

$userPath = "C:\Users\Lenovo\OneDrive\Documents\tracker\src\main\webapp\user"

# Navigation replacements for user pages
$navReplacements = @{
    'href="#dashboard"' = 'href="dashboard.html"'
    'href="#goals"' = 'href="goals.html"'
    'href="#time-tracking"' = 'href="time-tracking.html"'
    'href="#wellness"' = 'href="wellness.html"'
    'href="#recommendations"' = 'href="recommendations.html"'
    'href="#reports"' = 'href="reports.html"'
    'href="#profile"' = 'href="profile.html"'
    'href="#settings"' = 'href="settings.html"'
    'href="#logout"' = 'href="../api/logout"'
}

Write-Host "Fixing navigation links in user pages..." -ForegroundColor Cyan

foreach ($page in $userPages) {
    $filePath = Join-Path $userPath $page
    
    if (Test-Path $filePath) {
        Write-Host "Processing: $page" -ForegroundColor Yellow
        $content = Get-Content $filePath -Raw -Encoding UTF8
        
        foreach ($key in $navReplacements.Keys) {
            $content = $content -replace [regex]::Escape($key), $navReplacements[$key]
        }
        
        Set-Content $filePath $content -Encoding UTF8 -NoNewline
        Write-Host "  ✓ Updated $page" -ForegroundColor Green
    } else {
        Write-Host "  ✗ File not found: $page" -ForegroundColor Red
    }
}

# Fix admin pages
$adminPages = @(
    "dashboard.html",
    "users.html",
    "goal-parameters.html",
    "wellness-parameters.html",
    "reports.html",
    "settings.html"
)

$adminPath = "C:\Users\Lenovo\OneDrive\Documents\tracker\src\main\webapp\admin"

$adminNavReplacements = @{
    'href="#dashboard"' = 'href="dashboard.html"'
    'href="#users"' = 'href="users.html"'
    'href="#goal-parameters"' = 'href="goal-parameters.html"'
    'href="#wellness-parameters"' = 'href="wellness-parameters.html"'
    'href="#reports"' = 'href="reports.html"'
    'href="#settings"' = 'href="settings.html"'
    'href="#logout"' = 'href="../api/logout"'
}

Write-Host "`nFixing navigation links in admin pages..." -ForegroundColor Cyan

foreach ($page in $adminPages) {
    $filePath = Join-Path $adminPath $page
    
    if (Test-Path $filePath) {
        Write-Host "Processing: $page" -ForegroundColor Yellow
        $content = Get-Content $filePath -Raw -Encoding UTF8
        
        foreach ($key in $adminNavReplacements.Keys) {
            $content = $content -replace [regex]::Escape($key), $adminNavReplacements[$key]
        }
        
        Set-Content $filePath $content -Encoding UTF8 -NoNewline
        Write-Host "  ✓ Updated $page" -ForegroundColor Green
    } else {
        Write-Host "  ✗ File not found: $page" -ForegroundColor Red
    }
}

# Update index.html
$indexPath = "C:\Users\Lenovo\OneDrive\Documents\tracker\src\main\webapp\index.html"
if (Test-Path $indexPath) {
    Write-Host "`nUpdating index.html..." -ForegroundColor Cyan
    $content = Get-Content $indexPath -Raw -Encoding UTF8
    $content = $content -replace 'href="#login"', 'href="login.html"'
    $content = $content -replace 'href="#register"', 'href="register.html"'
    $content = $content -replace 'href="#dashboard"', 'href="user/dashboard.html"'
    Set-Content $indexPath $content -Encoding UTF8 -NoNewline
    Write-Host "  ✓ Updated index.html" -ForegroundColor Green
}

# Update login.html
$loginPath = "C:\Users\Lenovo\OneDrive\Documents\tracker\src\main\webapp\login.html"
if (Test-Path $loginPath) {
    Write-Host "`nUpdating login.html..." -ForegroundColor Cyan
    $content = Get-Content $loginPath -Raw -Encoding UTF8
    $content = $content -replace 'href="#register"', 'href="register.html"'
    $content = $content -replace 'href="#index"', 'href="index.html"'
    $content = $content -replace 'href="index.html"', 'href="index.html"'
    Set-Content $loginPath $content -Encoding UTF8 -NoNewline
    Write-Host "  ✓ Updated login.html" -ForegroundColor Green
}

# Update register.html
$registerPath = "C:\Users\Lenovo\OneDrive\Documents\tracker\src\main\webapp\register.html"
if (Test-Path $registerPath) {
    Write-Host "`nUpdating register.html..." -ForegroundColor Cyan
    $content = Get-Content $registerPath -Raw -Encoding UTF8
    $content = $content -replace 'href="#login"', 'href="login.html"'
    $content = $content -replace 'href="#index"', 'href="index.html"'
    Set-Content $registerPath $content -Encoding UTF8 -NoNewline
    Write-Host "  ✓ Updated register.html" -ForegroundColor Green
}

Write-Host "`n✅ All navigation links have been fixed!" -ForegroundColor Green
Write-Host "`nAll pages are now properly connected." -ForegroundColor Cyan
