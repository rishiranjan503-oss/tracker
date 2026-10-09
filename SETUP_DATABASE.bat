@echo off
REM Smart Time & Wellness System - Database Setup Script

title Database Setup - Smart Time & Wellness System

echo.
echo ================================================
echo Database Setup Script
echo ================================================
echo.
echo This script will:
echo 1. Start MySQL (if not running)
echo 2. Create the database schema
echo 3. Verify the installation
echo.

REM Step 1: Start MySQL
echo [STEP 1] Starting MySQL Server...
net start MySQL80 >nul 2>&1
if errorlevel 1 (
    echo MySQL may already be running or there was an issue
    echo Continuing...
) else (
    echo MySQL started successfully
)

REM Wait a bit for MySQL to fully start
timeout /t 3 /nobreak

REM Step 2: Create database
echo.
echo [STEP 2] Creating database schema...
echo Please provide your MySQL credentials when prompted
echo.

mysql -u root -p < "C:\Users\Lenovo\OneDrive\Documents\tracker\database\database.sql"

if errorlevel 1 (
    echo.
    echo ERROR: Database setup failed
    echo Possible reasons:
    echo - MySQL is not running
    echo - Incorrect password
    echo - MySQL not in PATH
    echo.
    echo Manual setup:
    echo 1. Open MySQL Command Line: mysql -u root -p
    echo 2. Run: SOURCE C:\Users\Lenovo\OneDrive\Documents\tracker\database\database.sql;
    echo.
    pause
    exit /b 1
)

echo.
echo [STEP 3] Verifying database setup...
echo.

REM Verify tables were created
mysql -u root -p -D smart_time_wellness -e "SHOW TABLES;" 2>&1 | findstr "users"

if errorlevel 1 (
    echo ERROR: Database verification failed
    pause
    exit /b 1
)

echo.
echo ================================================
echo DATABASE SETUP SUCCESSFUL!
echo ================================================
echo.
echo Database: smart_time_wellness
echo Tables created: 9
echo   - users
echo   - goals
echo   - time_logs
echo   - wellness_logs
echo   - recommendations
echo   - reminders
echo   - system_parameters
echo   - activity_logs
echo   - achievement_logs
echo.
echo Sample data loaded:
echo   - Admin user (admin@smartwellness.com / admin123)
echo   - Sample student (john@example.com / student123)
echo.
echo Next step: Run QUICK_START.bat to deploy and run the application
echo.
pause
