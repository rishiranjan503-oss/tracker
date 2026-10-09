@echo off
REM Smart Time & Wellness System - Build and Deploy Script
REM This script will build the project and prepare it for deployment

echo.
echo ================================================
echo Smart Time & Wellness System - Build Script
echo ================================================
echo.

REM Step 1: Verify Maven
echo [1] Checking Maven installation...
mvn --version
if errorlevel 1 (
    echo ERROR: Maven not found or not in PATH
    echo Please install Maven or add it to your PATH
    pause
    exit /b 1
)

echo.
echo [2] Building project with Maven...
cd /d "C:\Users\Lenovo\OneDrive\Documents\tracker"
mvn clean package -DskipTests

if errorlevel 1 (
    echo ERROR: Build failed
    pause
    exit /b 1
)

echo.
echo ================================================
echo BUILD SUCCESSFUL!
echo ================================================
echo.
echo WAR file created at:
echo C:\Users\Lenovo\OneDrive\Documents\tracker\target\SmartTimeWellness-1.0.0.war
echo.
echo Next steps:
echo 1. Make sure MySQL is running (net start MySQL80)
echo 2. Make sure Tomcat is NOT running
echo 3. Copy the WAR file to Tomcat webapps folder
echo 4. Rename it to "tracker.war"
echo 5. Start Tomcat (startup.bat)
echo 6. Wait 15 seconds then visit: http://localhost:8080/tracker/
echo.
pause
