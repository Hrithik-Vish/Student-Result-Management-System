# Student Result Management System

A web-based application developed using **Java Servlets, JSP, and PostgreSQL** that allows administrators to manage student records and results efficiently.

---

## Features

- Admin login authentication
- Add new students
- View student list
- Edit student details
- Delete student records
- Add results for students
- View student results
- Logout functionality

---

## Technologies Used

- Java (Servlets)
- JSP (Java Server Pages)
- JDBC
- PostgreSQL Database
- Apache Tomcat Server
- HTML & CSS

---

## Project Structure

```
StudentResultManagementSystem
│
├── src/main/java/com/srms
│   ├── connection
│   ├── dao
│   ├── model
│   └── servlet
│
├── src/main/webapp
│   ├── login.jsp
│   ├── dashboard.jsp
│   ├── addStudent.jsp
│   ├── viewStudents.jsp
│   ├── editStudent.jsp
│   ├── addResult.jsp
│   ├── viewResults.jsp
│   └── WEB-INF
│       ├── web.xml
│       └── lib
│           └── postgresql-42.x.x.jar
│
├── database
│   └── schema.sql
│
└── README.md
```

---

## Database Setup

1. Create a PostgreSQL database:

```sql
CREATE DATABASE srms;
```

2. Run the SQL commands in `database/schema.sql` to create tables.

3. Insert the default admin user:

```sql
INSERT INTO users(username, password)
VALUES ('admin', 'admin123');
```

---

## Configuration

Open the file:

```
src/main/java/com/srms/connection/DBConnection.java
```

Update the database credentials:

```java
String url = "jdbc:postgresql://localhost:5432/srms";
String username = "postgres";
String password = "your_password_here";
```

---

## Running the Application

1. Import the project into **Eclipse IDE**.
2. Configure **Apache Tomcat Server (v9)**.
3. Add the **PostgreSQL JDBC Driver** to `WEB-INF/lib`.
4. Run the project on Tomcat.

Open the application in your browser:

```
http://localhost:8080/StudentResultManagementSystem/
```

---

## Default Login

```
Username: admin
Password: admin123
```

---

## Test Cases

The system supports the following operations:

1. Login with valid credentials
2. Add new student
3. View students
4. Edit student details
5. Delete student
6. Add student results
7. View results
8. Logout

---

## Author

Developed as part of an **Internet Practices (IP) course project**.
