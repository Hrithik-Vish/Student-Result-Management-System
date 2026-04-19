<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.srms.connection.DBConnection" %>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    request.setAttribute("currentPage", "dashboard");

    // Fetch live stats from DB
    int totalStudents = 0;
    int totalResults  = 0;
    String avgScore   = "N/A";

    try {
        Connection con = DBConnection.getConnection();

        PreparedStatement ps1 = con.prepareStatement("SELECT COUNT(*) FROM students");
        ResultSet rs1 = ps1.executeQuery();
        if (rs1.next()) totalStudents = rs1.getInt(1);
        rs1.close(); ps1.close();

        PreparedStatement ps2 = con.prepareStatement("SELECT COUNT(*) FROM results");
        ResultSet rs2 = ps2.executeQuery();
        if (rs2.next()) totalResults = rs2.getInt(1);
        rs2.close(); ps2.close();

        PreparedStatement ps3 = con.prepareStatement("SELECT ROUND(AVG(marks), 1) FROM results");
        ResultSet rs3 = ps3.executeQuery();
        if (rs3.next() && rs3.getString(1) != null) avgScore = rs3.getString(1);
        rs3.close(); ps3.close();

    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard — SRMS</title>
    <%@ include file="_styles.jsp" %>
</head>
<body>

<div class="app-layout">
    <%@ include file="_sidebar.jsp" %>

    <div class="main-content">
        <div class="topbar">
            <div>
                <div class="topbar-title">Dashboard</div>
                <div class="topbar-sub">Overview of your system</div>
            </div>
            <div class="topbar-user">
                <div class="user-avatar"><%= String.valueOf(username.charAt(0)).toUpperCase() %></div>
                <span class="user-name"><%= username %></span>
            </div>
        </div>

        <div class="page-body">

            <!-- Stats Row -->
            <div class="stats-grid">
                <div class="stat-card accent-blue">
                    <div class="stat-icon">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/>
                            <circle cx="9" cy="7" r="4"/>
                            <path d="M23 21v-2a4 4 0 0 0-3-3.87"/>
                            <path d="M16 3.13a4 4 0 0 1 0 7.75"/>
                        </svg>
                    </div>
                    <div class="stat-label">Total Students</div>
                    <div class="stat-value"><%= totalStudents %></div>
                </div>
                <div class="stat-card accent-green">
                    <div class="stat-icon">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/>
                            <polyline points="14 2 14 8 20 8"/>
                        </svg>
                    </div>
                    <div class="stat-label">Results Logged</div>
                    <div class="stat-value"><%= totalResults %></div>
                </div>
                <div class="stat-card accent-orange">
                    <div class="stat-icon">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <polyline points="22 12 18 12 15 21 9 3 6 12 2 12"/>
                        </svg>
                    </div>
                    <div class="stat-label">Avg. Score</div>
                    <div class="stat-value"><%= avgScore %></div>
                </div>
            </div>

            <!-- Quick Actions -->
            <h3 style="font-size:13px;font-weight:600;text-transform:uppercase;letter-spacing:0.07em;color:var(--text-muted);margin-bottom:1rem;">Quick Actions</h3>
            <div class="action-grid">
                <a href="addStudent.jsp" class="action-card blue">
                    <div class="card-icon">
                        <svg viewBox="0 0 24 24" stroke="currentColor">
                            <path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2"/>
                            <circle cx="9" cy="7" r="4"/>
                            <line x1="19" y1="8" x2="19" y2="14"/><line x1="22" y1="11" x2="16" y2="11"/>
                        </svg>
                    </div>
                    <div class="card-title">Add Student</div>
                    <div class="card-desc">Register a new student into the system</div>
                </a>
                <a href="viewStudents" class="action-card blue">
                    <div class="card-icon">
                        <svg viewBox="0 0 24 24" stroke="currentColor">
                            <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/>
                            <circle cx="9" cy="7" r="4"/>
                            <path d="M23 21v-2a4 4 0 0 0-3-3.87"/>
                            <path d="M16 3.13a4 4 0 0 1 0 7.75"/>
                        </svg>
                    </div>
                    <div class="card-title">View Students</div>
                    <div class="card-desc">Browse and manage student records</div>
                </a>
                <a href="addResult.jsp" class="action-card green">
                    <div class="card-icon">
                        <svg viewBox="0 0 24 24" stroke="currentColor">
                            <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/>
                            <polyline points="14 2 14 8 20 8"/>
                            <line x1="12" y1="18" x2="12" y2="12"/>
                            <line x1="9" y1="15" x2="15" y2="15"/>
                        </svg>
                    </div>
                    <div class="card-title">Add Result</div>
                    <div class="card-desc">Enter marks for a student subject</div>
                </a>
                <a href="viewResults" class="action-card orange">
                    <div class="card-icon">
                        <svg viewBox="0 0 24 24" stroke="currentColor">
                            <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/>
                            <polyline points="14 2 14 8 20 8"/>
                            <line x1="16" y1="13" x2="8" y2="13"/>
                            <line x1="16" y1="17" x2="8" y2="17"/>
                        </svg>
                    </div>
                    <div class="card-title">View Results</div>
                    <div class="card-desc">Review all student result records</div>
                </a>
            </div>

            <!-- Info banner -->
            <div style="background:var(--info-bg);border:1px solid rgba(79,142,247,0.2);border-radius:var(--radius);padding:1rem 1.25rem;display:flex;align-items:center;gap:12px;margin-top:1rem;">
                <svg viewBox="0 0 24 24" fill="none" stroke="var(--accent)" stroke-width="2" style="width:18px;height:18px;flex-shrink:0;">
                    <circle cx="12" cy="12" r="10"/>
                    <line x1="12" y1="8" x2="12" y2="12"/>
                    <line x1="12" y1="16" x2="12.01" y2="16"/>
                </svg>
                <span style="font-size:13px;color:var(--text-secondary);">
                    Logged in as <strong style="color:var(--accent)"><%= username %></strong>. Use the sidebar to navigate between sections.
                </span>
            </div>
        </div>
    </div>
</div>

</body>
</html>
