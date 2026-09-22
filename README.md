<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>CDMS – Cadet Dossier Management System | NDA</title>
  <link rel="stylesheet" href="assets/css/styles.css" />
  <!-- Font Awesome for icons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
<script src="https://sites.super.myninja.ai/_assets/ninja-daytona-script.js"></script>
</head>
<body>

<!-- ============================================================
     LOADING SCREEN
     ============================================================ -->
<div id="loading-screen">
  <img src="nda-logo.png" alt="NDA" style="width:80px;margin-bottom:20px;filter:drop-shadow(0 0 15px rgba(212,160,23,0.6));" />
  <div class="loading-ring"></div>
  <div class="loading-text">INITIALISING CDMS...</div>
  <div class="loading-bar"><div class="loading-bar-fill"></div></div>
  <div style="font-family:'Share Tech Mono',monospace;font-size:0.6rem;color:rgba(212,160,23,0.4);margin-top:10px;letter-spacing:0.2em;">
    NIGERIAN DEFENCE ACADEMY · KADUNA
  </div>
</div>

<!-- ============================================================
     AR BACKGROUND (shared across all pages)
     ============================================================ -->
<div class="ar-bg">
  <div class="ar-grid"></div>
  <div class="ar-scanlines"></div>
  <div class="ar-vignette"></div>
</div>

<!-- AR Corner Decorations -->
<div class="ar-corner tl"></div>
<div class="ar-corner tr"></div>
<div class="ar-corner bl"></div>
<div class="ar-corner br"></div>

<!-- ============================================================
     HUD BAR (Global Top Bar)
     ============================================================ -->
<div class="hud-bar" id="main-hud" style="display:none;">
  <div class="hud-left">
    <img src="assets/img/nda-logo.png" alt="NDA" class="hud-logo" />
    <div>
      <div class="hud-title">CDMS · NIGERIAN DEFENCE ACADEMY</div>
      <div style="font-family:'Share Tech Mono',monospace;font-size:0.5rem;color:rgba(168,213,176,0.5);letter-spacing:0.15em;">
        CADET DOSSIER MANAGEMENT SYSTEM
      </div>
    </div>
  </div>
  <div class="hud-right">
    <div class="hud-indicator">
      <div class="hud-dot"></div>
      <span class="hud-clock">00:00:00</span>
    </div>
    <div class="hud-indicator">
      <i class="fa fa-calendar" style="color:var(--nda-gold);font-size:0.6rem;"></i>
      <span class="hud-date">-- --- ----</span>
    </div>
    <div class="hud-indicator" id="hud-user-display" style="display:none;">
      <i class="fa fa-user-shield" style="color:var(--nda-green-light);font-size:0.6rem;"></i>
      <span id="hud-username" style="color:var(--nda-green-light);">USER</span>
    </div>
    <button onclick="CDMS.logout()" style="
      background:transparent;border:1px solid rgba(192,57,43,0.4);
      color:var(--nda-red-light);font-family:'Share Tech Mono',monospace;
      font-size:0.6rem;padding:4px 12px;cursor:pointer;letter-spacing:0.1em;
      transition:all 0.3s;clip-path:polygon(4px 0%,100% 0%,calc(100% - 4px) 100%,0% 100%);
    " id="logout-btn" style="display:none;"
      onmouseover="this.style.background='rgba(192,57,43,0.2)'"
      onmouseout="this.style.background='transparent'">
      <i class="fa fa-power-off"></i> LOGOUT
    </button>
  </div>
</div>

<!-- Breadcrumb -->
<div class="breadcrumb" id="main-breadcrumb" style="display:none;">
  <span>CDMS</span>
</div>

<!-- ============================================================
     LOADING OVERLAY (for actions)
     ============================================================ -->
<div class="modal-overlay" id="loading-overlay">
  <div style="text-align:center;">
    <div class="loading-ring" style="margin:0 auto 20px;"></div>
    <div class="loading-text" id="loading-overlay-text">PROCESSING...</div>
  </div>
</div>

<!-- ============================================================
     ALERT MODAL
     ============================================================ -->
<div class="modal-overlay" id="alert-overlay">
  <div class="modal-box">
    <div class="modal-title" id="alert-title">SYSTEM MESSAGE</div>
    <div class="modal-body" id="alert-message">Message content here.</div>
    <button class="btn-ar" onclick="CDMS.closeAlert()" style="width:100%;">
      <i class="fa fa-check btn-icon"></i> ACKNOWLEDGE
    </button>
  </div>
</div>


<!-- ============================================================
     PAGE 1 — LANDING
     ============================================================ -->
