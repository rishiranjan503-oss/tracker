# 🚀 HOW TO RUN YOUR APPLICATION

## ⚡ ONE-CLICK START (Easiest Method)

### ✅ Windows File Explorer Method:
1. Open File Explorer
2. Navigate to: `C:\Users\Lenovo\OneDrive\Documents\tracker`
3. **Double-click** `START.bat`
4. Wait 30-60 seconds for first startup
5. Access: http://localhost:8080/tracker/

### ✅ Command Prompt Method:
1. Press `Windows Key + R`
2. Type: `cmd` and press Enter
3. Copy and paste this command:
```cmd
cd C:\Users\Lenovo\OneDrive\Documents\tracker && START.bat
```
4. Wait 30-60 seconds
5. Access: http://localhost:8080/tracker/

---

## 🔐 LOGIN CREDENTIALS

### Admin Account:
- **Email:** admin@smartwellness.com
- **Password:** admin123
- **Access:** Full admin dashboard, user management, reports

### Test User Account:
- **Email:** john@example.com
- **Password:** student123
- **Access:** Regular user features

---

## ⚡ WHAT HAPPENS WHEN YOU RUN START.bat

1. Maven downloads Jetty embedded server (first time only - takes 2-3 minutes)
2. Maven compiles your Java code
3. Jetty starts and deploys your application
4. Server runs on port 8080 at path `/tracker`
5. You can access: http://localhost:8080/tracker/

---

## 🛑 HOW TO STOP THE SERVER

Press `Ctrl + C` in the command window and confirm with `Y`

---

## 🔧 TROUBLESHOOTING

### Problem: "mvn is not recognized"
**Solution:** Maven is not in PATH. Run this first:
```cmd
set PATH=%PATH%;C:\Program Files\apache-maven-3.10.0\bin
```

### Problem: Port 8080 already in use
**Solution:** Another application is using port 8080. Options:
1. Stop other applications using port 8080
2. Or modify `pom.xml` to use different port (search for `<port>8080</port>`)

### Problem: MySQL Connection Errors (Optional)
**Note:** MySQL is NOT required to run the application initially. The app will work without database for testing UI.

To setup database later:
1. Install MySQL 8.0+ or XAMPP
2. Run: `SETUP_DATABASE.bat`
3. Restart the application

### Problem: Java Version Error
**Solution:** Make sure Java 21 is installed and in PATH:
```cmd
java -version
```
Should show: `java version "21.x.x"`

---

## 📁 PROJECT STRUCTURE

```
tracker/
├── START.bat          ← DOUBLE CLICK THIS TO RUN
├── pom.xml           ← Maven configuration (has Jetty plugin)
├── src/
│   ├── main/
│   │   ├── java/     ← Backend (12 Servlets, 8 DAOs)
│   │   └── webapp/   ← Frontend (HTML, CSS, JS)
└── database/         ← MySQL schema
```

---

## 🎯 QUICK START SUMMARY

**Fastest way to run:**
```
Double-click START.bat → Wait 60 seconds → Access http://localhost:8080/tracker/
```

**Manual Maven command:**
```cmd
cd C:\Users\Lenovo\OneDrive\Documents\tracker
mvn jetty:run
```

---

## 📊 FEATURES AVAILABLE

✅ **User Authentication**
- Login/Logout
- Registration
- Password hashing (BCrypt)

✅ **Goal Management**
- Create, Read, Update, Delete goals
- Goal categories
- Progress tracking

✅ **Time Tracking**
- Start/Stop timer
- Time logs per activity
- Daily/Weekly/Monthly reports

✅ **Wellness Monitoring**
- Sleep tracking
- Exercise logging
- Stress levels
- Diet tracking
- Wellness score calculation

✅ **Smart Recommendations**
- AI-powered suggestions
- Category-based recommendations

✅ **Reminders System**
- Scheduled reminders
- Background processing

✅ **Admin Dashboard**
- User management
- System parameters
- Analytics and reports

✅ **60+ REST API Endpoints**
- Full JSON API
- AJAX-ready frontend

---

## 🌐 ACCESS URLS

- **Main App:** http://localhost:8080/tracker/
- **Login:** http://localhost:8080/tracker/login.html
- **Register:** http://localhost:8080/tracker/register.html
- **Dashboard:** http://localhost:8080/tracker/dashboard.html
- **Admin:** http://localhost:8080/tracker/admin-dashboard.html

---

## ⚠️ IMPORTANT NOTES

1. **First startup takes 2-3 minutes** (Maven downloads dependencies)
2. **Subsequent startups take 30-60 seconds**
3. **Don't close the command window** - that stops the server
4. **Database is optional** for initial testing
5. **Use Command Prompt (cmd.exe)**, not PowerShell (PowerShell has issues on your system)

---

## 📞 NEED HELP?

If START.bat doesn't work:
1. Make sure you're using **Command Prompt** (not PowerShell)
2. Check Java is installed: `java -version`
3. Check Maven is installed: `mvn -version`
4. Try running manually: `cd C:\Users\Lenovo\OneDrive\Documents\tracker` then `mvn jetty:run`

---

**You're all set! Just double-click START.bat and you're running! 🎉**
