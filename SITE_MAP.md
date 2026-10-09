# 🗺️ Smart Time & Wellness - Complete Site Map

## 📱 Application URLs

After starting the server at http://localhost:8080/tracker/

---

## 🏠 Public Pages

| Page | URL | Description |
|------|-----|-------------|
| **Home** | `/tracker/` or `/tracker/index.html` | Landing page |
| **Login** | `/tracker/login.html` | User login |
| **Register** | `/tracker/register.html` | New user registration |
| **Error** | `/tracker/error.html` | Error page |

---

## 👤 User Pages

Base URL: `/tracker/user/`

| Page | Full URL | Description |
|------|----------|-------------|
| **Dashboard** | `/tracker/user/dashboard.html` | User dashboard with KPIs and charts |
| **Goals** | `/tracker/user/goals.html` | Goal management (Create, Edit, Delete) |
| **Time Tracking** | `/tracker/user/time-tracking.html` | Time tracking with timer |
| **Wellness** | `/tracker/user/wellness.html` | Wellness monitoring (sleep, exercise, etc.) |
| **Recommendations** | `/tracker/user/recommendations.html` | AI-powered recommendations |
| **Reports** | `/tracker/user/reports.html` | Weekly/monthly reports with analytics |
| **Profile** | `/tracker/user/profile.html` | User profile management |
| **Settings** | `/tracker/user/settings.html` | User settings & preferences |

---

## 👨‍💼 Admin Pages

Base URL: `/tracker/admin/`

| Page | Full URL | Description |
|------|----------|-------------|
| **Admin Dashboard** | `/tracker/admin/dashboard.html` | Admin overview with system stats |
| **Users Management** | `/tracker/admin/users.html` | Manage all users (activate/deactivate) |
| **Goal Parameters** | `/tracker/admin/goal-parameters.html` | Configure goal types and defaults |
| **Wellness Parameters** | `/tracker/admin/wellness-parameters.html` | Configure wellness scoring rules |
| **Reports** | `/tracker/admin/reports.html` | System-wide analytics and reports |
| **Settings** | `/tracker/admin/settings.html` | System configuration |

---

## 🔌 API Endpoints

Base URL: `/tracker/api/`

### Authentication
- `POST /api/login` - User login
- `GET /api/logout` - User logout
- `POST /api/register` - New user registration

### Goals
- `GET /api/goals` - Get all user goals
- `POST /api/goals` - Create new goal
- `GET /api/goals/{id}` - Get specific goal
- `PUT /api/goals/{id}` - Update goal
- `DELETE /api/goals/{id}` - Delete goal
- `PUT /api/goals/{id}/progress` - Update goal progress
- `GET /api/goals/category/{category}` - Get goals by category
- `GET /api/goals/status/{status}` - Get goals by status

### Time Tracking
- `GET /api/time-logs` - Get all time logs
- `POST /api/time-logs` - Create time log
- `GET /api/time-logs/{id}` - Get specific time log
- `PUT /api/time-logs/{id}` - Update time log
- `DELETE /api/time-logs/{id}` - Delete time log
- `POST /api/time-logs/start` - Start timer
- `POST /api/time-logs/stop` - Stop timer
- `GET /api/time-logs/active` - Get active timer

### Wellness
- `GET /api/wellness` - Get all wellness logs
- `POST /api/wellness` - Create wellness log
- `GET /api/wellness/{id}` - Get specific log
- `PUT /api/wellness/{id}` - Update wellness log
- `DELETE /api/wellness/{id}` - Delete wellness log
- `GET /api/wellness/score` - Calculate wellness score
- `GET /api/wellness/trends` - Get wellness trends

### Recommendations
- `GET /api/recommendations` - Get all recommendations
- `POST /api/recommendations` - Create recommendation
- `GET /api/recommendations/{id}` - Get specific recommendation
- `PUT /api/recommendations/{id}/complete` - Mark as completed
- `DELETE /api/recommendations/{id}` - Delete recommendation
- `GET /api/recommendations/category/{category}` - Get by category

### Reminders
- `GET /api/reminders` - Get all reminders
- `POST /api/reminders` - Create reminder
- `GET /api/reminders/{id}` - Get specific reminder
- `PUT /api/reminders/{id}/read` - Mark as read
- `DELETE /api/reminders/{id}` - Delete reminder
- `GET /api/reminders/unread` - Get unread reminders

### Dashboard
- `GET /api/dashboard/summary` - Get dashboard summary stats
- `GET /api/dashboard/recent-activity` - Get recent activities
- `GET /api/dashboard/weekly-stats` - Get weekly statistics

