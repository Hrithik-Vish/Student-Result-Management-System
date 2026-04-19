<%-- Shared Sidebar Navigation --%>
<%
    String currentPage = (String) request.getAttribute("currentPage");
    if (currentPage == null) currentPage = "";
    String sidebarUser = (String) session.getAttribute("username");
    String initials = (sidebarUser != null && sidebarUser.length() > 0)
        ? String.valueOf(sidebarUser.charAt(0)).toUpperCase() : "A";
%>
<aside class="sidebar">
    <div class="sidebar-brand">
        <div class="brand-icon">
            <svg viewBox="0 0 24 24" stroke-width="2">
                <path d="M12 2L2 7l10 5 10-5-10-5z"/>
                <path d="M2 17l10 5 10-5"/>
                <path d="M2 12l10 5 10-5"/>
            </svg>
        </div>
        <h1>Student Result<br>Management</h1>
        <p>SRMS v1.0</p>
    </div>

    <div class="sidebar-nav">
        <div class="sidebar-section-label">Overview</div>
        <a href="dashboard.jsp" class="nav-item <%= "dashboard".equals(currentPage) ? "active" : "" %>">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                <rect x="3" y="3" width="7" height="7" rx="1"/>
                <rect x="14" y="3" width="7" height="7" rx="1"/>
                <rect x="3" y="14" width="7" height="7" rx="1"/>
                <rect x="14" y="14" width="7" height="7" rx="1"/>
            </svg>
            Dashboard
        </a>

        <div class="sidebar-section-label" style="margin-top:0.5rem;">Students</div>
        <a href="addStudent.jsp" class="nav-item <%= "addStudent".equals(currentPage) ? "active" : "" %>">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                <path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2"/>
                <circle cx="9" cy="7" r="4"/>
                <line x1="19" y1="8" x2="19" y2="14"/><line x1="22" y1="11" x2="16" y2="11"/>
            </svg>
            Add Student
        </a>
        <a href="viewStudents" class="nav-item <%= "viewStudents".equals(currentPage) ? "active" : "" %>">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/>
                <circle cx="9" cy="7" r="4"/>
                <path d="M23 21v-2a4 4 0 0 0-3-3.87"/>
                <path d="M16 3.13a4 4 0 0 1 0 7.75"/>
            </svg>
            View Students
        </a>

        <div class="sidebar-section-label" style="margin-top:0.5rem;">Results</div>
        <a href="addResult.jsp" class="nav-item <%= "addResult".equals(currentPage) ? "active" : "" %>">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/>
                <polyline points="14 2 14 8 20 8"/>
                <line x1="12" y1="18" x2="12" y2="12"/>
                <line x1="9" y1="15" x2="15" y2="15"/>
            </svg>
            Add Result
        </a>
        <a href="viewResults" class="nav-item <%= "viewResults".equals(currentPage) ? "active" : "" %>">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/>
                <polyline points="14 2 14 8 20 8"/>
                <line x1="16" y1="13" x2="8" y2="13"/>
                <line x1="16" y1="17" x2="8" y2="17"/>
                <polyline points="10 9 9 9 8 9"/>
            </svg>
            View Results
        </a>
    </div>

    <div class="sidebar-footer">
        <div style="border-top:1px solid var(--border); margin-bottom:0.75rem; padding-top:0.75rem;">
            <div style="display:flex;align-items:center;gap:10px;padding:0.5rem 0.75rem;margin-bottom:4px;">
                <div class="user-avatar" style="width:28px;height:28px;font-size:11px;"><%= initials %></div>
                <span style="font-size:13px;color:var(--text-secondary);"><%= sidebarUser != null ? sidebarUser : "Admin" %></span>
            </div>
        </div>
        <button id="theme-toggle" onclick="toggleTheme()" class="nav-item" style="width:100%;background:none;border:none;cursor:pointer;text-align:left;">
            <svg id="theme-icon-moon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" style="display:none;">
                <path d="M21 12.79A9 9 0 1 1 11.21 3 7 7 0 0 0 21 12.79z"/>
            </svg>
            <svg id="theme-icon-sun" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" style="display:none;">
                <circle cx="12" cy="12" r="5"/>
                <line x1="12" y1="1" x2="12" y2="3"/>
                <line x1="12" y1="21" x2="12" y2="23"/>
                <line x1="4.22" y1="4.22" x2="5.64" y2="5.64"/>
                <line x1="18.36" y1="18.36" x2="19.78" y2="19.78"/>
                <line x1="1" y1="12" x2="3" y2="12"/>
                <line x1="21" y1="12" x2="23" y2="12"/>
                <line x1="4.22" y1="19.78" x2="5.64" y2="18.36"/>
                <line x1="18.36" y1="5.64" x2="19.78" y2="4.22"/>
            </svg>
            <span id="theme-label">Dark Mode</span>
        </button>

        <a href="logout" class="nav-item danger">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                <path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"/>
                <polyline points="16 17 21 12 16 7"/>
                <line x1="21" y1="12" x2="9" y2="12"/>
            </svg>
            Logout
        </a>
    </div>
</aside>

<script>
  function applyTheme(theme) {
    document.documentElement.setAttribute('data-theme', theme);
    localStorage.setItem('srms-theme', theme);
    var isDark = theme === 'dark';
    document.getElementById('theme-icon-moon').style.display = isDark ? 'none' : 'block';
    document.getElementById('theme-icon-sun').style.display  = isDark ? 'block' : 'none';
    document.getElementById('theme-label').textContent = isDark ? 'Light Mode' : 'Dark Mode';
  }

  function toggleTheme() {
    var current = document.documentElement.getAttribute('data-theme') || 'dark';
    applyTheme(current === 'dark' ? 'light' : 'dark');
  }

  /* Only sync the icon/label on load — theme is already set by _styles.jsp */
  (function() {
    var t = document.documentElement.getAttribute('data-theme') || 'dark';
    var isDark = t === 'dark';
    document.getElementById('theme-icon-moon').style.display = isDark ? 'none' : 'block';
    document.getElementById('theme-icon-sun').style.display  = isDark ? 'block' : 'none';
    document.getElementById('theme-label').textContent = isDark ? 'Light Mode' : 'Dark Mode';
  })();
</script>
