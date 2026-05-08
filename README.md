# Java Quiz App (Questionify)

![Java](https://img.shields.io/badge/Java-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-00000F?style=for-the-badge&logo=mysql&logoColor=white)
![JSP](https://img.shields.io/badge/JSP-007396?style=for-the-badge&logo=java&logoColor=white)

An interactive and adaptive Java Quiz Web Application built with Java Server Pages (JSP), Servlets, and MySQL. It features dynamic difficulty leveling, a countdown timer, and a modern, premium "Glassmorphism" UI.

## ✨ Features

*   **Adaptive Difficulty Leveling**: Starts at the "EASY" level. Correct answers promote the user to "MEDIUM" and "HARD" levels, keeping the quiz challenging.
*   **Countdown Timer**: A 15-second countdown timer per question. If time runs out, the correct answer is automatically revealed.
*   **Instant Visual Feedback**: Immediate feedback upon submitting an answer (correct answers turn green, incorrect answers turn red while revealing the right answer).
*   **Modern UI**: A sleek dark mode design utilizing CSS glassmorphism for a premium look and feel.
*   **Session Management**: Keeps track of your score and question progress smoothly without requiring continuous logins.

## 🛠️ Tech Stack

*   **Frontend**: HTML, CSS (Custom Glassmorphism), Vanilla JavaScript
*   **Backend**: Java EE (JSP)
*   **Database**: MySQL
*   **Build Tool**: Maven

## 🚀 How to Run Locally

### 1. Database Setup
1. Open your MySQL client (e.g., MySQL Workbench or XAMPP Shell).
2. Execute the provided SQL script to create the database, tables, and sample questions:
   ```bash
   mysql -u root -p < setup_questions.sql
   ```
   *(Alternatively, copy and paste the contents of `setup_questions.sql` directly into your SQL editor).*

### 2. Configure Database Connection
If your MySQL server has a password (or runs on a different port), update the database credentials in the `src/main/webapp/db.jsp` file:
```java
String url = "jdbc:mysql://localhost:3306/questionbank";
String user = "root";
String password = "your_password_here"; // Add your password if you have one
```

### 3. Build and Run
This project was built using NetBeans IDE, but it can be run on any Java EE application server (like Apache Tomcat or GlassFish).
1. Open the project in **NetBeans**.
2. Right-click the project and select **Clean and Build**.
3. Right-click the project and select **Run**.
4. The application will launch in your browser at `http://localhost:8080/Questionify/index.jsp`.

## 🎮 How to Play
1. Click **Start Quiz** on the landing page.
2. Login with the default credentials:
   * **Username**: `admin`
   * **Password**: `admin123`
3. Answer all 12 questions. Good luck!
