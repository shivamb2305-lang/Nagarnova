# CivicLens — Pure HTML, CSS & Vanilla JavaScript Platform

## Overview
The entire frontend of **CivicLens** has been successfully converted from React into clean, modern **Vanilla HTML5, CSS3, and JavaScript (ES6+)**.

---

## 🌟 Highlights of the Converted Platform

1. **Zero Framework Dependencies**:
   - Built entirely with native **HTML5**, **CSS3**, and **Vanilla JavaScript**.
   - No React runtime or build complexity required to view or run the platform.

2. **Complete Feature Parity**:
   - 🏠 **Home Page**: Interactive hero, live database metrics counters, 5-step citizen workflow cards, filterable recent reports with category chips and search.
   - 📍 **Live Interactive Map**: Full-viewport Leaflet map with custom status/severity color-coded SVG markers, interactive popups, search & filter controls, and collapsible report drawer.
   - 📸 **AI-Powered Issue Reporting**: Image upload dropzone, 4 one-click sample hazards, simulated AI Vision scanner with animated laser beam, confidence metrics, and interactive mini-map location picker with draggable GPS pin.
   - 📋 **My Reports**: Personal citizen dashboard with a 4-milestone municipal resolution timeline tracker (*Submitted → Ward Verified → In Progress → Resolved*).
   - 🏆 **Gamified Leaderboard**: Top 3 Citizen Podium (Gold, Silver, Bronze), ranking table, and civic points/badges showcase.
   - 👤 **Citizen Profile**: Avatar, contact info, total civic XP progression, and earned honor badges.
   - 🛡️ **Admin Triage & Analytics**: Incident triage queue table with action buttons (*Verify, Start Work, Resolve*) and high-precision **Chart.js** charts (Category Doughnut & Status Bar).
   - 🔐 **Authentication**: One-click demo login buttons (*Citizen Demo* & *Admin Demo*), Phone OTP simulation, and Citizen Registration.
   - 🔔 **Real-Time Notification System**: Floating animated toast alerts and WebSocket (Socket.IO) connectivity.

3. **Stunning Modern Aesthetics**:
   - Premium dark-mode glassmorphic design system (`#020617` obsidian background).
   - Google Fonts: **Outfit** for headlines and **Inter** for clean readability.
   - Neon glow effects, custom modern scrollbars, and fluid micro-animations.

---

## 📁 Converted File Structure

```
client/
├── index.html          # Semantic HTML5 layout containing all SPA views & modals
├── css/
│   └── style.css       # Complete Vanilla CSS design system, glassmorphism tokens & animations
├── js/
│   └── app.js          # Pure JavaScript state store, hash-based router, Leaflet map & Chart.js logic
└── public/
    ├── css/style.css   # Mirror for production build
    └── js/app.js       # Mirror for production build
```

---

## 🚀 How to Run

### Method 1: Instant Browser Launch (No Node.js Required)
Simply double-click or open [client/index.html](file:///c:/Users/Admin/Desktop/cep_project/client/index.html) directly in any modern web browser (Chrome, Edge, Firefox).

### Method 2: Via Vite Live Dev Server
If running via the terminal or `npm run dev`:
- **Frontend URL**: `http://localhost:5173`
- **Backend API**: `http://localhost:5000` (optional; falls back seamlessly to local seed data if server is offline)

### Method 3: Production Build
```bash
npm --prefix client run build
```
The optimized bundle is output to `client/dist/`.