<div class="page active" id="page-landing">
  <div class="landing-content">
    <!-- Animated rings + logo -->
    <div class="landing-logo-wrap">
      <div class="landing-logo-ring"></div>
      <div class="landing-logo-ring"></div>
      <div class="landing-logo-ring"></div>
      <img src="assets/img/nda-logo.png" alt="NDA Logo" class="landing-logo" />
    </div>

    <!-- Text -->
    <div class="landing-academy">&#9670; NIGERIAN DEFENCE ACADEMY · KADUNA &#9670;</div>

    <h1 class="landing-welcome">
      <span class="to">WELCOME TO</span><br />
      <span class="cdms">CDMS</span>
    </h1>

    <div class="landing-subtitle">Cadet Dossier Management System</div>
    <div class="landing-tagline">DIGITAL RECORDS · RC1 THROUGH RC77 · ALL INTAKE</div>
    <div class="landing-tagline"> ··· SSC As Well As DSSC···</div>

    <div class="divider-line"></div>

    <!-- Stats preview -->
    <div style="display:flex;gap:30px;margin-bottom:40px;flex-wrap:wrap;justify-content:center;">
      <div style="text-align:center;">
        <div style="font-family:'Orbitron',sans-serif;font-size:1.5rem;font-weight:900;color:var(--nda-gold);">77</div>
        <div style="font-family:'Share Tech Mono',monospace;font-size:0.55rem;color:var(--text-secondary);letter-spacing:0.15em;">REG COURSES</div>
      </div>
      <div style="width:1px;background:rgba(212,160,23,0.2);"></div>
      <div style="text-align:center;">
        <div style="font-family:'Orbitron',sans-serif;font-size:1.5rem;font-weight:900;color:var(--nda-gold);">1964</div>
        <div style="font-family:'Share Tech Mono',monospace;font-size:0.55rem;color:var(--text-secondary);letter-spacing:0.15em;">ESTABLISHED</div>
      </div>
      <div style="width:1px;background:rgba(212,160,23,0.2);"></div>
      <div style="text-align:center;">
        <div style="font-family:'Orbitron',sans-serif;font-size:1.5rem;font-weight:900;color:var(--nda-gold);">5K+</div>
        <div style="font-family:'Share Tech Mono',monospace;font-size:0.55rem;color:var(--text-secondary);letter-spacing:0.15em;">OFFICER CADETS</div>
      </div>
    </div>

    <!-- Login Button -->
    <button class="btn-ar" id="landing-login-btn"
      onclick="CDMS.navigateTo('page-login','forward')"
      style="min-width:220px;font-size:0.9rem;padding:16px 50px;">
      <i class="fa fa-shield-halved btn-icon"></i>
      SECURE LOGIN
    </button>

    <div style="margin-top:16px;font-family:'Share Tech Mono',monospace;font-size:0.6rem;
      color:rgba(168,213,176,0.3);letter-spacing:0.15em;">
      AUTHORISED PERSONNEL ONLY · CLASSIFIED SYSTEM
    </div>
  </div>
</div>


<!-- ============================================================
     PAGE 2 — LOGIN
     ============================================================ -->
<div class="page" id="page-login">
  <div class="login-content">
    <div class="login-card">
      <div class="login-header">
        <img src="nda-logo.png" alt="NDA" />
        <h2>CDMS SECURE ACCESS</h2>
        <p>&#9670; NIGERIAN DEFENCE ACADEMY · KADUNA &#9670;</p>
      </div>

      <form onsubmit="CDMS.handleLogin(event)">
        <div class="form-group">
          <label class="form-label">
            <i class="fa fa-user"></i>&nbsp; SERVICE NUMBER / USERNAME
          </label>
          <input type="text" id="login-username" class="form-input"
            placeholder="e.g. N/12345 or ADMIN" autocomplete="username" />
        </div>

        <div class="form-group">
          <label class="form-label">
            <i class="fa fa-lock"></i>&nbsp; PASSWORD / ACCESS CODE
          </label>
          <input type="password" id="login-password" class="form-input"
            placeholder="Enter secure password" autocomplete="current-password" />
        </div>

        <div style="display:flex;align-items:center;gap:8px;margin-bottom:20px;">
          <input type="checkbox" id="remember" style="accent-color:var(--nda-gold);" />
          <label for="remember" style="font-family:'Share Tech Mono',monospace;
            font-size:0.62rem;color:var(--text-secondary);letter-spacing:0.1em;cursor:pointer;">
            REMEMBER THIS TERMINAL
          </label>
        </div>

        <button type="submit" class="btn-ar" style="width:100%;justify-content:center;">
          <i class="fa fa-arrow-right-to-bracket btn-icon"></i>
          AUTHENTICATE & ENTER
        </button>
        <!--  -->

        <button type="submit" class="btn-ar" style="width:100%;justify-content:center;">
          <i class="fa fa-arrow-right-to-bracket btn-icon"></i>
          AUTHENTICATE & ENTER To RC
        </button>

        <!--  -->
      </form>

      <div class="login-divider"><span>QUICK ACCESS (DEMO)</span></div>

      <button class="btn-ar btn-ar-outline" style="width:100%;justify-content:center;"
        onclick="document.getElementById('login-username').value='ADMIN';
                 document.getElementById('login-password').value='NDA2024';
                 CDMS.handleLogin(event);">
        <i class="fa fa-eye btn-icon"></i> DEMO ACCESS
      </button>

      <button class="back-link" onclick="CDMS.navigateTo('page-landing','backward')">
        <i class="fa fa-chevron-left"></i> RETURN TO LANDING
      </button>
    </div>
  </div>
