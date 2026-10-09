@echo off
cls
color 0A
title Smart Time & Wellness - Auto Build & Deploy

echo.
echo ========================================
echo   SMART TIME ^& WELLNESS SYSTEM
echo   Automated Build ^& Deploy
echo ========================================
echo.

REM Set project directory
set PROJECT_DIR=C:\Users\Lenovo\OneDrive\Documents\tracker
cd /d "%PROJECT_DIR%"

echo [1/4] Building application with Maven...
echo Please wait, this takes 2-5 minutes...
echo.

call mvn clean package -DskipTests

if errorlevel 1 (
    color 0C
    echo.
    echo ERROR: Build failed!
    echo Please check the error messages above.
    pause
    exit /b 1
)

echo.
echo ========================================
echo BUILD SUCCESS!
echo ========================================
echo.

REM Try to find Tomcat installation
set TOMCAT_DIR=

if exist "C:\Program Files\Apache Software Foundation\Tomcat 10.1" (
    set "TOMCAT_DIR=C:\Program Files\Apache Software Foundation\Tomcat 10.1"
) else if exist "C:\Program Files\Apache Software Foundation\Tomcat 10.0" (
    set "TOMCAT_DIR=C:\Program Files\Apache Software Foundation\Tomcat 10.0"
) else if exist "C:\Program Files\Apache Software Foundation\Tomcat 9.0" (
    set "TOMCAT_DIR=C:\Program Files\Apache Software Foundation\Tomcat 9.0"
) else if exist "C:\Apache\Tomcat" (
    set "TOMCAT_DIR=C:\Apache\Tomcat"
) else if exist "C:\Tomcat" (
    set "TOMCAT_DIR=C:\Tomcat"
)

if "%TOMCAT_DIR%"=="" (
    echo.
    echo [2/4] Could not auto-detect Tomcat installation.
    echo.
    echo Please manually:
    echo 1. Copy: %PROJECT_DIR%\target\SmartTimeWellness-1.0.0.war
    echo 2. To your Tomcat webapps folder
    echo 3. Rename to: tracker.war
    echo 4. Start Tomcat: [TOMCAT]\bin\startup.bat
    echo.
    pause
    exit /b 0
)

echo [2/4] Found Tomcat at: %TOMCAT_DIR%
echo.

echo [3/4] Deploying WAR file to Tomcat...
copy /Y "%PROJECT_DIR%\target\SmartTimeWellness-1.0.0.war" "%TOMCAT_DIR%\webapps\tracker.war"

if errorlevel 1 (
    echo.
    echo ERROR: Could not copy WAR file.
    echo You may need to run this as Administrator.
    echo.
    echo Manual steps:
    echo 1. Copy: %PROJECT_DIR%\target\SmartTimeWellness-1.0.0.war
    echo 2. To: %TOMCAT_DIR%\webapps\
    echo 3. Rename to: tracker.war
    echo.
    pause
    exit /b 1
)

echo WAR file deployed successfully!
echo.

echo [4/4] Starting Tomcat server...
start "Tomcat Server" "%TOMCAT_DIR%\bin\startup.bat"

echo.
echo Waiting for deployment (20 seconds)...
timeout /t 20 /nobreak

echo.
echo ========================================
echo   APPLICATION IS READY!
echo ========================================
echo.
echo Opening browser...
start http://localhost:8080/tracker/
echo.
echo Login Credentials:
echo.
echo Admin:
echo   Email: admin@smartwellness.com
echo   Password: admin123
echo.
echo User:
echo   Email: john@example.com
echo   Password: student123
echo.
echo ========================================
echo.
echo Press any key to exit...
pause >nul
