<%@ page import="java.util.List" %>
<%@ page import="com.srms.model.Student" %>
<%@ page import="com.srms.dao.StudentDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    request.setAttribute("currentPage", "addResult");

    StudentDAO dao = new StudentDAO();
    List<Student> students = dao.getAllStudents();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Result — SRMS</title>
    <%@ include file="_styles.jsp" %>
</head>
<body>

<div class="app-layout">
    <%@ include file="_sidebar.jsp" %>

    <div class="main-content">
        <div class="topbar">
            <div>
                <div class="topbar-title">Add Result</div>
                <div class="topbar-sub">Log marks for a student subject</div>
            </div>
            <div class="topbar-user">
                <div class="user-avatar"><%= String.valueOf(username.charAt(0)).toUpperCase() %></div>
                <span class="user-name"><%= username %></span>
            </div>
        </div>

        <div class="page-body">
            <div class="form-card">
                <h2>Result Entry</h2>

                <form action="addResult" method="post">
                    <div class="form-group">
                        <label for="studentId">Select Student</label>
                        <select id="studentId" name="studentId" required>
                            <option value="">— Choose a student —</option>
                            <%
                                for (Student s : students) {
                            %>
                            <option value="<%= s.getStudentId() %>">
                                <%= s.getName() %> &nbsp;(ID: <%= s.getStudentId() %>)
                            </option>
                            <%
                                }
                            %>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="subject">Subject</label>
                        <input type="text" id="subject" name="subject" placeholder="e.g. Data Structures" required>
                    </div>
                    <div class="form-group">
                        <label for="marks">Marks Obtained</label>
                        <input type="number" id="marks" name="marks" placeholder="e.g. 87" min="0" max="100" required>
                    </div>

                    <button type="submit" class="btn-primary green">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" style="width:15px;height:15px;">
                            <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/>
                            <polyline points="14 2 14 8 20 8"/>
                            <line x1="12" y1="18" x2="12" y2="12"/>
                            <line x1="9" y1="15" x2="15" y2="15"/>
                        </svg>
                        Submit Result
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
