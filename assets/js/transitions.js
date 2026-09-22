/* ============================================================
   CDMS - AR Transition Engine
   Nigerian Defence Academy - Cadet Dossier Management System
   ============================================================ */

const CDMS = {
  currentPage: 'page-dashboard',
  history: ['page-dashboard'],
  transitionDuration: 800,
  isTransitioning: false,

  // ── Navigation State ──────────────────────────────────────
  state: {
    selectedRC: null,
    selectedCadet: null,
  },

  // ── All Cadet Data (RC1 – RC77) ───────────────────────────
  rcData: generateRCData(),

  // ── Initialize ────────────────────────────────────────────
  init() {
    document.getElementById('loading-screen')?.remove();
    this.updateClock();
    setInterval(() => this.updateClock(), 1000);
    this.bindGlobalEvents();
  },

  // ── Clock ─────────────────────────────────────────────────
  updateClock() {
    const now = new Date();
    const timeStr = now.toLocaleTimeString('en-GB', { hour12: false });
    const dateStr = now.toLocaleDateString('en-GB', {
      day: '2-digit', month: 'short', year: 'numeric'
    }).toUpperCase();
    document.querySelectorAll('.hud-clock').forEach(el => el.textContent = timeStr);
    document.querySelectorAll('.hud-date').forEach(el => el.textContent = dateStr);
  },

  // ── Page Transition ───────────────────────────────────────
  navigateTo(targetPageId, direction = 'forward') {
    if (this.isTransitioning || targetPageId === this.currentPage) return;
    this.isTransitioning = true;

    const currentEl = document.getElementById(this.currentPage);
    const targetEl  = document.getElementById(targetPageId);
    if (!currentEl || !targetEl) { this.isTransitioning = false; return; }

    // Flash effect
    this.flashTransition();

    // Exit current page
    currentEl.classList.remove('active', 'enter-forward', 'enter-backward');
    currentEl.classList.add(direction === 'forward' ? 'exit-forward' : 'exit-backward');

    // Enter new page
    targetEl.style.display = 'block';
    targetEl.classList.remove('active', 'exit-forward', 'exit-backward', 'enter-forward', 'enter-backward');
    targetEl.classList.add(direction === 'forward' ? 'enter-forward' : 'enter-backward');

    setTimeout(() => {
      currentEl.classList.remove('exit-forward', 'exit-backward');
      currentEl.style.display = 'none';
      targetEl.classList.remove('enter-forward', 'enter-backward');
      targetEl.classList.add('active');
      this.currentPage = targetPageId;
      if (direction === 'forward') {
        this.history.push(targetPageId);
      } else {
        this.history.pop();
      }
      this.isTransitioning = false;
      this.updateBreadcrumb();
      this.updateActiveTab();
    }, this.transitionDuration);
  },

  // ── Update active tab ───────────────────────────────────────
  updateActiveTab() {
    document.querySelectorAll('.hud-tab').forEach(tab => {
      tab.classList.remove('active');
      if (tab.dataset.target === this.currentPage) {
        tab.classList.add('active');
      }
    });
  },

  goBack() {
    if (this.history.length <= 1) return;
    const prev = this.history[this.history.length - 2];
    this.navigateTo(prev, 'backward');
  },

  showPage(pageId, animate = false) {
    document.querySelectorAll('.page').forEach(p => {
      p.style.display = 'none';
      p.classList.remove('active', 'enter-forward', 'enter-backward', 'exit-forward', 'exit-backward');
    });
    const el = document.getElementById(pageId);
    if (el) {
      el.style.display = 'block';
      el.classList.add('active');
      this.currentPage = pageId;
    }
  },

  // ── Flash overlay on transition ───────────────────────────
  flashTransition() {
    const flash = document.createElement('div');
    flash.style.cssText = `
      position:fixed; top:0; left:0; width:100%; height:100%;
      background: radial-gradient(ellipse at center,
        rgba(212,160,23,0.15) 0%, transparent 70%);
      pointer-events:none; z-index:900;
      animation: flashFade 0.6s ease forwards;
    `;
    const style = document.createElement('style');
    style.textContent = `@keyframes flashFade { 0%{opacity:0} 20%{opacity:1} 100%{opacity:0} }`;
    document.head.appendChild(style);
    document.body.appendChild(flash);
    setTimeout(() => { flash.remove(); style.remove(); }, 700);
  },

  // ── Breadcrumb ─────────────────────────────────────────────
  updateBreadcrumb() {
    const bc = document.getElementById('main-breadcrumb');
    if (!bc) return;
    const parts = ['CDMS'];
    const page = this.currentPage;
    if (page === 'page-login') parts.push('LOGIN');
    if (page === 'page-dashboard') parts.push('DASHBOARD');
    if (page === 'page-upload-intakes') parts.push('UPLOAD NEW INTAKES');
    if (page === 'page-regular-course') parts.push('REGULAR COURSE');
    if (page === 'page-reports') parts.push('REPORTS & ANALYTICS');
    if (page === 'page-cadets') {
      parts.push('DASHBOARD');
      parts.push(`RC ${this.state.selectedRC}`);
    }
    if (page === 'page-profile') {
      parts.push('DASHBOARD');
      parts.push(`RC ${this.state.selectedRC}`);
      parts.push(this.state.selectedCadet?.shortName || 'CADET');
    }
    bc.innerHTML = parts.map((p, i) =>
      i === parts.length - 1
        ? `<span>${p}</span>`
        : `<span class="sep-item">${p}</span><span class="sep"> ▶ </span>`
    ).join('');
  },
 
  // ── Loading overlay ────────────────────────────────────────
  showLoading(msg, callback, duration = 1500) {
    const overlay = document.getElementById('loading-overlay');
    const txt = document.getElementById('loading-overlay-text');
    if (overlay) {
      if (txt) txt.textContent = msg;
      overlay.classList.add('open');
      setTimeout(() => {
        overlay.classList.remove('open');
        if (callback) callback();
      }, duration);
    } else {
      setTimeout(() => { if (callback) callback(); }, 300);
    }
  },

  // ── Load Dashboard Stats ────────────────────────────────────────
  loadDashboardStats() {
    fetch('/api/dashboard.php?action=stats')
      .then(r => r.json())
      .then(data => {
        if (data.success && data.data) {
          const stats = data.data;
          document.getElementById('total-cadets').textContent = stats.total_cadets;
          document.getElementById('active-cadets').textContent = stats.active_cadets;
          document.getElementById('total-courses').textContent = stats.total_courses;
          document.getElementById('total-users').textContent = stats.total_users;
          document.getElementById('service-army').textContent = stats.services.ARMY || 0;
          document.getElementById('service-navy').textContent = stats.services.NAVY || 0;
          document.getElementById('service-airforce').textContent = stats.services.AIR_FORCE || 0;
        }
      })
      .catch(err => console.error('Failed to load stats:', err));
  },

  // ── Build Dashboard ────────────────────────────────────────
  buildDashboard() {
    const grid = document.getElementById('rc-grid');
    if (!grid || grid.dataset.built) return;
    grid.dataset.built = 'true';
    grid.innerHTML = '';

    // Load stats
    this.loadDashboardStats();

    const rcYears = getRCYears();

    for (let rc = 1; rc <= 77; rc++) {
      const btn = document.createElement('button');
      btn.className = 'rc-btn';
      btn.dataset.rc = rc;
      btn.dataset.year = rcYears[rc] || '';
      btn.dataset.searchable = `rc${rc}`;
      btn.innerHTML = `
        <span class="rc-num">${rc}</span>
        <span class="rc-label">REG COURSE</span>
      `;
      btn.addEventListener('click', () => this.openRC(rc));
      grid.appendChild(btn);
    }
  },

  // ── Filter RC buttons ────────────────────────────────────────
  filterRC(query) {
    const buttons = document.querySelectorAll('.rc-btn');
    const q = query.toLowerCase();
    buttons.forEach(btn => {
      const rc = btn.dataset.rc;
      const year = btn.dataset.year;
      const matches = rc.includes(q) || year.includes(q);
      btn.style.display = matches ? 'flex' : 'none';
    });
  },

  // ── Open RC (Cadet List) ───────────────────────────────────
  openRC(rcNumber) {
    this.state.selectedRC = rcNumber;
    this.loadCadetListForRC(rcNumber);
    this.navigateTo('page-cadets', 'forward');
  },

  // ── Load Cadets for RC from Database ──────────────────────
  loadCadetListForRC(rcNumber) {
    // Update header
    const badge = document.getElementById('rc-badge-text');
    const title = document.getElementById('cadets-title');
    if (badge) badge.textContent = `REGULAR COURSE ${rcNumber}`;
    if (title) title.textContent = `RC ${rcNumber} CADET ROSTER`;

    // Load from database
    fetch(`/api/dashboard.php?action=cadets_by_course&course=RC${rcNumber}`)
      .then(r => r.json())
      .then(data => {
        if (data.success) {
          this.displayCadetList(data.data);
        }
      })
      .catch(err => {
        console.error('Failed to load cadets:', err);
        // Fallback to generated data
        const cadets = this.rcData[rcNumber] || [];
        this.buildCadetList(rcNumber, cadets);
      });
  },

  // ── Display Cadet List ──────────────────────────────────────
  displayCadetList(cadets) {
    const count = document.getElementById('cadets-count');
    if (count) count.textContent = cadets.length;

    const grid = document.getElementById('cadet-grid');
    if (!grid) return;
    grid.innerHTML = '';

    cadets.forEach((cadet) => {
      const card = document.createElement('div');
      card.className = 'cadet-card';
      const initials = (cadet.surname + ' ' + cadet.other_names)
        .split(' ')
        .map(n => n[0])
        .slice(0,2)
        .join('');
      
      card.innerHTML = `
        <div class="cadet-avatar">${initials}</div>
        <div class="cadet-name">${cadet.surname}, ${cadet.other_names}</div>
        <div class="cadet-num" style="font-size:0.7rem;">ID: ${cadet.nda_no}</div>
        <div class="cadet-arm" style="font-size:0.65rem;">${cadet.service || 'ARMY'} · ${cadet.state}</div>
      `;
      card.addEventListener('click', () => this.openCadetDetail(cadet));
      card.style.cursor = 'pointer';
      grid.appendChild(card);
    });
  },

  // ── Filter Cadets ──────────────────────────────────────────
  filterCadets(query) {
    const cards = document.querySelectorAll('.cadet-card');
    const q = query.toLowerCase();
    cards.forEach(card => {
      const text = card.textContent.toLowerCase();
      card.style.display = text.includes(q) ? 'flex' : 'none';
    });
  },

  // ── Open Cadet Detail ──────────────────────────────────────
  openCadetDetail(cadet) {
    this.state.selectedCadet = cadet;
    fetch(`/api/dashboard.php?action=cadet_detail&cadet_id=${cadet.id}`)
      .then(r => r.json())
      .then(data => {
        if (data.success) {
          this.buildProfileDetail(data.data);
          this.navigateTo('page-profile', 'forward');
        }
      })
      .catch(err => {
        console.error('Failed to load cadet detail:', err);
        this.buildProfileDetail(cadet);
        this.navigateTo('page-profile', 'forward');
      });
  },

  // ── Build Profile from DB data ─────────────────────────────
  buildProfileDetail(cadet) {
    const fields = {
      'profile-name': cadet.surname + ' ' + cadet.other_names,
      'profile-nda': cadet.nda_no,
      'profile-dob': cadet.date_of_birth || 'N/A',
      'profile-rc': `Regular Course --`,
      'profile-state': cadet.state,
      'profile-service': cadet.service,
      'profile-battalion': cadet.battalion,
      'profile-course': cadet.course,
      'profile-faculty': cadet.faculty || 'N/A',
      'profile-department': cadet.department || 'N/A',
      'profile-initials': (cadet.surname[0] + cadet.other_names[0]).toUpperCase(),
    };
    for (const [id, val] of Object.entries(fields)) {
      const el = document.getElementById(id);
      if (el) el.textContent = val;
    }
  },
  },

  buildProfile(cadet) {
    const fields = {
      'profile-name': cadet.name,
      'profile-rank': cadet.rank,
      'profile-svc': cadet.svcNo,
      'profile-rc': `Regular Course ${cadet.rc}`,
      'profile-dob': cadet.dob,
      'profile-state': cadet.state,
      'profile-arm': cadet.arm,
      'profile-unit': cadet.unit,
      'profile-commission': cadet.commission,
      'profile-initials': cadet.name.split(' ').map(n => n[0]).slice(0,2).join(''),
    };
    for (const [id, val] of Object.entries(fields)) {
      const el = document.getElementById(id);
      if (el) el.textContent = val;
    }

    // Populate tags
    const tagsEl = document.getElementById('profile-awards');
    if (tagsEl && cadet.awards) {
      tagsEl.innerHTML = cadet.awards.map(a =>
        `<span class="info-tag gold">${a}</span>`
      ).join('');
    }

    const qualEl = document.getElementById('profile-quals');
    if (qualEl && cadet.qualifications) {
      qualEl.innerHTML = cadet.qualifications.map(q =>
        `<span class="info-tag green">${q}</span>`
      ).join('');
    }

    // Dossier pages
    this.buildDossierPages(cadet);
  },

  buildDossierPages(cadet) {
    const container = document.getElementById('dossier-pages');
    if (!container) return;
    const pages = [
      { icon: '📋', name: 'ENLISTMENT FORM', date: cadet.enlistDate },
      { icon: '🪪', name: 'ID RECORDS', date: cadet.commission },
      { icon: '📊', name: 'ACADEMIC TRANSCRIPT', date: cadet.commission },
      { icon: '🏅', name: 'AWARDS & HONOURS', date: cadet.commission },
      { icon: '🩺', name: 'MEDICAL RECORDS', date: cadet.enlistDate },
      { icon: '📝', name: 'ANNUAL APPRAISAL', date: cadet.commission },
      { icon: '🎖️', name: 'COMMISSION CERT', date: cadet.commission },
      { icon: '📁', name: 'MISCELLANEOUS', date: 'N/A' },
    ];
    container.innerHTML = pages.map(p => `
      <div class="dossier-page-thumb" onclick="CDMS.openDossierPage('${p.name}')">
        <span class="page-icon">${p.icon}</span>
        <div class="page-name">${p.name}</div>
        <div class="page-date">${p.date}</div>
      </div>
    `).join('');
  },

  openDossierPage(pageName) {
    this.showAlert('DOSSIER PAGE', `Opening: ${pageName}\n\nThis feature allows uploading and viewing scanned dossier pages. In a live deployment, this would open the scanned document viewer.`);
  },

  // ── Dossier Tabs ───────────────────────────────────────────
  switchTab(tabId) {
    document.querySelectorAll('.dossier-tab').forEach(t => t.classList.remove('active'));
    document.querySelectorAll('.tab-content').forEach(c => c.classList.remove('active'));
    document.querySelector(`[data-tab="${tabId}"]`)?.classList.add('active');
    document.getElementById(`tab-${tabId}`)?.classList.add('active');
  },

  // ── Alert Modal ────────────────────────────────────────────
  showAlert(title, message) {
    const overlay = document.getElementById('alert-overlay');
    const titleEl = document.getElementById('alert-title');
    const msgEl   = document.getElementById('alert-message');
    if (!overlay) return;
    if (titleEl) titleEl.textContent = title;
    if (msgEl)   msgEl.textContent   = message;
    overlay.classList.add('open');
  },

  closeAlert() {
    document.getElementById('alert-overlay')?.classList.remove('open');
  },

  // ── Global Key Events ──────────────────────────────────────
  bindGlobalEvents() {
    document.addEventListener('keydown', e => {
      if (e.key === 'Escape') this.closeAlert();
      if (e.key === 'Backspace' && e.altKey) this.goBack();
    });
  },

  // ── Upload Simulation ──────────────────────────────────────
  handleUpload() {
    this.showAlert('UPLOAD DOSSIER', 'Select a scanned dossier page (PDF/JPG/PNG) to upload for this cadet. In a live system this would connect to the document management server.');
  },

  // ── Show Alert Modal ──────────────────────────────────────────
  showAlert(title, message) {
    const overlay = document.getElementById('alert-overlay');
    if (!overlay) return;
    document.getElementById('alert-title').textContent = title;
    document.getElementById('alert-message').textContent = message;
    overlay.style.display = 'flex';
  },

  // ── Close Alert Modal ─────────────────────────────────────────
  closeAlert() {
    const overlay = document.getElementById('alert-overlay');
    if (overlay) overlay.style.display = 'none';
  },

  // ── Handle Upload ────────────────────────────────────────────
  handleUpload() {
    this.showAlert('UPLOAD', 'Upload functionality coming soon.\n\nThis would open a file dialog to upload dossier pages.');
  },

  // ── Logout ─────────────────────────────────────────────────
  logout() {
    this.state.selectedRC = null;
    this.state.selectedCadet = null;
    this.history = ['page-dashboard'];
    window.location.href = '/login.php';
  },

