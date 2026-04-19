<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    request.setAttribute("currentPage", "addStudent");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Student — SRMS</title>
    <%@ include file="_styles.jsp" %>
</head>
<body>

<div class="app-layout">
    <%@ include file="_sidebar.jsp" %>

    <div class="main-content">
        <div class="topbar">
            <div>
                <div class="topbar-title">Add Student</div>
                <div class="topbar-sub">Register a new student record</div>
            </div>
            <div class="topbar-user">
                <div class="user-avatar"><%= String.valueOf(username.charAt(0)).toUpperCase() %></div>
                <span class="user-name"><%= username %></span>
            </div>
        </div>

        <div class="page-body">
            <div class="form-card">
                <h2>Student Information</h2>

                <form action="addStudent" method="post">
                    <div class="form-group">
                        <label for="name">Full Name</label>
                        <input type="text" id="name" name="name" placeholder="e.g. Riya Sharma" required>
                    </div>
                    <div class="form-group">
                        <label for="email">Email Address</label>
                        <input type="email" id="email" name="email" placeholder="e.g. riya@example.com" required>
                    </div>
                    <div class="form-group">
                        <label for="course">Course / Programme</label>
                        <input type="text" id="course" name="course" placeholder="e.g. B.Tech Computer Science" required>
                    </div>

                    <button type="submit" class="btn-primary green">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" style="width:15px;height:15px;">
                            <path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2"/>
                            <circle cx="9" cy="7" r="4"/>
                            <line x1="19" y1="8" x2="19" y2="14"/><line x1="22" y1="11" x2="16" y2="11"/>
                        </svg>
                        Register Student
                    </button>
                </form>

                <a href="dashboard.jsp" class="back-link">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" style="width:14px;height:14px;">
                        <polyline points="15 18 9 12 15 6"/>
                    </svg>
                    Back to Dashboard
                </a>
            </div>
        </div>
    </div>
</div>

</body>
</html>
