# Setup Guide - Smart Time & Wellness System

Complete step-by-step setup instructions to get the application running locally.

## Prerequisites

Before you begin, make sure you have:
- **Java JDK 17 or higher** - Download from https://www.oracle.com/java/technologies/javase/jdk17-archive-downloads.html
- **Apache Tomcat 10+** - Download from https://tomcat.apache.org/download-10.cgi
- **MySQL 8+** - Download from https://dev.mysql.com/downloads/mysql/
- **Maven 3.8+** - Download from https://maven.apache.org/download.cgi (or use IDE's built-in Maven)
- **Git** - (Optional) For version control - https://git-scm.com/

## Step 1: Verify Java Installation

```bash
# Open Command Prompt / PowerShell and verify Java
java -version

# Expected output: Java version 17 or higher
# Example: openjdk version "17.0.1" 2021-10-19
```

## Step 2: Verify Tomcat Installation

```bash
# Navigate to Tomcat directory
cd C:\path\to\apache-tomcat-10.x

# Check if bin folder exists
dir bin

# You should see startup.bat or startup.sh
```

## Step 3: Verify MySQL Installation

```bash
# Test MySQL connection
mysql -u root -p

# If connected, you'll see mysql> prompt
# Type exit to quit

# Or test without entering password (if no password set)
mysql -u root
```

## Step 4: Create Database

```bash
# Open MySQL Command Line
mysql -u root -p

# Paste the database.sql content and execute it
# Or execute from file:
SOURCE C:\path\to\tracker\database\database.sql;

# Verify database creation
USE smart_time_wellness;
SHOW TABLES;

# You should see 9 tables created
```

## Step 5: Configure Database Connection (Important!)

Edit file: `src/main/java/com/smartwellness/dao/DBConnection.java`

```java
private static final String URL = "jdbc:mysql://localhost:3306/smart_time_wellness";
private static final String USER = "root";
private static final String PASSWORD = "";  // Your MySQL password here
```

**Example if you set a password:**
```java
private static final String PASSWORD = "your_password_123";
```

## Step 6: Build Project with Maven

```bash
# Navigate to project directory
cd C:\Users\Lenovo\OneDrive\Documents\tracker

# Clean and build
mvn clean install

# Or with skipping tests (faster):
mvn clean install -DskipTests

# Wait for build to complete
# You should see: BUILD SUCCESS
# WAR file created at: target/SmartTimeWellness-1.0.0.war
```

**If Maven is not found:**
- Add Maven to PATH environment variable
- Or use IDE (IntelliJ/Eclipse) which has built-in Maven

## Step 7: Deploy Application

### Option A: Manual Deployment (Recommended)

1. Copy WAR file:
```bash
# From
C:\Users\Lenovo\OneDrive\Documents\tracker\target\SmartTimeWellness-1.0.0.war

# To
C:\apache-tomcat-10.x\webapps\tracker.war
```

2. Rename WAR file to `tracker.war` (already done above)

### Option B: Using Tomcat Manager (Alternative)

1. Start Tomcat
2. Navigate to http://localhost:8080/manager
3. Upload WAR file
4. Deploy

## Step 8: Start MySQL Server

### Windows
```bash
# Command Prompt (as Administrator)
net start MySQL80

# Or via Services:
# 1. Press Win + R
# 2. Type services.msc
# 3. Find MySQL80 and click Start
```

### macOS/Linux
```bash
sudo service mysql start
```

## Step 9: Start Apache Tomcat

### Windows
```bash
# Navigate to Tomcat bin directory
cd C:\apache-tomcat-10.x\bin

# Run startup batch file
startup.bat

# A command window will open - leave it running
# Check for message: "Server startup in X ms"
```

### macOS/Linux
```bash
# Navigate to Tomcat bin directory
cd ~/apache-tomcat-10.x/bin

# Run startup script
./startup.sh

# Or with nohup to keep running
nohup ./startup.sh > catalina.out 2>&1 &
```

## Step 10: Access Application

1. Open your web browser
2. Navigate to: **http://localhost:8080/tracker/**
3. You should see the homepage with Login and Register options

## Step 11: Test Login

### Admin Account
- **Email**: admin@smartwellness.com
- **Password**: admin123

### User Account
- **Email**: john@example.com
- **Password**: student123

## Troubleshooting

### Issue: "Connection refused" error

**Solution 1**: Check if MySQL is running
```bash
# Windows
net start MySQL80

# macOS/Linux
sudo service mysql start
```

**Solution 2**: Verify database credentials in DBConnection.java
```java
private static final String USER = "root";  // Your username
private static final String PASSWORD = "";   // Your password
```

### Issue: "404 Not Found" when accessing application

