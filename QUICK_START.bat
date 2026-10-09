@echo off
REM Smart Time & Wellness System - Quick Start Script
REM This is the complete startup sequence

title Smart Time & Wellness System - Startup

echo.
echo ========================================
echo SMART TIME & WELLNESS SYSTEM
echo Quick Start Procedure
echo ========================================
echo.

REM Step 1: Start MySQL
echo [STEP 1] Starting MySQL Server...
echo Please wait...
net start MySQL80 >nul 2>&1
if errorlevel 1 (
    echo WARNING: Could not start MySQL via command
    echo Please start MySQL manually:
    echo - Press Win+R, type "services.msc"
    echo - Find "MySQL80" and click "Start"
    echo Press any key when MySQL is started...
    pause
) else (
    echo MySQL started successfully
)

echo.
echo [STEP 2] Verifying MySQL connection...
mysql -u root -p -e "SELECT 1" >nul 2>&1
if errorlevel 1 (
    echo ERROR: Could not connect to MySQL
    echo Please verify:
    echo - MySQL is running
    echo - Username is "root"
    echo - Password is correct (if any)
    echo - Edit DBConnection.java if password changed
    echo.
    pause
    exit /b 1
)
echo MySQL connection verified

echo.
echo [STEP 3] Checking if Tomcat is running...
netstat -an | findstr ":8080" >nul
if not errorlevel 1 (
    echo WARNING: Port 8080 is already in use (Tomcat might be running)
    echo Attempting to stop Tomcat...
    echo.
)

echo.
echo [STEP 4] Deploying application...
echo Please wait while Tomcat starts and deploys the application...
echo (This may take 15-20 seconds)
echo.

REM Check if WAR file exists
if not exist "C:\Users\Lenovo\OneDrive\Documents\tracker\target\SmartTimeWellness-1.0.0.war" (
    echo ERROR: WAR file not found
    echo Please run BUILD_AND_RUN.bat first to build the project
    pause
    exit /b 1
)

REM Copy WAR to Tomcat
REM Try common Tomcat paths
if exist "C:\Program Files\Apache Software Foundation\Tomcat 10.1\webapps" (
    echo Found Tomcat at: C:\Program Files\Apache Software Foundation\Tomcat 10.1\webapps
    copy "C:\Users\Lenovo\OneDrive\Documents\tracker\target\SmartTimeWellness-1.0.0.war" "C:\Program Files\Apache Software Foundation\Tomcat 10.1\webapps\tracker.war" /y
    set TOMCAT_BIN=C:\Program Files\Apache Software Foundation\Tomcat 10.1\bin
) else if exist "C:\Program Files\Apache Software Foundation\Tomcat 10.0\webapps" (
    echo Found Tomcat at: C:\Program Files\Apache Software Foundation\Tomcat 10.0\webapps
    copy "C:\Users\Lenovo\OneDrive\Documents\tracker\target\SmartTimeWellness-1.0.0.war" "C:\Program Files\Apache Software Foundation\Tomcat 10.0\webapps\tracker.war" /y
    set TOMCAT_BIN=C:\Program Files\Apache Software Foundation\Tomcat 10.0\bin
) else if exist "C:\Program Files\Apache Software Foundation\Tomcat 9.0\webapps" (
    echo Found Tomcat at: C:\Program Files\Apache Software Foundation\Tomcat 9.0\webapps
    copy "C:\Users\Lenovo\OneDrive\Documents\tracker\target\SmartTimeWellness-1.0.0.war" "C:\Program Files\Apache Software Foundation\Tomcat 9.0\webapps\tracker.war" /y
    set TOMCAT_BIN=C:\Program Files\Apache Software Foundation\Tomcat 9.0\bin
) else (
    echo ERROR: Tomcat not found in Program Files
    echo Please verify Tomcat installation path and try manual deployment
    pause
    exit /b 1
)

echo WAR file deployed successfully

echo.
echo [STEP 5] Starting Tomcat...
if exist "%TOMCAT_BIN%\startup.bat" (
    cd /d "%TOMCAT_BIN%"
    call startup.bat
) else (
    echo ERROR: Tomcat startup.bat not found
    pause
    exit /b 1
)

echo.
echo [STEP 6] Waiting for deployment (15 seconds)...
timeout /t 15 /nobreak

echo.
echo ========================================
echo STARTUP COMPLETE!
echo ========================================
echo.
echo Opening browser...
start http://localhost:8080/tracker/

echo.
echo Login credentials:
echo.
echo Admin Account:
echo   Email: admin@smartwellness.com
echo   Password: admin123
echo.
echo User Account:
echo   Email: john@example.com
echo   Password: student123
echo.
echo ========================================
pause
