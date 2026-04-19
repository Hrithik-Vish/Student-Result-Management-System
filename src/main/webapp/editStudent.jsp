<%@ page import="com.srms.model.Student" %>
<%@ page import="com.srms.dao.StudentDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    request.setAttribute("currentPage", "viewStudents");

    int id = Integer.parseInt(request.getParameter("id"));
    StudentDAO dao = new StudentDAO();
    Student student = dao.getStudentById(id);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Student — SRMS</title>
    <%@ include file="_styles.jsp" %>
</head>
<body>

<div class="app-layout">
    <%@ include file="_sidebar.jsp" %>

    <div class="main-content">
        <div class="topbar">
            <div>
                <div class="topbar-title">Edit Student</div>
                <div class="topbar-sub">Update student record — ID #<%= student.getStudentId() %></div>
            </div>
            <div class="topbar-user">
                <div class="user-avatar"><%= String.valueOf(username.charAt(0)).toUpperCase() %></div>
                <span class="user-name"><%= username %></span>
            </div>
        </div>

        <div class="page-body">
            <div class="form-card">
                <h2>Edit Student Details</h2>

                <form action="updateStudent" method="post">
                    <input type="hidden" name="id" value="<%= student.getStudentId() %>">

                    <div class="form-group">
                        <label for="name">Full Name</label>
                        <input type="text" id="name" name="name" value="<%= student.getName() %>" required>
                    </div>
                    <div class="form-group">
                        <label for="email">Email Address</label>
                        <input type="email" id="email" name="email" value="<%= student.getEmail() %>" required>
                    </div>
                    <div class="form-group">
                        <label for="course">Course / Programme</label>
                        <input type="text" id="course" name="course" value="<%= student.getCourse() %>" required>
                    </div>

                    <button type="submit" class="btn-primary">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" style="width:15px;height:15px;">
                            <path d="M19 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11l5 5v11a2 2 0 0 1-2 2z"/>
                            <polyline points="17 21 17 13 7 13 7 21"/>
                            <polyline points="7 3 7 8 15 8"/>
                        </svg>
                        Save Changes
                    </button>
                </form>

                <a href="viewStudents" class="back-link">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" style="width:14px;height:14px;">
                        <polyline points="15 18 9 12 15 6"/>
                    </svg>
                    Back to Student List
                </a>
            </div>
        </div>
    </div>
</div>

</body>
</html>