</div>


<!-- ============================================================
     PAGE 3 — DASHBOARD (RC1–RC77 Grid)
     ============================================================ -->
<div class="page" id="page-dashboard">
  <div class="dashboard-content">

    <!-- Header -->
    <div class="dashboard-header">
      <div class="dashboard-title-wrap">
        <div class="dashboard-title">
          <i class="fa fa-database" style="color:var(--nda-green-light);margin-right:10px;"></i>
          DOSSIER MANAGEMENT DASHBOARD
        </div>
        <div class="dashboard-sub">
          &#9670; NIGERIAN DEFENCE ACADEMY · REGULAR COURSES RC1 – RC77 &#9670;
        </div>
      </div>
      <div style="display:flex;gap:10px;flex-wrap:wrap;">
        <button class="btn-ar btn-ar-outline" style="padding:10px 20px;font-size:0.7rem;"
          onclick="CDMS.showAlert('SYSTEM INFO','CDMS Version 2.0\nNDA Digital Records System\nAll Regular Course intake digitised from RC1 (1964) to RC77.\n\nFor technical support contact: CDMS Administrator')">
          <i class="fa fa-circle-info btn-icon"></i> SYSTEM INFO
        </button>
      </div>
    </div>

    <!-- Stats Row -->
    <div class="stats-row">
      <div class="stat-card">
        <div class="stat-number">77</div>
        <div class="stat-label">REGULAR COURSES</div>
      </div>
      <div class="stat-card">
        <div class="stat-number">1964</div>
        <div class="stat-label">FIRST INTAKE (RC1)</div>
      </div>
      <div class="stat-card">
        <div class="stat-number">5,200+</div>
        <div class="stat-label">CADET RECORDS</div>
      </div>
      <div class="stat-card">
        <div class="stat-number">3 SVS</div>
        <div class="stat-label">ARMY · NAVY · AIR FORCE</div>
      </div>
    </div>

    <!-- Search -->
    <div class="search-bar">
      <div class="search-input-wrap">
        <i class="fa fa-magnifying-glass search-icon"></i>
        <input type="text" id="rc-search" placeholder="Search Regular Course or Year..."
          oninput="CDMS.filterRC(this.value)" />
      </div>
      <button class="btn-ar btn-ar-green" style="padding:10px 20px;font-size:0.7rem;">
        <i class="fa fa-filter btn-icon"></i> FILTER
      </button>
    </div>

    <!-- RC Grid Label -->
    <div class="section-label">
      <i class="fa fa-table-cells" style="color:var(--nda-gold);"></i>
      SELECT REGULAR COURSE TO VIEW CADET ROSTER
    </div>

    <!-- RC Grid (populated by JS) -->
    <div class="rc-grid" id="rc-grid">
      <!-- Populated by transitions.js -->
    </div>

  </div>
</div>


<!-- ============================================================
     PAGE 4 — CADET LIST (per RC)
     ============================================================ -->
