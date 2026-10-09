# Smart Time & Wellness - Maven Build Script
Write-Host "========================================" -ForegroundColor Green
Write-Host "  SMART TIME & WELLNESS SYSTEM" -ForegroundColor Green
Write-Host "  Maven Build Script" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""

$projectDir = "C:\Users\Lenovo\OneDrive\Documents\tracker"
Set-Location $projectDir

Write-Host "[1/2] Building application with Maven..." -ForegroundColor Yellow
Write-Host "Please wait, this takes 2-5 minutes..." -ForegroundColor Yellow
Write-Host ""

# Use Start-Process to avoid command echo issues
$process = Start-Process -FilePath "mvn" -ArgumentList "clean", "package", "-DskipTests" -NoNewWindow -PassThru -Wait

if ($process.ExitCode -eq 0) {
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Green
    Write-Host "BUILD SUCCESS!" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "WAR file created at:" -ForegroundColor Cyan
    Write-Host "$projectDir\target\SmartTimeWellness-1.0.0.war" -ForegroundColor White
    Write-Host ""
    Write-Host "[2/2] Next steps:" -ForegroundColor Yellow
    Write-Host "1. Copy the WAR file to your Tomcat webapps folder" -ForegroundColor White
    Write-Host "2. Rename it to: tracker.war" -ForegroundColor White
    Write-Host "3. Start Tomcat: [TOMCAT]\bin\startup.bat" -ForegroundColor White
    Write-Host "4. Access: http://localhost:8080/tracker/" -ForegroundColor White
    Write-Host ""
    Write-Host "Login Credentials:" -ForegroundColor Yellow
    Write-Host "Admin: admin@smartwellness.com / admin123" -ForegroundColor White
    Write-Host "User: john@example.com / student123" -ForegroundColor White
} else {
    Write-Host ""
    Write-Host "ERROR: Build failed!" -ForegroundColor Red
    Write-Host "Please check the error messages above." -ForegroundColor Red
    Write-Host ""
}

Write-Host ""
Write-Host "Press any key to exit..." -ForegroundColor Gray
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
