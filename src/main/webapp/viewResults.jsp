<%@ page import="java.sql.*" %>
<%@ page import="com.srms.connection.DBConnection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    request.setAttribute("currentPage", "viewResults");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Results — SRMS</title>
    <%@ include file="_styles.jsp" %>
</head>
<body>

<div class="app-layout">
    <%@ include file="_sidebar.jsp" %>

    <div class="main-content">
        <div class="topbar">
            <div>
                <div class="topbar-title">Results</div>
                <div class="topbar-sub">All student result records</div>
            </div>
            <div class="topbar-user">
                <div class="user-avatar"><%= String.valueOf(username.charAt(0)).toUpperCase() %></div>
                <span class="user-name"><%= username %></span>
            </div>
        </div>

        <div class="page-body">

            <div style="display:flex;justify-content:flex-end;margin-bottom:1rem;">
                <a href="addResult.jsp" class="btn-primary" style="width:auto;padding:0.55rem 1.25rem;">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" style="width:14px;height:14px;">
                        <line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/>
                    </svg>
                    Add Result
                </a>
            </div>

            <div class="table-card">
                <div class="table-header">
                    <h2>Result Records</h2>
                </div>

                <table>
                    <thead>
                        <tr>
                            <th>Student ID</th>
                            <th>Name</th>
                            <th>Subject</th>
                            <th>Marks</th>
                            <th>Grade</th>
                        </tr>
                    </thead>
                    <tbody>

<%
    boolean hasResults = false;
    try {
        Connection con = DBConnection.getConnection();
        String query = "SELECT s.student_id, s.name, r.subject, r.marks "
                     + "FROM students s "
                     + "JOIN results r ON s.student_id = r.student_id "
                     + "ORDER BY s.name, r.subject";
        PreparedStatement ps = con.prepareStatement(query);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            hasResults = true;
            int marks = rs.getInt("marks");
            String marksClass = marks >= 75 ? "marks-high" : marks >= 50 ? "marks-mid" : "marks-low";
            String grade, badgeClass;
            if (marks >= 90) { grade = "A+"; badgeClass = "badge-green"; }
            else if (marks >= 75) { grade = "A"; badgeClass = "badge-green"; }
            else if (marks >= 60) { grade = "B"; badgeClass = "badge-blue"; }
            else if (marks >= 50) { grade = "C"; badgeClass = "badge-blue"; }
            else { grade = "F"; badgeClass = "badge-red"; }
%>
                        <tr>
                            <td><span class="id-chip">#<%= rs.getInt("student_id") %></span></td>
                            <td style="font-weight:500;"><%= rs.getString("name") %></td>
                            <td style="color:var(--text-secondary);"><%= rs.getString("subject") %></td>
                            <td><span class="<%= marksClass %>"><%= marks %></span></td>
                            <td><span class="badge <%= badgeClass %>"><%= grade %></span></td>
                        </tr>
<%
        }
        rs.close(); ps.close(); con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }

    if (!hasResults) {
%>
                        <tr>
                            <td colspan="5">
                                <div class="empty-state">
                                    <svg viewBox="0 0 24 24" stroke-width="1.5">
                                        <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/>
                                        <polyline points="14 2 14 8 20 8"/>
                                    </svg>
                                    <p>No results found. <a href="addResult.jsp" style="color:var(--accent);">Add the first result.</a></p>
                                </div>
                            </td>
                        </tr>
<%
    }
%>
                    </tbody>
                </table>
            </div>

        </div>
    </div>
</div>

</body>
</html>
