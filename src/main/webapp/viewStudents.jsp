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
    request.setAttribute("currentPage", "viewStudents");

    StudentDAO dao = new StudentDAO();
    List<Student> students = dao.getAllStudents();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Students — SRMS</title>
    <%@ include file="_styles.jsp" %>
</head>
<body>

<div class="app-layout">
    <%@ include file="_sidebar.jsp" %>

    <div class="main-content">
        <div class="topbar">
            <div>
                <div class="topbar-title">Students</div>
                <div class="topbar-sub"><%= students.size() %> student<%= students.size() != 1 ? "s" : "" %> registered</div>
            </div>
            <div class="topbar-user">
                <div class="user-avatar"><%= String.valueOf(username.charAt(0)).toUpperCase() %></div>
                <span class="user-name"><%= username %></span>
            </div>
        </div>

        <div class="page-body">

            <div style="display:flex;justify-content:flex-end;margin-bottom:1rem;">
                <a href="addStudent.jsp" class="btn-primary" style="width:auto;padding:0.55rem 1.25rem;">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" style="width:14px;height:14px;">
                        <line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/>
                    </svg>
                    Add Student
                </a>
            </div>

            <div class="table-card">
                <div class="table-header">
                    <h2>Student Records</h2>
                    <span class="badge badge-blue"><%= students.size() %> total</span>
                </div>

                <% if (students.isEmpty()) { %>
                <div class="empty-state">
                    <svg viewBox="0 0 24 24" stroke-width="1.5">
                        <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/>
                        <circle cx="9" cy="7" r="4"/>
                        <path d="M23 21v-2a4 4 0 0 0-3-3.87"/>
                        <path d="M16 3.13a4 4 0 0 1 0 7.75"/>
                    </svg>
                    <p>No students registered yet. <a href="addStudent.jsp" style="color:var(--accent);">Add the first one.</a></p>
                </div>
                <% } else { %>
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Course</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Student s : students) { %>
                        <tr>
                            <td><span class="id-chip">#<%= s.getStudentId() %></span></td>
                            <td style="font-weight:500;"><%= s.getName() %></td>
                            <td style="color:var(--text-secondary);"><%= s.getEmail() %></td>
                            <td><span class="badge badge-blue"><%= s.getCourse() %></span></td>
                            <td>
                                <div style="display:flex;gap:8px;">
                                    <a href="editStudent.jsp?id=<%= s.getStudentId() %>" class="btn-edit">
                                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" style="width:12px;height:12px;">
                                            <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"/>
                                            <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"/>
                                        </svg>
                                        Edit
                                    </a>
                                    <a href="deleteStudent?id=<%= s.getStudentId() %>" class="btn-delete"
                                       onclick="return confirm('Delete <%= s.getName() %>? This cannot be undone.')">
                                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" style="width:12px;height:12px;">
                                            <polyline points="3 6 5 6 21 6"/>
                                            <path d="M19 6l-1 14a2 2 0 0 1-2 2H8a2 2 0 0 1-2-2L5 6"/>
                                            <path d="M10 11v6"/><path d="M14 11v6"/>
                                        </svg>
                                        Delete
                                    </a>
                                </div>
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
                <% } %>
            </div>

        </div>
    </div>
</div>

</body>
</html>
