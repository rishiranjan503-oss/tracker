# TRACKER - Quick Start Guide

## 🚀 Start the Application

### Option 1: Double-click START.bat
```
START.bat (in the tracker folder)
```

### Option 2: Manual Start
```bash
mvn clean jetty:run
```

**Wait 30-60 seconds for the first startup**

---

## 🌐 Access the Application

**Open your browser and go to:**
```
http://localhost:8080/tracker/
```

---

## 📖 How It Works

### 1. Landing Page (index.html)
You'll see the TRACKER homepage with 8 quick-access buttons:

```
┌─────────────┐  ┌──────────────┐  ┌──────────┐  ┌──────────────┐
│  Sign In    │  │   Register   │  │  Goals   │  │ Time Tracking│
├─────────────┤  ├──────────────┤  ├──────────┤  ├──────────────┤
│             │  │              │  │          │  │              │
│  Login      │  │ New Account  │  │ Manage   │  │ Track Hours  │
│             │  │              │  │ Goals    │  │              │
└─────────────┘  └──────────────┘  └──────────┘  └──────────────┘

┌─────────────┐  ┌──────────────┐  ┌──────────┐  ┌──────────────┐
│  Wellness   │  │   Reports    │  │Dashboard │  │    Admin     │
├─────────────┤  ├──────────────┤  ├──────────┤  ├──────────────┤
│             │  │              │  │          │  │              │
│  Health     │  │  Analytics   │  │ Main     │  │ Admin Panel  │
│  Monitor    │  │              │  │ Workspace│  │              │
└─────────────┘  └──────────────┘  └──────────┘  └──────────────┘
```

---

## 🔑 Login & Access

### Demo Credentials

**Admin Account (Full Access):**
- Email: `admin@smartwellness.com`
- Password: `admin123`
- Access: All pages + Admin panel

**User Account (Limited Access):**
- Email: `john@example.com`
- Password: `student123`
- Access: All pages except admin

---

## 📍 Navigation Flow

### Before Login
```
index.html (Landing)
    ↓
    ├─→ Sign In → login.html → Dashboard (after login)
    ├─→ Register → register.html
    ├─→ Goals → goals.html (preview mode)
    ├─→ Time Tracking → time-tracking.html (preview mode)
    ├─→ Wellness → wellness.html (preview mode)
    ├─→ Reports → reports.html (preview mode)
    ├─→ Dashboard → dashboard.html (requires login - redirects to login)
    └─→ Admin → admin-dashboard.html (requires admin login)
```

### After Login
```
Dashboard or Admin Panel
    ↓
    ├─→ Goals (full access)
    ├─→ Time Tracking (full access)
    ├─→ Wellness (full access)
    ├─→ Reports (full access)
    ├─→ Logout (back to login.html)
    └─→ Admin Panel (if admin user)
```

---

## ✨ What Works

| Feature | Status | Notes |
|---------|--------|-------|
| Landing Page | ✅ | 8-button navigation hub |
| Sign In | ✅ | Form with demo credentials |
| Registration | ✅ | Create new user account |
| Goals Page | ✅ | View & manage goals |
| Time Tracking | ✅ | Log hours & track time |
| Wellness Tracking | ✅ | Health monitoring |
| Reports | ✅ | View analytics & reports |
| Dashboard | ✅ | Main workspace (after login) |
| Admin Panel | ✅ | Manage users (admin only) |
| Mobile Support | ✅ | Fully responsive |
| Session Management | ✅ | 30-minute timeout |

---

## 🎯 Quick Test

1. **Open**: http://localhost:8080/tracker/
2. **See**: TRACKER landing page
3. **Click**: Any button on the page
4. **Result**: Goes to that specific page
5. **Try Login**: 
   - Click "Sign In"
   - Use: admin@smartwellness.com / admin123
   - Get: Full access to all features

---

## 🛠️ Troubleshooting

### Page Shows Error
- **Clear Browser Cache**: Ctrl+Shift+Delete, select "All time"
- **Hard Refresh**: Ctrl+F5 (Windows) or Cmd+Shift+R (Mac)
- **Close all tabs** with localhost
- Try again

### Server Won't Start
```bash
# Check if port 8080 is in use
netstat -ano | findstr :8080

# Kill the process (replace PID with actual number)
taskkill /PID <PID> /F

# Try starting again
mvn clean jetty:run
```

### Login Not Working
- Verify credentials: admin@smartwellness.com / admin123
- Check server is running (should see Jetty logs)
- Try different user: john@example.com / student123

---

## 📱 Mobile Access

### From Same Computer
- Phone on same WiFi: `http://<YOUR_COMPUTER_IP>:8080/tracker/`
- Find IP: Open command prompt and type `ipconfig`
- Look for "IPv4 Address" (usually 192.168.x.x)

### Example
```
Computer IP: 192.168.1.100
Phone access: http://192.168.1.100:8080/tracker/
```

---

## 🔐 Demo User Accounts

All accounts are pre-configured. No database needed.

```
Admin Account:
  Email: admin@smartwellness.com
  Password: admin123
  Role: ADMIN
  Status: Active

User Accounts:
  john@example.com / student123 (USER)
  jane@example.com / student123 (USER)
  mike@example.com / student123 (USER)
  sarah@example.com / student123 (USER)
```

---

## 📊 Features Overview

### Goals Module
- Create personal and professional goals
- Set deadlines and priorities
- Track progress
- View goal history

### Time Tracking
- Log daily activities
- Track hours spent
- Categorize work
- Generate time reports

### Wellness Module
- Monitor exercise
- Track water intake
- Log sleep hours
- Monitor mental health
- Get wellness recommendations

### Reports & Analytics
- View goal completion rate
- Time allocation analysis
- Wellness trends
- Performance metrics
- Export reports

### Admin Panel (Admin Only)
- Manage all users
- View system statistics
- Configure parameters
- Generate admin reports

---

## 🔄 Session Info

- **Session Timeout**: 30 minutes of inactivity
- **Session Storage**: Server-side cookies
- **Security**: HTTP-only cookies
- **Automatic Logout**: After 30 minutes idle

---

## 📞 Need Help?

1. **Check server logs** - Look at terminal output for errors
2. **Hard refresh browser** - Ctrl+F5
3. **Restart server** - Stop and run `mvn clean jetty:run` again
4. **Check file permissions** - Ensure files are readable
5. **Verify port 8080** - Not blocked by firewall

---

**Ready to get started? Open http://localhost:8080/tracker/ now!** 🎉