**Solutions**:
1. Check if Tomcat is running - you should see a command window
2. Verify WAR file is in `webapps/` folder and named `tracker.war`
3. Wait 10-15 seconds for Tomcat to auto-deploy the application
4. Check Tomcat logs: `logs/catalina.out`

### Issue: Port 8080 already in use

**Solution**: Change Tomcat port in `conf/server.xml`
```xml
<!-- Find and change -->
<Connector port="8080" ... />
<!-- To -->
<Connector port="8081" ... />

<!-- Then access: http://localhost:8081/tracker/ -->
```

### Issue: Maven build fails

**Solutions**:
1. Ensure Java is installed and in PATH
```bash
java -version
```

2. Ensure Maven is installed and in PATH
```bash
mvn -version
```

3. Clear Maven cache and rebuild
```bash
mvn clean install -X -DskipTests
```

### Issue: Can't login (Authentication fails)

**Possible causes**:
1. Database not initialized (did you run database.sql?)
2. Wrong database credentials in DBConnection.java
3. User doesn't exist - try demo credentials

**Check**:
```bash
mysql -u root -p
USE smart_time_wellness;
SELECT * FROM users;
# Should show 1 admin + 2 sample users
```

### Issue: Build error - "JAVA_HOME not set"

**Solution**:
```bash
# Set JAVA_HOME environment variable
# Windows: Control Panel > Environment Variables
# Add new variable:
JAVA_HOME = C:\Program Files\Java\jdk-17

# Then rebuild
mvn clean install
```

## After Successful Setup

### First Time Tips:
1. **Explore Admin Dashboard**: Login with admin account
2. **Create a Goal**: Create your first goal with 20+ hours target
3. **Start Time Session**: Use time tracker to log study session
4. **Log Wellness Data**: Record breaks, exercise, water intake
5. **Check Reports**: View weekly productivity charts

### Running Again Later:
```bash
# 1. Start MySQL
net start MySQL80

# 2. Start Tomcat
C:\apache-tomcat-10.x\bin\startup.bat

# 3. Access application
# http://localhost:8080/tracker/

# To stop Tomcat:
C:\apache-tomcat-10.x\bin\shutdown.bat
```

## Project Directory Structure

```
C:\Users\Lenovo\OneDrive\Documents\tracker\
├── src/                          # Java source code
│   └── main/
│       ├── java/com/smartwellness/
│       │   ├── model/           # Data models
│       │   ├── dao/             # Database access
│       │   ├── service/         # Business logic
│       │   ├── controller/      # Servlets
│       │   ├── filter/          # Security filters
│       │   ├── util/            # Utilities
│       │   └── exception/       # Custom exceptions
│       └── webapp/
│           ├── index.html       # Homepage
│           ├── login.html
│           ├── register.html
│           ├── user/            # User pages
│           ├── admin/           # Admin pages
│           └── WEB-INF/web.xml  # Web configuration
│
├── database/
│   └── database.sql            # Database initialization script
│
├── target/                      # Build output
│   └── SmartTimeWellness-1.0.0.war
│
├── pom.xml                      # Maven configuration
├── README.md                    # Project documentation
├── VIVA_QUESTIONS.md           # Viva preparation
├── SETUP_GUIDE.md              # This file
└── .gitignore                  # Git ignore file
```

## Ports Used

| Service | Port | URL |
|---------|------|-----|
| Tomcat | 8080 | http://localhost:8080/tracker/ |
| MySQL | 3306 | localhost:3306 |

## Common Commands

```bash
# Build project
mvn clean install

# Build without tests (faster)
mvn clean install -DskipTests

# Run tests
mvn test

# View Maven help
mvn help

# Start Tomcat (Windows)
C:\apache-tomcat-10.x\bin\startup.bat

# Stop Tomcat (Windows)
C:\apache-tomcat-10.x\bin\shutdown.bat

# View Tomcat logs (Windows)
type C:\apache-tomcat-10.x\logs\catalina.out

# Connect to MySQL
mysql -u root -p

# Create database from script
mysql -u root -p smart_time_wellness < database/database.sql
```

## Next Steps

1. ✅ Setup complete?
2. 📝 Review README.md for features
3. 💻 Explore the codebase
4. 🧪 Create test goals and sessions
5. 📊 Check analytics and reports
6. 📚 Read VIVA_QUESTIONS.md for understanding
7. 🎯 Prepare for project presentation

## Support

If you encounter issues:
1. Check the Troubleshooting section above
2. Review README.md for detailed information
3. Check Tomcat logs: `logs/catalina.out`
4. Verify MySQL is running and database is created
5. Ensure Java and Maven versions are correct

---

**Happy Coding! 🚀**

Good luck with your project presentation and viva examination!
