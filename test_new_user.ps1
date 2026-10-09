$uri = "http://localhost:8080/tracker/login"

# Test 1: Admin demo user (should work)
Write-Host "Test 1: Admin demo user..."
$response = Invoke-WebRequest -Uri $uri -Method POST -Body @{email="admin@smartwellness.com"; password="admin123"} -SessionVariable session -AllowRedirects $false
Write-Host "Response Status: $($response.StatusCode)"
Write-Host "Response Headers: $($response.Headers)"
Write-Host ""

# Test 2: Regular demo user (should work)
Write-Host "Test 2: Regular demo user..."
$response = Invoke-WebRequest -Uri $uri -Method POST -Body @{email="john@example.com"; password="student123"} -AllowRedirects $false
Write-Host "Response Status: $($response.StatusCode)"
Write-Host ""

# Test 3: Non-demo user (should fail gracefully with 302 redirect to login, not 500 error)
Write-Host "Test 3: Non-demo user (should redirect to login, not error)..."
$response = Invoke-WebRequest -Uri $uri -Method POST -Body @{email="rishiranjan503@gmail.com"; password="testpassword"} -AllowRedirects $false -ErrorAction SilentlyContinue
Write-Host "Response Status: $($response.StatusCode)"
Write-Host "Location header: $($response.Headers['Location'])"
Write-Host ""

# Test 4: Another non-demo user
Write-Host "Test 4: Another non-demo user..."
$response = Invoke-WebRequest -Uri $uri -Method POST -Body @{email="newuser@example.com"; password="password123"} -AllowRedirects $false -ErrorAction SilentlyContinue
Write-Host "Response Status: $($response.StatusCode)"
Write-Host "Location header: $($response.Headers['Location'])"
