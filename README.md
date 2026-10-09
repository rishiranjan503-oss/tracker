# 🎯 Smart Time Management, Goal Setting & Wellness Monitoring System

> **🚀 QUICK START:** Double-click `START.bat` → Wait 60 seconds → Open http://localhost:8080/tracker/  
> **Login:** admin@smartwellness.com / admin123

---

# Smart Time Management, Goal Setting & Wellness Monitoring System

A comprehensive Java web application that combines goal setting, time tracking, wellness monitoring, and productivity analytics into a unified platform for students and professionals.

## Table of Contents

- [Project Description](#project-description)
- [Problem Statement](#problem-statement)
- [Objectives](#objectives)
- [Features](#features)
- [Technology Stack](#technology-stack)
- [System Architecture](#system-architecture)
- [Database Design](#database-design)
- [Installation & Setup](#installation--setup)
- [How to Run](#how-to-run)
- [Login Credentials](#login-credentials)
- [Project Structure](#project-structure)
- [OOP Concepts Used](#oop-concepts-used)
- [JDBC Implementation](#jdbc-implementation)
- [Servlet Implementation](#servlet-implementation)
- [Security Features](#security-features)
- [Future Enhancements](#future-enhancements)

## Project Description

Smart Time & Wellness is a full-stack Java web application that helps students and professionals:
- Set and track personal goals with deadline management
- Log study/work sessions with an integrated timer
- Monitor daily wellness metrics (breaks, exercise, hydration)
- Receive intelligent reminders for approaching deadlines and wellness alerts
- Get personalized productivity recommendations
- Analyze weekly progress with visual charts
- Maintain administrator controls for user and system management

## Problem Statement

Modern students and professionals face several challenges:
- **Poor time management** - Difficulty tracking how time is spent
- **Vague goals** - Lack of clear, measurable objectives
- **No progress tracking** - Unable to visualize goal completion
- **Excessive workload** - Insufficient breaks leading to burnout
- **Limited insights** - No data on productivity patterns
- **Wellness ignored** - Balancing work/study with health often overlooked

## Objectives

1. Provide an intuitive platform for goal creation and management
2. Enable accurate time tracking for study/work sessions
3. Monitor wellness metrics daily
4. Generate intelligent recommendations based on user activity
5. Send timely reminders for goals and wellness alerts
6. Provide administrators with system oversight and configuration control
7. Demonstrate core Java OOP principles in a real-world application
8. Implement secure JDBC database operations

## Features

### User Features
- ✅ Secure registration and login
- ✅ Create, edit, delete personal goals
- ✅ Set targets, deadlines, and categories
- ✅ Time tracking with start/stop/pause controls
- ✅ Record breaks, exercise, and physical activity
- ✅ Monitor daily wellness score
- ✅ View goal progress with completion percentage
- ✅ Receive reminders for approaching/overdue goals
- ✅ Get wellness recommendations
- ✅ View weekly productivity reports with charts
- ✅ Track personal analytics and trends

### Admin Features
- ✅ Secure login with role-based access
- ✅ Manage users (add, edit, activate/deactivate)
- ✅ Configure goal parameters (types, defaults)
- ✅ Configure wellness parameters (targets, weights)
- ✅ View user activity logs
- ✅ Generate system reports
- ✅ Monitor system performance metrics
- ✅ View productivity and wellness statistics

## Technology Stack

| Component | Technology |
|-----------|-----------|
| **Backend** | Java 17+ |
| **Web Framework** | Jetty 11 (Embedded Server) |
| **Web Layer** | Java Servlets & JSP |
| **Database** | MySQL 8+ |
| **JDBC** | MySQL Connector/J 8.0 |
| **Security** | BCrypt (jBCrypt) |
| **Build Tool** | Maven 3.8+ |
| **Frontend** | HTML5, CSS3, JavaScript |
| **IDE** | IntelliJ IDEA / Eclipse / VS Code |

## System Architecture

```
┌─────────────────────────────────────────┐
│         Browser (HTML/CSS/JS)           │
└──────────────────┬──────────────────────┘
                   │
┌──────────────────▼──────────────────────┐
│     Apache Tomcat (Servlet Container)    │
│  ┌────────────────────────────────────┐  │
│  │ Servlets (Controllers)             │  │
│  │ - LoginServlet                     │  │
│  │ - GoalServlet                      │  │
│  │ - TimeTrackingServlet              │  │
│  │ - WellnessServlet                  │  │
│  └────────────────────────────────────┘  │
└──────────────────┬──────────────────────┘
                   │
┌──────────────────▼──────────────────────┐
│         Filters (Security Layer)         │
│  - AuthenticationFilter                  │
│  - AuthorizationFilter                   │
└──────────────────┬──────────────────────┘
                   │
┌──────────────────▼──────────────────────┐
│      Service Layer (Business Logic)      │
│  - UserService                           │
│  - GoalService                           │
│  - TimeTrackingService                   │
│  - WellnessService                       │
│  - RecommendationService                 │
└──────────────────┬──────────────────────┘
                   │
┌──────────────────▼──────────────────────┐
│      DAO Layer (Data Access)             │
│  - UserDAO                               │
│  - GoalDAO                               │
│  - TimeLogDAO                            │
│  - WellnessDAO                           │
│  - ReminderDAO                           │
└──────────────────┬──────────────────────┘
                   │
┌──────────────────▼──────────────────────┐
│    JDBC (Database Connectivity)          │
│  - PreparedStatements                    │
│  - Connection Pooling                    │
│  - Transaction Management                │
└──────────────────┬──────────────────────┘
                   │
┌──────────────────▼──────────────────────┐
│      MySQL Database                      │
│  - Users, Goals, TimeLogs                │
│  - WellnessLogs, Recommendations         │
│  - Reminders, SystemParameters           │
└──────────────────────────────────────────┘
```

## Database Design

### Core Tables

**users** - User information with role-based access
```
id | name | email | password (hashed) | role | status | created_at | updated_at
```

**goals** - User goals with progress tracking
```
id | user_id | goal_name | target | current_progress | deadline | status | category
```

**time_logs** - Time tracking sessions
```
id | user_id | goal_id | activity_type | start_time | end_time | duration_minutes | notes
```

**wellness_logs** - Daily wellness metrics
```
id | user_id | log_date | work_hours | break_minutes | exercise_minutes | water_intake_liters | wellness_score | wellness_status
```

**recommendations** - Personalized recommendations
```
id | user_id | recommendation_text | category | status | created_at | completed_at
```

**reminders** - Goal and wellness reminders
```
id | user_id | goal_id | message | reminder_type | reminder_time | is_read
```

**system_parameters** - Admin configurable settings
```
id | parameter_name | parameter_value | parameter_type | description
```

### Relationships
- Users (1) → Goals (M)
- Users (1) → TimeLogs (M)
- Users (1) → WellnessLogs (M)
- Goals (1) → TimeLogs (M)
- Goals (1) → Reminders (M)

## Installation & Setup

### Prerequisites
- Java JDK 17 or higher
- Apache Tomcat 10+
- MySQL 8+
- Maven 3.8+
- Git

### Step 1: Clone/Download the Project

```bash
cd c:\Users\Lenovo\OneDrive\Documents\tracker
```

### Step 2: Setup MySQL Database

```bash
# Open MySQL Command Line
mysql -u root -p

# Execute database script
source database/database.sql

# Verify database created
USE smart_time_wellness;
SHOW TABLES;
```

### Step 3: Configure Database Connection

Edit `src/main/java/com/smartwellness/dao/DBConnection.java`:

```java
private static final String URL = "jdbc:mysql://localhost:3306/smart_time_wellness";
private static final String USER = "root";
private static final String PASSWORD = "your_password";
```

### Step 4: Build Project with Maven

```bash
mvn clean install
```

This will:
- Download dependencies
- Compile Java source files
- Run tests (if any)
- Create WAR file: `target/SmartTimeWellness-1.0.0.war`

### Step 5: Deploy to Tomcat

**Option A: Using Maven Tomcat Plugin**
```bash
mvn tomcat7:deploy
```

**Option B: Manual Deployment**
1. Copy `target/SmartTimeWellness-1.0.0.war` to `$TOMCAT_HOME/webapps/`
2. Rename to `tracker.war`
3. Tomcat will auto-extract on startup

## How to Run

### ⚡ INSTANT METHOD (Recommended)

1. **Double-click `START.bat`** in File Explorer
2. Wait 30-60 seconds for server startup
3. Access: http://localhost:8080/tracker/

**OR using Command Prompt:**
```cmd
cd C:\Users\Lenovo\OneDrive\Documents\tracker
START.bat
```

### 🔧 Manual Maven Method

```cmd
cd C:\Users\Lenovo\OneDrive\Documents\tracker
mvn jetty:run
```

Then access: http://localhost:8080/tracker/

### 🛑 Stop the Server

Press `Ctrl + C` in the command window and confirm with `Y`

### 📝 Notes

- **No Tomcat installation required!** Uses embedded Jetty server
- **No manual WAR deployment needed!** Maven handles everything
- **First startup**: 2-3 minutes (downloads dependencies)
- **Subsequent startups**: 30-60 seconds
- **MySQL is optional** for initial UI testing

## Login Credentials

### Admin Accounts
| Email | Password | Role |
|-------|----------|------|
| admin@smartwellness.com | admin123 | ADMIN |

### Sample User Accounts
| Email | Password | Role |
|-------|----------|------|
| john@example.com | student123 | USER |
| jane@example.com | student123 | USER |

## Project Structure

```
SmartTimeWellness/
│
├── src/
│   └── main/
│       ├── java/com/smartwellness/
│       │   ├── model/
│       │   │   ├── User.java (abstract)
│       │   │   ├── Admin.java
│       │   │   ├── Student.java
│       │   │   ├── Goal.java
│       │   │   ├── TimeLog.java
│       │   │   ├── WellnessLog.java
│       │   │   ├── Recommendation.java
│       │   │   ├── Reminder.java
│       │   │   └── SystemParameter.java
│       │   │
│       │   ├── dao/
│       │   │   ├── DBConnection.java
│       │   │   ├── UserDAO.java
│       │   │   ├── GoalDAO.java
│       │   │   ├── TimeLogDAO.java
│       │   │   ├── WellnessDAO.java
│       │   │   ├── ReminderDAO.java
│       │   │   └── RecommendationDAO.java
│       │   │
│       │   ├── service/
│       │   │   ├── IUserService.java
│       │   │   ├── UserService.java
│       │   │   ├── IGoalService.java
│       │   │   ├── GoalService.java
│       │   │   └── ... (other services)
│       │   │
│       │   ├── controller/
│       │   │   ├── LoginServlet.java
│       │   │   ├── LogoutServlet.java
│       │   │   ├── RegisterServlet.java
│       │   │   ├── GoalServlet.java
│       │   │   └── ... (other servlets)
│       │   │
│       │   ├── filter/
│       │   │   ├── AuthenticationFilter.java
│       │   │   └── AuthorizationFilter.java
│       │   │
│       │   ├── util/
│       │   │   ├── Constants.java
│       │   │   ├── PasswordUtil.java
│       │   │   └── ValidationUtil.java
│       │   │
│       │   ├── exception/
│       │   │   ├── AuthenticationException.java
│       │   │   ├── UserNotFoundException.java
│       │   │   ├── InvalidGoalException.java
│       │   │   ├── DatabaseException.java
│       │   │   └── ... (other exceptions)
│       │   │
│       │   └── background/
│       │       └── ReminderScheduler.java
│       │
│       └── webapp/
│           ├── index.html
│           ├── login.html
│           ├── register.html
│           ├── error.html
│           │
│           ├── css/
│           │   ├── style.css
│           │   ├── dashboard.css
│           │   └── responsive.css
│           │
│           ├── js/
│           │   ├── app.js
│           │   ├── chart.js
│           │   ├── timer.js
│           │   └── validation.js
│           │
│           ├── user/
│           │   ├── dashboard.jsp
│           │   ├── goals.jsp
│           │   ├── time-tracking.jsp
│           │   ├── wellness.jsp
│           │   ├── progress.jsp
│           │   ├── recommendations.jsp
│           │   └── reports.jsp
│           │
│           ├── admin/
│           │   ├── dashboard.jsp
│           │   ├── users.jsp
│           │   ├── goal-parameters.jsp
│           │   ├── wellness-parameters.jsp
│           │   ├── activity-logs.jsp
│           │   └── reports.jsp
│           │
│           └── WEB-INF/
│               └── web.xml
│
├── database/
│   └── database.sql
│
├── pom.xml
├── .gitignore
└── README.md
```

## OOP Concepts Used

### 1. **Encapsulation**
All model classes use private fields with public getters/setters:
```java
public class Goal {
    private int id;
    private String goalName;
    
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
}
```

### 2. **Inheritance**
User base class with Admin and Student subclasses:
```java
public abstract class User { ... }
public class Admin extends User { ... }
public class Student extends User { ... }
```

### 3. **Polymorphism**
Abstract methods implemented differently in subclasses:
```java
@Override
public String getDashboardType() {
    return "Admin Dashboard";  // Different for each subclass
}
```

### 4. **Abstraction**
Abstract classes and interfaces for service contracts:
```java
public interface IUserService {
    User authenticateUser(String email, String password) throws Exception;
    // ... other methods
}
```

### 5. **Collections & Generics**
Using ArrayList, List with type safety:
```java
List<Goal> goals = new ArrayList<>();
List<User> users = userService.getAllUsers(10, 0);
```

### 6. **Exception Handling**
Custom exceptions for specific error scenarios:
```java
try {
    user = userService.authenticateUser(email, password);
} catch (AuthenticationException e) {
    // Handle authentication error
} catch (DatabaseException e) {
    // Handle database error
}
```

## JDBC Implementation

### Key JDBC Features Used:

1. **PreparedStatements** - Prevents SQL injection:
```java
String sql = "SELECT * FROM users WHERE email = ?";
PreparedStatement stmt = conn.prepareStatement(sql);
stmt.setString(1, email);
```

2. **Connection Management** - Centralized in DBConnection.java:
```java
Connection conn = DBConnection.getConnection();
// ... use connection
DBConnection.closeConnection(conn);
```

3. **ResultSet Mapping** - Converting database rows to objects:
```java
User user = mapResultSetToUser(rs);
```

4. **Batch Operations** - Efficient bulk inserts (where applicable)

5. **Transaction Management** - Ensuring data consistency

## Servlet Implementation

### Servlets Created:

1. **LoginServlet** - User authentication
2. **LogoutServlet** - Session termination
3. **RegisterServlet** - New user registration
4. **GoalServlet** - Goal CRUD operations
5. **TimeTrackingServlet** - Time log management
6. **WellnessServlet** - Wellness data handling
7. **AdminUserServlet** - User management
8. **AdminParameterServlet** - System configuration

### HTTP Methods:
- GET - Retrieve data/display forms
- POST - Submit data/create records

## Security Features

1. **Password Hashing** - BCrypt for secure storage
```java
String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
```

2. **Session Management** - HTTP sessions with timeout
```java
HttpSession session = request.getSession(true);
session.setMaxInactiveInterval(30 * 60); // 30 minutes
```

3. **Authentication Filter** - Protects all pages except login/register

4. **Authorization Checks** - Role-based access control
```java
if ("ADMIN".equals(user.getRole())) {
    // Allow admin access
}
```

5. **PreparedStatements** - Prevents SQL injection

6. **Input Validation** - Server-side validation for all inputs

## Future Enhancements

1. **Mobile Application** - React Native/Flutter mobile apps
2. **Email Notifications** - Send alerts via email
3. **Calendar Integration** - Sync goals with calendar
4. **AI Recommendations** - Machine learning for personalized suggestions
5. **Social Features** - Share goals with friends/groups
6. **Advanced Analytics** - Predictive productivity insights
7. **Cloud Deployment** - AWS/Azure deployment
8. **REST API** - RESTful web services
9. **Progressive Web App** - PWA for offline support
10. **Multi-language Support** - i18n implementation

## Team Members

- Developed as a college project for Java Web Development course

## Contact & Support

For issues or questions, please refer to the project documentation or contact the development team.

---

**Version**: 1.0.0  
**Last Updated**: October 2026  
**License**: MIT