/* ============================================================
   DATA GENERATION HELPERS
   ============================================================ */
function getRCYears() {
  // RC1 started approximately 1964, each course ~1 year apart
  const years = {};
  for (let i = 1; i <= 77; i++) {
    years[i] = 1964 + (i - 1);
  }
  return years;
}

function generateRCData() {
  const data = {};
  const firstNames = [
    'IBRAHIM','CHUKWUEMEKA','ADEBAYO','MUSA','YAKUBU','OLUWASEUN','ABDULLAHI',
    'CHIBUEZE','SULEIMAN','TUNDE','USMAN','EMEKA','BELLO','SUNDAY','JOHN',
    'PETER','PAUL','JAMES','JOSEPH','SAMUEL','DAVID','DANIEL','HENRY','RICHARD',
    'VICTOR','FESTUS','GABRIEL','RAYMOND','CHARLES','ANTHONY','MICHAEL','GEORGE',
    'RAYMOND','FRANK','CLEMENT','DOMINIC','SIMON','THOMAS','PHILIP','ANDREW'
  ];
  const lastNames = [
    'ABUBAKAR','OKAFOR','ADEYEMI','HASSAN','GARBA','OLUWOLE','MOHAMMED',
    'NWOSU','DANJUMA','FASHOLA','IBRAHIM','EZE','ALIYU','ADEYINKA','OKEKE',
    'NWACHUKWU','ADEBISI','BAMIDELE','OKONKWO','SANI','LAWAL','MUSA','YUSUF',
    'DANGANA','SALEH','ADAMU','BELLO','KALU','OSEI','NNAMDI','UCHE','OBIORA',
    'NGOZI','IKENNA','CHIDI','NDUKA','ONWUALU','IFEANYI','AMADI','OBI'
  ];
  const states = [
    'KANO','LAGOS','KADUNA','RIVERS','OYO','BORNO','ANAMBRA','KATSINA',
    'OGUN','PLATEAU','BENUE','NIGER','BAUCHI','IMO','DELTA','ENUGU',
    'SOKOTO','KEBBI','ZAMFARA','GOMBE','YOBE','ADAMAWA','TARABA','NASARAWA',
    'KOGI','KWARA','OSUN','ONDO','EKITI','EDO','CROSS RIVER','AKWA IBOM',
    'ABIA','EBONYI','FCT','JIGAWA','BAYELSA','OGUN'
  ];
  const arms = [
    'INFANTRY','ARTILLERY','SIGNALS','ENGINEERS','ARMOURED','SUPPLY & TRANSPORT',
    'MEDICAL CORPS','INTELLIGENCE CORPS','MILITARY POLICE','ARMY EDUCATION CORPS',
    'ORDNANCE CORPS','ELECTRICAL & MECH ENG','FINANCE CORPS','LEGAL CORPS'
  ];
  const units = [
    '1 BN','2 BN','3 BN','4 BN','7 BN','9 BN','72 BN','82 DIV',
    'ARMY HQ','NDA','DICON','1 MECH DIV','3 ARMD DIV','81 DIV'
  ];
  const ranks = [
    'GENERAL','LIEUTENANT GENERAL','MAJOR GENERAL','BRIGADIER GENERAL',
    'COLONEL','LIEUTENANT COLONEL','MAJOR','CAPTAIN','LIEUTENANT'
  ];
  const awards = [
    ['MSM','FSS','MON'],['DSS','MON'],['GSS','FSS'],['CON','MON'],
    ['DSO','MSM'],['MON'],['FSS'],['GSS','MON'],['DSS','FSS'],['MON','MSM']
  ];
  const quals = [
    ['BSc DEFENCE STUDIES','MSc SECURITY STUDIES'],
    ['BSc ECONOMICS','psc'],
    ['BSc ENGINEERING','IDAN COURSE'],
    ['BA POLITICAL SCIENCE','ACSC'],
    ['BSc COMPUTER SCIENCE','psc','fwc'],
    ['BA HISTORY','MSc'],
    ['BSc PHYSICS','psc'],
    ['MBBS','psc'],
    ['LLB','BL','psc'],
    ['BSc ELECTRICAL ENG','MSc']
  ];

  for (let rc = 1; rc <= 77; rc++) {
    const numCadets = Math.floor(Math.random() * 15) + 8; // 8-22 cadets per RC
    data[rc] = [];
    const year = 1964 + (rc - 1);
    const commissionYear = year + 3;

    for (let j = 0; j < numCadets; j++) {
      const fn = firstNames[Math.floor(Math.random() * firstNames.length)];
      const ln = lastNames[Math.floor(Math.random() * lastNames.length)];
      const rcStr = String(rc).padStart(2, '0');
      const jStr  = String(j + 1).padStart(3, '0');
      const arm   = arms[Math.floor(Math.random() * arms.length)];
      const state = states[Math.floor(Math.random() * states.length)];
      const unit  = units[Math.floor(Math.random() * units.length)];
      const rankIdx = Math.max(0, 8 - Math.floor(rc / 10));
      const rank  = ranks[Math.min(rankIdx, ranks.length - 1)];
      const dobYear = year - 20 + Math.floor(Math.random() * 4);
      const awardSet = awards[Math.floor(Math.random() * awards.length)];
      const qualSet  = quals[Math.floor(Math.random() * quals.length)];

      data[rc].push({
        name: `${ln} ${fn}`,
        shortName: `${ln}`,
        svcNo: `N/RC${rcStr}/${jStr}`,
        rc: rc,
        rank: rank,
        arm: arm,
        state: state,
        unit: unit,
        dob: `${Math.floor(Math.random()*28)+1} ${['JAN','FEB','MAR','APR','MAY','JUN','JUL','AUG','SEP','OCT','NOV','DEC'][Math.floor(Math.random()*12)]} ${dobYear}`,
        enlistDate: `${Math.floor(Math.random()*28)+1} ${['JAN','FEB','MAR','APR','MAY','JUN'][Math.floor(Math.random()*6)]} ${year}`,
        commission: `${Math.floor(Math.random()*28)+1} ${['JUN','JUL','AUG','DEC'][Math.floor(Math.random()*4)]} ${commissionYear}`,
        honour: Math.random() > 0.85,
        awards: awardSet,
        qualifications: qualSet,
      });
    }
  }
  return data;
}

// Auto-init on DOM ready
document.addEventListener('DOMContentLoaded', () => {
  setTimeout(() => CDMS.init(), 2000);
});