<div class="page" id="page-cadets">
  <div class="cadets-content">

    <!-- Header -->
    <div class="page-header">
      <button class="back-btn" onclick="CDMS.navigateTo('page-dashboard','backward')">
        <i class="fa fa-chevron-left"></i> BACK TO DASHBOARD
      </button>
      <div class="page-title-section">
        <div class="rc-badge" id="rc-badge-text">REGULAR COURSE --</div>
        <div class="page-main-title" id="cadets-title">CADET ROSTER</div>
      </div>
      <div style="display:flex;gap:10px;flex-wrap:wrap;align-items:center;">
        <div style="font-family:'Share Tech Mono',monospace;font-size:0.62rem;
          color:var(--text-secondary);padding:6px 14px;border:1px solid rgba(212,160,23,0.2);">
          <i class="fa fa-users" style="color:var(--nda-gold);"></i>&nbsp;
          <span id="cadets-count">0</span> CADETS
        </div>
        <button class="btn-ar btn-ar-outline" style="padding:8px 18px;font-size:0.65rem;"
          onclick="CDMS.showAlert('EXPORT','Export functionality would generate a PDF or Excel roster of this Regular Course.')">
          <i class="fa fa-file-export btn-icon"></i> EXPORT
        </button>
      </div>
    </div>

    <!-- Search cadets -->
    <div class="search-bar">
      <div class="search-input-wrap">
        <i class="fa fa-magnifying-glass search-icon"></i>
        <input type="text" id="cadet-search" placeholder="Search cadet name, service number, state..."
          oninput="CDMS.filterCadets(this.value)" />
      </div>
      <button class="btn-ar btn-ar-green" style="padding:10px 20px;font-size:0.7rem;">
        <i class="fa fa-filter btn-icon"></i> FILTER
      </button>
    </div>

    <!-- Legend -->
    <div style="display:flex;gap:15px;margin-bottom:15px;flex-wrap:wrap;">
      <div style="display:flex;align-items:center;gap:6px;font-family:'Share Tech Mono',monospace;font-size:0.6rem;color:var(--text-secondary);">
        <div style="width:8px;height:8px;border-radius:50%;background:var(--nda-green-light);box-shadow:0 0 6px var(--nda-green-light);"></div>
        COMMISSIONED OFFICER
      </div>
      <div style="display:flex;align-items:center;gap:6px;font-family:'Share Tech Mono',monospace;font-size:0.6rem;color:var(--text-secondary);">
        <div style="width:8px;height:8px;border-radius:50%;background:var(--nda-gold);box-shadow:0 0 6px var(--nda-gold);"></div>
        COMMISSIONED WITH HONOURS
      </div>
      <div style="display:flex;align-items:center;gap:6px;font-family:'Share Tech Mono',monospace;font-size:0.6rem;color:var(--text-secondary);">
        <div style="width:8px;height:8px;border-radius:50%;background:var(--nda-red-light);box-shadow:0 0 6px var(--nda-red-light);"></div>
        DISTINGUISHED SERVICE
      </div>
    </div>

    <div class="section-label">
      <i class="fa fa-id-card" style="color:var(--nda-gold);"></i>
      CLICK A CADET CARD TO VIEW DOSSIER DETAILS
    </div>

    <!-- Cadet Cards Grid (populated by JS) -->
    <div class="cadets-grid" id="cadet-grid">
      <!-- Populated by transitions.js -->
    </div>

  </div>
</div>


<!-- ============================================================
     PAGE 5 — CADET PROFILE & DOSSIER VIEWER
     ============================================================ -->
