@echo off
REM Test login with curl
REM The -i flag shows response headers including redirect location
REM The -c flag saves cookies to a file (simulating session)
curl -i -c cookies.txt -d "email=admin@smartwellness.com&password=admin123" http://localhost:8080/tracker/login
echo.
echo Response headers above. Session cookie should be in cookies.txt
type cookies.txt
