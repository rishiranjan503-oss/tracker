@echo off
cls
echo ========================================
echo   SMART TIME WELLNESS - STARTING
echo ========================================
echo.
echo Starting server on http://localhost:8080/tracker/
echo Please wait 30-60 seconds for first startup...
echo.
echo Press Ctrl+C to stop the server
echo ========================================
echo.

cd /d C:\Users\Lenovo\OneDrive\Documents\tracker
mvn clean compile -DskipTests
if %errorlevel% equ 0 (
    mvn jetty:run
) else (
    echo.
    echo Compilation failed! Please check errors above.
    pause
)