<div class="page" id="page-profile">
  <div class="profile-content">

    <!-- Header -->
    <div class="page-header">
      <button class="back-btn" onclick="CDMS.navigateTo('page-cadets','backward')">
        <i class="fa fa-chevron-left"></i> BACK TO ROSTER
      </button>
      <div class="page-title-section">
        <div class="rc-badge" style="background:rgba(26,92,42,0.2);border-color:rgba(26,92,42,0.5);color:var(--nda-green-light);">
          <i class="fa fa-folder-open"></i>&nbsp; INDIVIDUAL DOSSIER
        </div>
        <div class="page-main-title">CADET PROFILE & RECORDS</div>
      </div>
      <div style="display:flex;gap:10px;flex-wrap:wrap;">
        <button class="btn-ar btn-ar-green" style="padding:8px 18px;font-size:0.65rem;"
          onclick="CDMS.handleUpload()">
          <i class="fa fa-upload btn-icon"></i> UPLOAD DOSSIER
        </button>
        <button class="btn-ar btn-ar-outline" style="padding:8px 18px;font-size:0.65rem;"
          onclick="CDMS.showAlert('PRINT DOSSIER','Sending dossier to secure print queue...\n\nThis would generate a formatted PDF of the complete cadet dossier for authorised printing.')">
          <i class="fa fa-print btn-icon"></i> PRINT
        </button>
      </div>
    </div>

    <!-- Profile Layout: Sidebar + Main -->
    <div class="profile-layout">

      <!-- ── SIDEBAR ── -->
      <div class="profile-sidebar">

        <!-- ID Card -->
        <div class="profile-id-card">
          <div class="profile-photo-wrap">
            <div class="profile-photo">
              <span id="profile-initials">AB</span>
              <div class="photo-scan"></div>
            </div>
          </div>
          <div class="profile-name" id="profile-name">CADET NAME</div>
          <div class="profile-rank" id="profile-rank">RANK</div>

          <div class="profile-detail-row">
            <span class="detail-key"><i class="fa fa-id-badge"></i> SVC NO</span>
            <span class="detail-val gold" id="profile-svc">N/--/---</span>
          </div>
          <div class="profile-detail-row">
            <span class="detail-key"><i class="fa fa-medal"></i> REG COURSE</span>
            <span class="detail-val" id="profile-rc">RC --</span>
          </div>
          <div class="profile-detail-row">
            <span class="detail-key"><i class="fa fa-calendar"></i> D.O.B</span>
            <span class="detail-val" id="profile-dob">-- --- ----</span>
          </div>
          <div class="profile-detail-row">
            <span class="detail-key"><i class="fa fa-map-pin"></i> STATE</span>
            <span class="detail-val" id="profile-state">---</span>
          </div>
          <div class="profile-detail-row">
            <span class="detail-key"><i class="fa fa-shield"></i> ARM/SVC</span>
            <span class="detail-val green" id="profile-arm">---</span>
          </div>
          <div class="profile-detail-row">
            <span class="detail-key"><i class="fa fa-building"></i> UNIT</span>
            <span class="detail-val" id="profile-unit">---</span>
          </div>
          <div class="profile-detail-row">
            <span class="detail-key"><i class="fa fa-star"></i> COMMISSION</span>
            <span class="detail-val gold" id="profile-commission">-- --- ----</span>
          </div>
        </div>

        <!-- Awards -->
        <div class="info-panel">
          <div class="info-panel-title">
            <i class="fa fa-award"></i> AWARDS & DECORATIONS
          </div>
          <div id="profile-awards">
            <span class="info-tag gold">MON</span>
            <span class="info-tag gold">FSS</span>
          </div>
        </div>

        <!-- Qualifications -->
        <div class="info-panel">
          <div class="info-panel-title">
            <i class="fa fa-graduation-cap"></i> QUALIFICATIONS
          </div>
          <div id="profile-quals">
            <span class="info-tag green">BSc DEFENCE STUDIES</span>
            <span class="info-tag green">psc</span>
          </div>
        </div>

        <!-- Quick Actions -->
        <div class="info-panel">
          <div class="info-panel-title">
            <i class="fa fa-bolt"></i> QUICK ACTIONS
          </div>
          <div style="display:flex;flex-direction:column;gap:8px;">
            <button class="btn-ar btn-ar-outline" style="padding:8px 16px;font-size:0.62rem;width:100%;justify-content:center;"
              onclick="CDMS.handleUpload()">
              <i class="fa fa-upload btn-icon"></i> UPLOAD PAGE
            </button>
            <button class="btn-ar btn-ar-outline" style="padding:8px 16px;font-size:0.62rem;width:100%;justify-content:center;"
              onclick="CDMS.showAlert('EDIT RECORD','Opening record editor for this cadet.\n\nChanges will be logged to the audit trail.')">
              <i class="fa fa-pen btn-icon"></i> EDIT RECORD
            </button>
            <button class="btn-ar" style="padding:8px 16px;font-size:0.62rem;width:100%;justify-content:center;background:linear-gradient(135deg,var(--nda-red),var(--nda-red-dark));"
              onclick="CDMS.showAlert('ACCESS LOG','Last accessed: TODAY\nAccessed by: CURRENT USER\nAll access to this dossier is logged per NDA security protocol.')">
              <i class="fa fa-clock-rotate-left btn-icon"></i> AUDIT LOG
            </button>
          </div>
        </div>

      </div><!-- /sidebar -->

      <!-- ── MAIN DOSSIER VIEWER ── -->
      <div class="profile-main">

        <!-- Dossier Tabs -->
        <div class="dossier-tabs">
          <button class="dossier-tab active" data-tab="dossier" onclick="CDMS.switchTab('dossier')">
            <i class="fa fa-folder-open"></i> DOSSIER PAGES
          </button>
          <button class="dossier-tab" data-tab="personal" onclick="CDMS.switchTab('personal')">
            <i class="fa fa-user"></i> PERSONAL INFO
          </button>
          <button class="dossier-tab" data-tab="service" onclick="CDMS.switchTab('service')">
            <i class="fa fa-shield"></i> SERVICE RECORD
          </button>
          <button class="dossier-tab" data-tab="academic" onclick="CDMS.switchTab('academic')">
            <i class="fa fa-graduation-cap"></i> ACADEMIC
          </button>
          <button class="dossier-tab" data-tab="medical" onclick="CDMS.switchTab('medical')">
            <i class="fa fa-briefcase-medical"></i> MEDICAL
          </button>
        </div>

        <!-- ── TAB: DOSSIER PAGES ── -->
        <div class="dossier-viewer">
          <div class="tab-content active" id="tab-dossier">
            <div class="dossier-page-header">
              <span class="dossier-page-num">
                <i class="fa fa-folder-open" style="color:var(--nda-gold);margin-right:6px;"></i>
                UPLOADED DOSSIER PAGES
              </span>
              <button class="btn-ar btn-ar-green" style="padding:6px 16px;font-size:0.62rem;"
                onclick="CDMS.handleUpload()">
                <i class="fa fa-plus btn-icon"></i> ADD PAGE
              </button>
            </div>

            <!-- Upload Zone -->
            <div class="dossier-upload-zone" onclick="CDMS.handleUpload()">
              <div class="upload-icon">&#128193;</div>
              <div class="upload-text">Drop scanned dossier pages here or click to upload</div>
              <div class="upload-sub">SUPPORTS: PDF · JPG · PNG · TIFF · MAX 50MB PER FILE</div>
            </div>

            <div class="section-label" style="margin-top:0;">
              <i class="fa fa-layer-group" style="color:var(--nda-gold);"></i>
              DOSSIER DOCUMENT PAGES
            </div>

            <!-- Dossier page thumbnails (populated by JS) -->
            <div class="dossier-pages-list" id="dossier-pages"></div>
          </div>

          <!-- ── TAB: PERSONAL INFO ── -->
          <div class="tab-content" id="tab-personal">
            <div class="section-label">
              <i class="fa fa-user-circle" style="color:var(--nda-gold);"></i>
              PERSONAL DETAILS
            </div>
            <div style="display:grid;grid-template-columns:1fr 1fr;gap:15px;margin-bottom:20px;">
              <div>
                <div class="detail-key" style="margin-bottom:4px;">FULL NAME</div>
                <div style="font-family:'Rajdhani',sans-serif;font-size:1rem;color:var(--text-primary);font-weight:600;" id="pi-name">—</div>
              </div>
              <div>
                <div class="detail-key" style="margin-bottom:4px;">DATE OF BIRTH</div>
                <div style="font-family:'Rajdhani',sans-serif;font-size:1rem;color:var(--text-primary);font-weight:600;" id="pi-dob">—</div>
              </div>
              <div>
                <div class="detail-key" style="margin-bottom:4px;">STATE OF ORIGIN</div>
                <div style="font-family:'Rajdhani',sans-serif;font-size:1rem;color:var(--nda-green-light);font-weight:600;" id="pi-state">—</div>
              </div>
              <div>
                <div class="detail-key" style="margin-bottom:4px;">SERVICE NUMBER</div>
                <div style="font-family:'Orbitron',sans-serif;font-size:0.85rem;color:var(--nda-gold);font-weight:700;" id="pi-svc">—</div>
              </div>
              <div>
                <div class="detail-key" style="margin-bottom:4px;">REGULAR COURSE</div>
                <div style="font-family:'Rajdhani',sans-serif;font-size:1rem;color:var(--text-primary);font-weight:600;" id="pi-rc">—</div>
              </div>
              <div>
                <div class="detail-key" style="margin-bottom:4px;">DATE OF ENLISTMENT</div>
                <div style="font-family:'Rajdhani',sans-serif;font-size:1rem;color:var(--text-primary);font-weight:600;" id="pi-enlist">—</div>
              </div>
              <div>
                <div class="detail-key" style="margin-bottom:4px;">COMMISSION DATE</div>
                <div style="font-family:'Rajdhani',sans-serif;font-size:1rem;color:var(--nda-gold);font-weight:600;" id="pi-commission">—</div>
              </div>
              <div>
                <div class="detail-key" style="margin-bottom:4px;">CURRENT RANK</div>
                <div style="font-family:'Rajdhani',sans-serif;font-size:1rem;color:var(--nda-red-light);font-weight:600;" id="pi-rank">—</div>
              </div>
            </div>

            <div class="section-label">
              <i class="fa fa-map-location" style="color:var(--nda-gold);"></i>
              NEXT OF KIN
            </div>
            <div style="background:rgba(26,92,42,0.08);border:1px solid rgba(212,160,23,0.12);
              padding:16px;font-family:'Share Tech Mono',monospace;font-size:0.65rem;
              color:var(--text-secondary);letter-spacing:0.05em;line-height:2;">
              NAME: [NEXT OF KIN NAME]<br/>
              RELATIONSHIP: [RELATIONSHIP]<br/>
              ADDRESS: [HOME ADDRESS]<br/>
              PHONE: [CONTACT NUMBER]
            </div>
          </div>

          <!-- ── TAB: SERVICE RECORD ── -->
          <div class="tab-content" id="tab-service">
            <div class="section-label">
              <i class="fa fa-shield-halved" style="color:var(--nda-gold);"></i>
              POSTINGS & APPOINTMENTS
            </div>
            <div style="overflow-x:auto;">
              <table style="width:100%;border-collapse:collapse;font-family:'Share Tech Mono',monospace;font-size:0.62rem;">
                <thead>
                  <tr style="border-bottom:1px solid rgba(212,160,23,0.3);">
                    <th style="text-align:left;padding:10px 8px;color:var(--nda-gold);letter-spacing:0.1em;">DATE</th>
                    <th style="text-align:left;padding:10px 8px;color:var(--nda-gold);letter-spacing:0.1em;">RANK</th>
                    <th style="text-align:left;padding:10px 8px;color:var(--nda-gold);letter-spacing:0.1em;">UNIT / APPOINTMENT</th>
                    <th style="text-align:left;padding:10px 8px;color:var(--nda-gold);letter-spacing:0.1em;">REMARKS</th>
                  </tr>
                </thead>
                <tbody id="service-table">
                  <!-- Populated by buildProfile -->
                </tbody>
              </table>
            </div>
          </div>

          <!-- ── TAB: ACADEMIC ── -->
          <div class="tab-content" id="tab-academic">
            <div class="section-label">
              <i class="fa fa-book" style="color:var(--nda-gold);"></i>
              ACADEMIC RECORD
            </div>
            <div style="display:flex;flex-direction:column;gap:12px;" id="academic-list">
              <!-- Populated by buildProfile -->
            </div>
          </div>

          <!-- ── TAB: MEDICAL ── -->
          <div class="tab-content" id="tab-medical">
            <div class="section-label">
              <i class="fa fa-notes-medical" style="color:var(--nda-gold);"></i>
              MEDICAL SUMMARY
            </div>
            <div style="background:rgba(192,57,43,0.05);border:1px solid rgba(192,57,43,0.2);
              padding:16px;margin-bottom:16px;">
              <div style="font-family:'Share Tech Mono',monospace;font-size:0.6rem;
                color:var(--nda-red-light);letter-spacing:0.15em;margin-bottom:8px;">
                <i class="fa fa-triangle-exclamation"></i>&nbsp; CLASSIFIED · RESTRICTED ACCESS
              </div>
              <div style="font-family:'Rajdhani',sans-serif;font-size:0.9rem;color:var(--text-secondary);">
                Medical records are restricted to authorised medical personnel and commanding officers only.
                Access to this section is logged and audited.
              </div>
            </div>
            <div style="display:grid;grid-template-columns:1fr 1fr;gap:12px;">
              <div style="padding:14px;background:rgba(26,92,42,0.08);border:1px solid rgba(212,160,23,0.1);">
                <div class="detail-key" style="margin-bottom:6px;">BLOOD GROUP</div>
                <div style="font-family:'Orbitron',sans-serif;font-size:1.2rem;color:var(--nda-red-light);">O+</div>
              </div>
              <div style="padding:14px;background:rgba(26,92,42,0.08);border:1px solid rgba(212,160,23,0.1);">
                <div class="detail-key" style="margin-bottom:6px;">MEDICAL CATEGORY</div>
                <div style="font-family:'Orbitron',sans-serif;font-size:1.2rem;color:var(--nda-green-light);">A1</div>
              </div>
              <div style="padding:14px;background:rgba(26,92,42,0.08);border:1px solid rgba(212,160,23,0.1);">
                <div class="detail-key" style="margin-bottom:6px;">HEIGHT</div>
                <div style="font-family:'Rajdhani',sans-serif;font-size:1rem;color:var(--text-primary);font-weight:600;">1.78m</div>
              </div>
              <div style="padding:14px;background:rgba(26,92,42,0.08);border:1px solid rgba(212,160,23,0.1);">
                <div class="detail-key" style="margin-bottom:6px;">WEIGHT</div>
                <div style="font-family:'Rajdhani',sans-serif;font-size:1rem;color:var(--text-primary);font-weight:600;">78 KG</div>
              </div>
            </div>
            <div style="margin-top:16px;">
              <button class="btn-ar btn-ar-outline" style="padding:10px 20px;font-size:0.65rem;"
                onclick="CDMS.showAlert('MEDICAL RECORDS','Full medical records require Level 2 Medical Authorization. Contact NDA Medical Centre to access detailed records.')">
                <i class="fa fa-file-medical btn-icon"></i> VIEW FULL MEDICAL FILE
              </button>
            </div>
          </div>

        </div><!-- /dossier-viewer -->
      </div><!-- /profile-main -->
    </div><!-- /profile-layout -->
  </div>
