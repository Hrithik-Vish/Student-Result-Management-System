<%-- Shared CSS Design System - include this in every page --%>
<script>
  (function() {
    var t = localStorage.getItem('srms-theme') || 'dark';
    document.documentElement.setAttribute('data-theme', t);
  })();
</script>
<style>
  @import url('https://fonts.googleapis.com/css2?family=DM+Sans:wght@300;400;500;600&family=DM+Mono:wght@400;500&display=swap');

  *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

  /* ── Dark theme (default) ── */
  :root, [data-theme="dark"] {
    --bg: #0f1117;
    --bg-card: #181c27;
    --bg-surface: #1e2333;
    --bg-hover: #252b3d;
    --border: rgba(255,255,255,0.07);
    --border-strong: rgba(255,255,255,0.13);
    --accent: #4f8ef7;
    --accent-glow: rgba(79,142,247,0.18);
    --text-primary: #eef0f5;
    --text-secondary: #8892a4;
    --text-muted: #4d5568;
    --danger: #f43f5e;
    --danger-bg: rgba(244,63,94,0.12);
    --success: #34d399;
    --success-bg: rgba(52,211,153,0.12);
    --warning: #fbbf24;
    --warning-bg: rgba(251,191,36,0.12);
    --info-bg: rgba(79,142,247,0.12);
    --radius: 10px;
    --radius-lg: 14px;
    --font: 'DM Sans', sans-serif;
    --mono: 'DM Mono', monospace;
    --sidebar-w: 230px;
  }

  /* ── Light theme ── */
  [data-theme="light"] {
    --bg: #f0f2f7;
    --bg-card: #ffffff;
    --bg-surface: #f5f6fa;
    --bg-hover: #eef0f6;
    --border: rgba(0,0,0,0.07);
    --border-strong: rgba(0,0,0,0.13);
    --accent: #2563eb;
    --accent-glow: rgba(37,99,235,0.15);
    --text-primary: #111827;
    --text-secondary: #4b5563;
    --text-muted: #9ca3af;
    --danger: #dc2626;
    --danger-bg: rgba(220,38,38,0.08);
    --success: #059669;
    --success-bg: rgba(5,150,105,0.08);
    --warning: #d97706;
    --warning-bg: rgba(217,119,6,0.08);
    --info-bg: rgba(37,99,235,0.08);
    --radius: 10px;
    --radius-lg: 14px;
    --font: 'DM Sans', sans-serif;
    --mono: 'DM Mono', monospace;
    --sidebar-w: 230px;
  }

  /* Targeted transitions only — avoids full repaint on theme switch */
  .sidebar, .topbar, .stat-card, .action-card, .table-card,
  .form-card, .login-box, .nav-item, .btn-primary, .btn-edit,
  .btn-delete, .badge, .form-group input, .form-group select {
    transition: background-color 0.2s ease, border-color 0.2s ease, color 0.15s ease;
  }

  body {
    font-family: var(--font);
    background: var(--bg);
    color: var(--text-primary);
    min-height: 100vh;
    font-size: 14px;
    line-height: 1.6;
    -webkit-font-smoothing: antialiased;
  }

  /* ── Layout Shell ── */
  .app-layout {
    display: flex;
    min-height: 100vh;
  }

  /* ── Sidebar ── */
  .sidebar {
    width: var(--sidebar-w);
    background: var(--bg-card);
    border-right: 1px solid var(--border);
    display: flex;
    flex-direction: column;
    position: fixed;
    top: 0; left: 0; bottom: 0;
    z-index: 100;
    padding: 0 0 1.5rem;
  }

  .sidebar-brand {
    padding: 1.5rem 1.25rem 1.25rem;
    border-bottom: 1px solid var(--border);
    margin-bottom: 0.75rem;
  }

  .sidebar-brand .brand-icon {
    width: 34px; height: 34px;
    background: var(--accent);
    border-radius: 8px;
    display: flex; align-items: center; justify-content: center;
    margin-bottom: 0.75rem;
  }

  .sidebar-brand .brand-icon svg { width: 18px; height: 18px; stroke: #fff; fill: none; }

  .sidebar-brand h1 {
    font-size: 13px;
    font-weight: 600;
    color: var(--text-primary);
    letter-spacing: 0.01em;
    line-height: 1.3;
  }

  .sidebar-brand p {
    font-size: 11px;
    color: var(--text-muted);
    margin-top: 2px;
    font-family: var(--mono);
  }

  .sidebar-section-label {
    font-size: 10px;
    font-weight: 600;
    letter-spacing: 0.08em;
    text-transform: uppercase;
    color: var(--text-muted);
    padding: 0.75rem 1.25rem 0.4rem;
  }

  .sidebar-nav { flex: 1; padding: 0 0.75rem; }

  .nav-item {
    display: flex;
    align-items: center;
    gap: 10px;
    padding: 0.6rem 0.75rem;
    border-radius: var(--radius);
    color: var(--text-secondary);
    text-decoration: none;
    font-size: 13.5px;
    font-weight: 400;
    transition: background 0.15s, color 0.15s;
    margin-bottom: 2px;
  }

  .nav-item:hover { background: var(--bg-hover); color: var(--text-primary); }
  .nav-item.active { background: var(--info-bg); color: var(--accent); font-weight: 500; }

  .nav-item svg { width: 16px; height: 16px; flex-shrink: 0; }

  .sidebar-footer { padding: 0 0.75rem; }

  .nav-item.danger:hover { background: var(--danger-bg); color: var(--danger); }

  /* ── Main Content ── */
  .main-content {
    margin-left: var(--sidebar-w);
    flex: 1;
    display: flex;
    flex-direction: column;
    min-height: 100vh;
  }

  /* ── Topbar ── */
  .topbar {
    height: 60px;
    border-bottom: 1px solid var(--border);
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 0 2rem;
    background: var(--bg-card);
    position: sticky; top: 0; z-index: 50;
  }

  .topbar-title { font-size: 15px; font-weight: 500; color: var(--text-primary); }
  .topbar-sub { font-size: 12px; color: var(--text-muted); margin-top: 1px; }

  .topbar-user {
    display: flex;
    align-items: center;
    gap: 10px;
  }

  .user-avatar {
    width: 32px; height: 32px;
    background: var(--accent);
    border-radius: 50%;
    display: flex; align-items: center; justify-content: center;
    font-size: 12px; font-weight: 600; color: #fff;
  }

  .user-name { font-size: 13px; color: var(--text-secondary); }

  /* ── Page Body ── */
  .page-body { padding: 2rem; flex: 1; }

  /* ── Stat Cards ── */
  .stats-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
    gap: 1rem;
    margin-bottom: 2rem;
  }

  .stat-card {
    background: var(--bg-card);
    border: 1px solid var(--border);
    border-radius: var(--radius-lg);
    padding: 1.25rem;
  }

  .stat-card .stat-label {
    font-size: 11px;
    text-transform: uppercase;
    letter-spacing: 0.07em;
    color: var(--text-muted);
    font-weight: 600;
    margin-bottom: 0.5rem;
  }

  .stat-card .stat-value {
    font-size: 28px;
    font-weight: 600;
    color: var(--text-primary);
    font-family: var(--mono);
    line-height: 1;
  }

  .stat-card .stat-icon {
    width: 32px; height: 32px;
    border-radius: 8px;
    display: flex; align-items: center; justify-content: center;
    margin-bottom: 0.75rem;
  }

  .stat-card .stat-icon svg { width: 16px; height: 16px; }

  .stat-card.accent-blue .stat-icon { background: var(--info-bg); }
  .stat-card.accent-blue .stat-icon svg { stroke: var(--accent); }
  .stat-card.accent-green .stat-icon { background: var(--success-bg); }
  .stat-card.accent-green .stat-icon svg { stroke: var(--success); }
  .stat-card.accent-orange .stat-icon { background: var(--warning-bg); }
  .stat-card.accent-orange .stat-icon svg { stroke: var(--warning); }

  /* ── Action Cards (Dashboard links) ── */
  .action-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 1rem;
    margin-bottom: 2rem;
  }

  .action-card {
    background: var(--bg-card);
    border: 1px solid var(--border);
    border-radius: var(--radius-lg);
    padding: 1.5rem;
    text-decoration: none;
    color: var(--text-primary);
    display: flex;
    flex-direction: column;
    gap: 0.75rem;
    transition: border-color 0.2s, background 0.2s, transform 0.15s;
  }

  .action-card:hover {
    border-color: var(--border-strong);
    background: var(--bg-hover);
    transform: translateY(-2px);
  }

  .action-card .card-icon {
    width: 40px; height: 40px;
    border-radius: 10px;
    display: flex; align-items: center; justify-content: center;
  }

  .action-card .card-icon svg { width: 20px; height: 20px; fill: none; stroke-width: 1.8; }

  .action-card .card-title { font-size: 14px; font-weight: 500; }
  .action-card .card-desc { font-size: 12px; color: var(--text-secondary); }

  .action-card.blue .card-icon { background: var(--info-bg); }
  .action-card.blue .card-icon svg { stroke: var(--accent); }
  .action-card.green .card-icon { background: var(--success-bg); }
  .action-card.green .card-icon svg { stroke: var(--success); }
  .action-card.orange .card-icon { background: var(--warning-bg); }
  .action-card.orange .card-icon svg { stroke: var(--warning); }

  /* ── Tables ── */
  .table-card {
    background: var(--bg-card);
    border: 1px solid var(--border);
    border-radius: var(--radius-lg);
    overflow: hidden;
  }

  .table-header {
    padding: 1.25rem 1.5rem;
    border-bottom: 1px solid var(--border);
    display: flex;
    align-items: center;
    justify-content: space-between;
  }

  .table-header h2 { font-size: 14px; font-weight: 500; }

  table { width: 100%; border-collapse: collapse; }

  thead th {
    text-align: left;
    padding: 0.75rem 1.5rem;
    font-size: 11px;
    font-weight: 600;
    letter-spacing: 0.06em;
    text-transform: uppercase;
    color: var(--text-muted);
    background: var(--bg-surface);
    border-bottom: 1px solid var(--border);
  }

  tbody tr {
    border-bottom: 1px solid var(--border);
    transition: background 0.1s;
  }

  tbody tr:last-child { border-bottom: none; }
  tbody tr:hover { background: var(--bg-hover); }

  tbody td {
    padding: 0.85rem 1.5rem;
    font-size: 13.5px;
    color: var(--text-primary);
  }

  /* ── Badges ── */
  .badge {
    display: inline-flex;
    align-items: center;
    padding: 3px 10px;
    border-radius: 20px;
    font-size: 11.5px;
    font-weight: 500;
  }

  .badge-blue { background: var(--info-bg); color: var(--accent); }
  .badge-green { background: var(--success-bg); color: var(--success); }
  .badge-red { background: var(--danger-bg); color: var(--danger); }

  /* ── Action buttons in table ── */
  .btn-edit, .btn-delete {
    display: inline-flex;
    align-items: center;
    gap: 4px;
    padding: 4px 12px;
    border-radius: 6px;
    font-size: 12px;
    font-weight: 500;
    text-decoration: none;
    transition: background 0.15s;
  }

  .btn-edit { background: var(--info-bg); color: var(--accent); }
  .btn-edit:hover { background: rgba(79,142,247,0.28); }
  .btn-delete { background: var(--danger-bg); color: var(--danger); }
  .btn-delete:hover { background: rgba(244,63,94,0.22); }

  /* ── Forms ── */
  .form-card {
    background: var(--bg-card);
    border: 1px solid var(--border);
    border-radius: var(--radius-lg);
    padding: 2rem;
    max-width: 520px;
  }

  .form-card h2 {
    font-size: 16px; font-weight: 600; margin-bottom: 1.5rem;
    color: var(--text-primary);
  }

  .form-group { margin-bottom: 1.1rem; }

  .form-group label {
    display: block;
    font-size: 12px;
    font-weight: 500;
    color: var(--text-secondary);
    margin-bottom: 6px;
    text-transform: uppercase;
    letter-spacing: 0.05em;
  }

  .form-group input,
  .form-group select,
  .form-group textarea {
    width: 100%;
    background: var(--bg-surface);
    border: 1px solid var(--border-strong);
    border-radius: var(--radius);
    padding: 0.6rem 0.85rem;
    color: var(--text-primary);
    font-family: var(--font);
    font-size: 14px;
    transition: border-color 0.15s, box-shadow 0.15s;
    outline: none;
  }

  .form-group input:focus,
  .form-group select:focus {
    border-color: var(--accent);
    box-shadow: 0 0 0 3px var(--accent-glow);
  }

  .form-group select option { background: var(--bg-card); }

  .btn-primary {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 6px;
    padding: 0.65rem 1.5rem;
    background: var(--accent);
    color: #fff;
    border: none;
    border-radius: var(--radius);
    font-family: var(--font);
    font-size: 14px;
    font-weight: 500;
    cursor: pointer;
    transition: opacity 0.15s, transform 0.12s;
    text-decoration: none;
    width: 100%;
    margin-top: 0.5rem;
  }

  .btn-primary:hover { opacity: 0.88; transform: translateY(-1px); }
  .btn-primary:active { transform: scale(0.98); }

  .btn-primary.green { background: var(--success); color: #0f1117; }

  .back-link {
    display: inline-flex;
    align-items: center;
    gap: 6px;
    color: var(--text-secondary);
    text-decoration: none;
    font-size: 13px;
    margin-top: 1rem;
    transition: color 0.15s;
  }

  .back-link:hover { color: var(--text-primary); }

  /* ── Login Page ── */
  .login-page {
    min-height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
    background: var(--bg);
    position: relative;
    overflow: hidden;
  }

  .login-page::before {
    content: '';
    position: absolute;
    width: 600px; height: 600px;
    background: radial-gradient(circle, rgba(79,142,247,0.08) 0%, transparent 70%);
    top: -200px; right: -200px;
    pointer-events: none;
  }

  .login-page::after {
    content: '';
    position: absolute;
    width: 400px; height: 400px;
    background: radial-gradient(circle, rgba(52,211,153,0.06) 0%, transparent 70%);
    bottom: -100px; left: -100px;
    pointer-events: none;
  }

  .login-box {
    width: 100%;
    max-width: 400px;
    background: var(--bg-card);
    border: 1px solid var(--border);
    border-radius: var(--radius-lg);
    padding: 2.5rem;
    position: relative;
    z-index: 1;
  }

  .login-logo {
    width: 44px; height: 44px;
    background: var(--accent);
    border-radius: 11px;
    display: flex; align-items: center; justify-content: center;
    margin-bottom: 1.5rem;
  }

  .login-logo svg { width: 22px; height: 22px; stroke: #fff; fill: none; stroke-width: 2; }

  .login-box h2 {
    font-size: 20px; font-weight: 600;
    color: var(--text-primary);
    margin-bottom: 4px;
  }

  .login-box .login-sub {
    font-size: 13px; color: var(--text-muted);
    margin-bottom: 2rem;
  }

  .error-banner {
    background: var(--danger-bg);
    border: 1px solid rgba(244,63,94,0.25);
    color: var(--danger);
    border-radius: var(--radius);
    padding: 0.6rem 1rem;
    font-size: 13px;
    margin-bottom: 1.25rem;
    display: flex;
    align-items: center;
    gap: 8px;
  }

  /* ── Empty state ── */
  .empty-state {
    text-align: center;
    padding: 3rem 2rem;
    color: var(--text-muted);
  }

  .empty-state svg { width: 40px; height: 40px; margin-bottom: 1rem; stroke: var(--text-muted); fill: none; }
  .empty-state p { font-size: 14px; }

  /* ── Marks badge ── */
  .marks-high { color: var(--success); font-weight: 500; font-family: var(--mono); }
  .marks-mid  { color: var(--warning); font-weight: 500; font-family: var(--mono); }
  .marks-low  { color: var(--danger);  font-weight: 500; font-family: var(--mono); }

  .id-chip {
    font-family: var(--mono);
    font-size: 12px;
    color: var(--text-muted);
    background: var(--bg-surface);
    padding: 2px 8px;
    border-radius: 5px;
  }
</style>
