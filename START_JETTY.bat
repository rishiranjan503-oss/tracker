@echo off
cls
echo ========================================
echo   SMART TIME WELLNESS - JETTY SERVER
echo ========================================
echo.
echo Starting Jetty on http://localhost:8080/tracker/
echo.
echo Press Ctrl+C to stop the server
echo ========================================
echo.

cd /d C:\Users\Lenovo\OneDrive\Documents\tracker
mvn jetty:run