</div><!-- /page-profile -->


<!-- ============================================================
     SCRIPTS
     ============================================================ -->
<script src="transitions.js"></script>
<script>
// ── Extra JS injected after transitions.js loads ──────────────

// Filter RC grid
CDMS.filterRC = function(val) {
  const v = val.toLowerCase();
  document.querySelectorAll('.rc-btn').forEach(btn => {
    const rc   = btn.dataset.rc;
    const year = btn.dataset.year;
    const show = !v || `rc ${rc}`.includes(v) || `regular course ${rc}`.includes(v) || year.includes(v);
    btn.style.display = show ? '' : 'none';
  });
};

// Filter cadet list
CDMS.filterCadets = function(val) {
  const v = val.toLowerCase();
  document.querySelectorAll('.cadet-card').forEach(card => {
    const text = card.textContent.toLowerCase();
    card.style.display = !v || text.includes(v) ? '' : 'none';
  });
};

// Build service table when profile opens
const _origBuildProfile = CDMS.buildProfile.bind(CDMS);
CDMS.buildProfile = function(cadet) {
  _origBuildProfile(cadet);

  // Personal info tab mirror
  const setPI = (id, val) => { const el = document.getElementById(id); if(el) el.textContent = val; };
  setPI('pi-name', cadet.name);
  setPI('pi-dob', cadet.dob);
  setPI('pi-state', cadet.state + ' STATE');
  setPI('pi-svc', cadet.svcNo);
  setPI('pi-rc', 'Regular Course ' + cadet.rc);
  setPI('pi-enlist', cadet.enlistDate);
  setPI('pi-commission', cadet.commission);
  setPI('pi-rank', cadet.rank);

  // Service record table
  const tbody = document.getElementById('service-table');
  if (tbody) {
    const entries = generateServiceRecord(cadet);
    tbody.innerHTML = entries.map((e,i) => `
      <tr style="border-bottom:1px solid rgba(212,160,23,0.07);
        background:${i%2===0?'rgba(26,92,42,0.05)':'transparent'}">
        <td style="padding:9px 8px;color:var(--text-secondary);">${e.date}</td>
        <td style="padding:9px 8px;color:var(--nda-gold);">${e.rank}</td>
        <td style="padding:9px 8px;color:var(--text-primary);">${e.unit}</td>
        <td style="padding:9px 8px;color:rgba(168,213,176,0.6);">${e.remarks}</td>
      </tr>
    `).join('');
  }

  // Academic list
  const acList = document.getElementById('academic-list');
  if (acList && cadet.qualifications) {
    acList.innerHTML = cadet.qualifications.map((q,i) => `
      <div style="display:flex;align-items:center;gap:14px;padding:14px;
        background:rgba(26,92,42,0.08);border:1px solid rgba(212,160,23,0.1);">
        <div style="width:36px;height:36px;background:rgba(212,160,23,0.15);
          display:flex;align-items:center;justify-content:center;
          font-family:'Orbitron',sans-serif;font-size:0.7rem;color:var(--nda-gold);
          flex-shrink:0;">${i+1}</div>
        <div>
          <div style="font-family:'Rajdhani',sans-serif;font-size:0.95rem;
            font-weight:600;color:var(--text-primary);">${q}</div>
          <div style="font-family:'Share Tech Mono',monospace;font-size:0.58rem;
            color:var(--text-secondary);margin-top:3px;letter-spacing:0.08em;">
            ${i===0?'NDA ACADEMIC QUALIFICATION':'PROFESSIONAL QUALIFICATION'}</div>
        </div>
        <div style="margin-left:auto;">
          <span class="info-tag green">VERIFIED</span>
        </div>
      </div>
    `).join('');
  }

  // Show HUD elements
  document.getElementById('main-hud').style.display = 'flex';
  document.getElementById('main-breadcrumb').style.display = 'flex';
  document.getElementById('logout-btn').style.display = '';
};

