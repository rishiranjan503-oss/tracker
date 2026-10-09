@echo off
echo ========================================
echo  FIXING NAVIGATION LINKS
echo ========================================
echo.

cd /d C:\Users\Lenovo\OneDrive\Documents\tracker\src\main\webapp

echo Updating user pages...
echo.

REM Use PowerShell to do string replacements
powershell -Command "$files = Get-ChildItem -Path 'user\*.html' -File; foreach ($file in $files) { $content = Get-Content $file.FullName -Raw; $content = $content -replace 'href=\""#dashboard\"', 'href=\"dashboard.html\"'; $content = $content -replace 'href=\"#goals\"', 'href=\"goals.html\"'; $content = $content -replace 'href=\"#time-tracking\"', 'href=\"time-tracking.html\"'; $content = $content -replace 'href=\"#wellness\"', 'href=\"wellness.html\"'; $content = $content -replace 'href=\"#recommendations\"', 'href=\"recommendations.html\"'; $content = $content -replace 'href=\"#reports\"', 'href=\"reports.html\"'; $content = $content -replace 'href=\"#profile\"', 'href=\"profile.html\"'; $content = $content -replace 'href=\"#settings\"', 'href=\"settings.html\"'; $content = $content -replace 'href=\"#logout\"', 'href=\"../api/logout\"'; Set-Content $file.FullName $content -NoNewline; Write-Host \"Updated: $($file.Name)\"; }"

echo.
echo Updating admin pages...
echo.

powershell -Command "$files = Get-ChildItem -Path 'admin\*.html' -File; foreach ($file in $files) { $content = Get-Content $file.FullName -Raw; $content = $content -replace 'href=\"#dashboard\"', 'href=\"dashboard.html\"'; $content = $content -replace 'href=\"#users\"', 'href=\"users.html\"'; $content = $content -replace 'href=\"#goal-parameters\"', 'href=\"goal-parameters.html\"'; $content = $content -replace 'href=\"#wellness-parameters\"', 'href=\"wellness-parameters.html\"'; $content = $content -replace 'href=\"#reports\"', 'href=\"reports.html\"'; $content = $content -replace 'href=\"#settings\"', 'href=\"settings.html\"'; $content = $content -replace 'href=\"#\"', 'href=\"#\"'; Set-Content $file.FullName $content -NoNewline; Write-Host \"Updated: $($file.Name)\"; }"

echo.
echo ========================================
echo  ALL LINKS FIXED!
echo ========================================
pause