### Admin - Users
- `GET /api/admin/users` - Get all users (paginated)
- `POST /api/admin/users` - Create new user
- `GET /api/admin/users/{id}` - Get specific user
- `PUT /api/admin/users/{id}` - Update user
- `DELETE /api/admin/users/{id}` - Delete user
- `PUT /api/admin/users/{id}/status` - Activate/deactivate user
- `PUT /api/admin/users/{id}/password` - Reset user password
- `GET /api/admin/users/search` - Search users

### Admin - Parameters
- `GET /api/admin/parameters` - Get all system parameters
- `PUT /api/admin/parameters/{id}` - Update parameter
- `POST /api/admin/parameters` - Create parameter
- `DELETE /api/admin/parameters/{id}` - Delete parameter

### Admin - Reports
- `GET /api/admin/reports/users-summary` - User statistics
- `GET /api/admin/reports/goals-summary` - Goal statistics
- `GET /api/admin/reports/time-summary` - Time tracking stats
- `GET /api/admin/reports/wellness-summary` - Wellness stats
- `GET /api/admin/reports/activity-logs` - System activity logs
- `GET /api/admin/reports/export` - Export reports (CSV/PDF)

---

## 📂 File Structure

```
webapp/
├── index.html              ← Landing page
├── login.html             ← Login page
├── register.html          ← Registration page
├── error.html             ← Error page
│
├── user/                  ← User pages
│   ├── dashboard.html
│   ├── goals.html
│   ├── time-tracking.html
│   ├── wellness.html
│   ├── recommendations.html
│   ├── reports.html
│   ├── profile.html
│   └── settings.html
│
└── admin/                 ← Admin pages
    ├── dashboard.html
    ├── users.html
    ├── goal-parameters.html
    ├── wellness-parameters.html
    ├── reports.html
    └── settings.html
```

---

## 🔐 Access Control

### Public Access
- `/tracker/`
- `/tracker/login.html`
- `/tracker/register.html`
- `/tracker/error.html`

### Requires Login (USER role)
- All `/tracker/user/*` pages
- All user API endpoints

### Requires Admin (ADMIN role)
- All `/tracker/admin/*` pages
- All admin API endpoints

---

## 🎯 Navigation Flow

### First Time User
1. `/tracker/` (Landing) → `login.html`
2. `login.html` → Click "Register" → `register.html`
3. `register.html` → Submit form → `login.html`
4. `login.html` → Login → `/user/dashboard.html`

### Returning User
1. `/tracker/` → `login.html`
2. `login.html` → Login → `/user/dashboard.html` or `/admin/dashboard.html`

### User Dashboard Navigation
All accessible from sidebar:
- Dashboard (home)
- Goals
- Time Tracking
- Wellness
- Recommendations
- Reports
- Profile
- Settings
- Logout

### Admin Dashboard Navigation
All accessible from sidebar:
- Dashboard
- Users Management
- Goal Parameters
- Wellness Parameters
- Reports
- Settings
- Logout

---

## 🌐 Quick Access Links

After starting server with `START.bat`:

### For Testing:
```
http://localhost:8080/tracker/
http://localhost:8080/tracker/login.html
http://localhost:8080/tracker/user/dashboard.html
http://localhost:8080/tracker/admin/dashboard.html
```

### Login Credentials:
**Admin:**
- URL: http://localhost:8080/tracker/login.html
- Email: admin@smartwellness.com
- Password: admin123

**User:**
- URL: http://localhost:8080/tracker/login.html
- Email: john@example.com
- Password: student123

---

## 🔄 Page Connections

### User Pages - All pages have sidebar navigation to:
- Dashboard ✅
- Goals ✅
- Time Tracking ✅
- Wellness ✅
- Recommendations ✅
- Reports ✅
- Profile ✅
- Settings ✅
- Logout ✅

### Admin Pages - All pages have sidebar navigation to:
- Dashboard ✅
- Users ✅
- Goal Parameters ✅
- Wellness Parameters ✅
- Reports ✅
- Settings ✅
- Logout ✅

---

## 📊 Total Pages: 18

### Public: 4 pages
- index.html
- login.html
- register.html
- error.html

### User: 8 pages
- dashboard.html
- goals.html
- time-tracking.html
- wellness.html
- recommendations.html
- reports.html
- profile.html
- settings.html

### Admin: 6 pages
- dashboard.html
- users.html
- goal-parameters.html
- wellness-parameters.html
- reports.html
- settings.html

---

## ✅ All Pages Are Connected!

Every page has navigation to access other pages in its section. Users can seamlessly move between:
- Dashboard → Goals → Time Tracking → Wellness → Recommendations → Reports → Profile → Settings
- Admin Dashboard → Users → Parameters → Reports → Settings

**Navigation Method:** Sidebar menu (always visible)  
**URL Format:** Clean HTML file paths (no hash routing)  
**API Integration:** All forms and buttons call appropriate API endpoints

---

*Site map last updated: October 6, 2026*
*Total Endpoints: 60+*
*All pages fully connected and navigable*