// Show HUD after login
const _origHandleLogin = CDMS.handleLogin.bind(CDMS);
CDMS.handleLogin = function(e) {
  e.preventDefault();
  const user = document.getElementById('login-username')?.value;
  const pass = document.getElementById('login-password')?.value;
  if (!user || !pass) {
    CDMS.showAlert('ACCESS DENIED', 'Please enter your credentials to proceed.');
    return;
  }
  CDMS.showLoading('AUTHENTICATING...', () => {
    const hudUser = document.getElementById('hud-username');
    const hudUserDisplay = document.getElementById('hud-user-display');
    if (hudUser) hudUser.textContent = user.toUpperCase();
    if (hudUserDisplay) hudUserDisplay.style.display = 'flex';
    document.getElementById('main-hud').style.display = 'flex';
    document.getElementById('main-breadcrumb').style.display = 'flex';
    document.getElementById('logout-btn').style.display = '';
    CDMS.buildDashboard();
    CDMS.navigateTo('page-dashboard', 'forward');
    CDMS.updateBreadcrumb();
  });
};

// Hide HUD on logout
const _origLogout = CDMS.logout.bind(CDMS);
CDMS.logout = function() {
  document.getElementById('main-hud').style.display = 'none';
  document.getElementById('main-breadcrumb').style.display = 'none';
  document.getElementById('logout-btn').style.display = 'none';
  const hudUserDisplay = document.getElementById('hud-user-display');
  if (hudUserDisplay) hudUserDisplay.style.display = 'none';
  _origLogout();
};

// Service record generator
function generateServiceRecord(cadet) {
  const commYear = parseInt(cadet.commission.split(' ').pop()) || 1970;
  const ranks = ['SECOND LIEUTENANT','LIEUTENANT','CAPTAIN','MAJOR','LIEUTENANT COLONEL','COLONEL'];
  const entries = [];
  for (let i = 0; i < Math.min(6, ranks.length); i++) {
    const year = commYear + i * 2;
    entries.push({
      date: `${Math.floor(Math.random()*28)+1} ${['JAN','OCT','APR','JUL'][i%4]} ${year}`,
      rank: ranks[i],
      unit: cadet.unit + (i > 0 ? ` / ${['HQ','OC','2IC','CO','GOC','COAS'][i]} APPOINTMENT` : ' PLATOON CDR'),
      remarks: i === 0 ? 'COMMISSIONED' : ['PROMOTED','POSTED','PROMOTED & POSTED','COURSE POSTING'][i%4],
    });
  }
  return entries;
}
</script>

</body>
</html>