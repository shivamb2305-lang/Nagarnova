# 🏛️ NAGARNOVA — Civic Issue Reporting Platform

> **“See the Problem. Report It. Make the City Better.”**

NAGARNOVA is a production-grade, full-stack civic reporting and municipal tracking web platform. Built with a dark glassmorphic design system, it empowers citizens to report urban infrastructure hazards (potholes, garbage, broken streetlights, water leakages, drainage blocks) using **Vision AI automated inspection**, **interactive OpenStreetMap / Leaflet geospatial pinpointing**, **Cloudinary permanent photo storage**, **MongoDB Atlas database**, and **Socket.IO real-time synchronization**.

---

## 🌟 Key Features

1. **Real-Time Vision AI Civic Inspection**:
   - Analyzes uploaded issue photos using Google Gemini Vision (or OpenAI GPT-4o).
   - Extracts structured JSON: Category, Hazard Severity (Critical, High, Medium, Low), Confidence Score, Anomaly Description, and Recommended Municipal Action.
   - Citizens can review, adjust, and correct findings before lodging the complaint.

2. **Precision Geospatial Mapping (Leaflet + OpenStreetMap)**:
   - Interactive GIS map with custom color-coded neon pins.
   - Draggable marker, browser GPS geolocation, search autocomplete, and automated reverse geocoding via Nominatim.
   - Filter map markers by category and status in real-time.

3. **Grievance Lifecycle Tracking**:
   - Four transparent milestones: **Submitted** &rarr; **Verified** &rarr; **In Progress** &rarr; **Resolved** (or Rejected).
   - Full audit trail of updates and administrative notes.

4. **Municipal Admin Command Center**:
   - Protected dashboard with live database aggregation metrics (Total, Submitted, Verified, In Progress, Resolved, Citizens).
   - Rich interactive charts powered by **Recharts**:
     - Reports by Civic Category (Bar Chart)
     - Reports by Municipal Status (Donut Chart)
     - Monthly Intake vs Resolution Trends (Area Chart)
     - Risk Severity Distribution (Bar Chart)
   - Status actions with automated reward point dispatch, inspection modal, and permanent report deletion.

5. **Community Gamification & Civic Points**:
   - Citizens earn points for active participation:
     - **Report Submitted**: `+10 points`
     - **Report Verified**: `+20 points`
     - **Report Resolved**: `+30 points`
   - Community Leaderboard with Top 3 Podium and automatic badge awards:
     - 🚩 *First Reporter* (1st report filed)
     - 🛡️ *Civic Helper* (3+ reports or 50+ pts)
     - 🎖️ *Community Hero* (10+ reports or 200+ pts)
     - ⭐ *Civic Champion* (25+ reports or 500+ pts)
     - 👑 *City Guardian* (50+ reports or 1000+ pts)

6. **Page-Specific Realistic Urban Backgrounds**:
   - Distinct high-resolution photographs for every primary page (`home.jpg`, `login.jpg`, `register.jpg`, `report.jpg`, `map.jpg`, `reports.jpg`, `admin.jpg`, `leaderboard.jpg`).
   - Covered with modern dark glassmorphic gradient overlays for optimal text contrast and sleek aesthetics.

---

## 🛠️ Technology Stack

| Layer | Technology |
|---|---|
| **Frontend UI** | React 18, Vite, Tailwind CSS, Lucide React, Recharts |
| **Geospatial / GIS** | Leaflet, React-Leaflet, OpenStreetMap, Nominatim API |
| **Backend API** | Node.js, Express.js, Helmet, CORS, Express Rate Limit |
| **Real-time WebSockets** | Socket.IO (Bidirectional updates for map and user timeline) |
| **Database** | MongoDB Atlas with Mongoose ODM |
| **Authentication** | JWT (JSON Web Tokens), bcryptjs password hashing |
| **Media Storage** | Cloudinary API (via Multer memory storage) |
| **Vision AI** | Google Gemini Vision API (`gemini-1.5-flash`) / OpenAI (`gpt-4o`) |

---

## 📁 Project Structure

```text
mini_project/
├── client/                     # Vite + React Frontend
│   ├── public/
│   │   ├── images/             # Page-specific background photographs
│   │   └── favicon.svg         # Platform SVG icon
│   ├── src/
│   │   ├── components/         # Navbar, Footer, LocationPicker, ReportModal, Badges, etc.
│   │   ├── context/            # AuthContext, SocketContext
│   │   ├── pages/              # Home, ReportIssue, LiveMap, MyReports, Leaderboard, etc.
│   │   ├── services/           # Axios API modules (ai, auth, report, admin, stats, user)
│   │   ├── utils/              # Backgrounds configuration and helpers
│   │   ├── App.jsx             # Main Router & Socket Toast notifications
│   │   ├── main.jsx            # React root mount
│   │   └── index.css           # Tailwind & Glassmorphism styles
│   ├── package.json
│   ├── tailwind.config.js
│   └── vite.config.js          # Dev proxy to Express backend
│
├── server/                     # Express & MongoDB Backend
│   ├── config/                 # db.js, cloudinary.js
│   ├── controllers/            # auth, report, ai, admin, stats, user controllers
│   ├── middleware/             # authMiddleware, errorMiddleware, uploadMiddleware
│   ├── models/                 # User.js, Report.js (Mongoose schemas)
│   ├── routes/                 # API route declarations
│   ├── services/               # aiService.js (Gemini/OpenAI), cloudinaryService.js
│   ├── utils/                  # socket.js, badges.js
│   ├── downloadImages.js       # Background image downloader utility
│   ├── seed.js                 # Database seeder with realistic civic data
│   ├── server.js               # Entry point (HTTP + WebSocket)
│   ├── package.json
│   └── .env.example
│
├── .env.example                # Root environment template
├── package.json                # Monorepo scripts (dev, build, install:all, seed)
└── README.md
```

---

## 🚀 Step-by-Step Setup Guide

### 1. Prerequisites
- **Node.js**: `v18.0.0` or higher ([Download Node.js](https://nodejs.org/))
- **npm**: `v9.0.0` or higher

### 2. Install Dependencies
In the root project directory, run:
```bash
npm install
cd server && npm install
cd ../client && npm install
cd ..
```
*(Or simply run `npm run install:all`)*

---

### 3. Create MongoDB Atlas Database
1. Go to [MongoDB Atlas](https://www.mongodb.com/cloud/atlas) and log in.
2. Create a free shared cluster (M0).
3. Under **Database Access**, create a database user with read/write privileges (e.g., `nagarnova_admin`). Note down the password.
4. Under **Network Access**, add IP address `0.0.0.0/0` (Allow access from anywhere).
5. Click **Connect** &rarr; **Drivers** &rarr; **Node.js** and copy your connection string:
   ```text
   mongodb+srv://<username>:<password>@cluster0.xxxxx.mongodb.net/nagarnova?retryWrites=true&w=majority
   ```

---

### 4. Create Cloudinary Account (Image Storage)
1. Sign up for a free account at [Cloudinary](https://cloudinary.com/).
2. On your **Dashboard**, copy:
   - **Cloud Name**
   - **API Key**
   - **API Secret**

---

### 5. Configure Google Gemini Vision AI API
1. Visit [Google AI Studio](https://aistudio.google.com/app/apikey).
2. Click **Create API Key** and copy your secret key.
   *(NAGARNOVA uses `gemini-1.5-flash` by default for fast, cost-effective multimodal vision analysis).*

---

### 6. Configure Environment Variables
Create a file named `.env` inside the `server/` directory:

```bash
# Path: server/.env

PORT=5000
CLIENT_URL=http://localhost:5173

# 1. MongoDB Atlas URI
MONGODB_URI=mongodb+srv://<username>:<password>@cluster0.xxxxx.mongodb.net/nagarnova?retryWrites=true&w=majority

# 2. JWT Secret Key
JWT_SECRET=nagarnova_super_secret_jwt_key_production_2026_xyz
JWT_EXPIRES_IN=7d

# 3. Cloudinary Credentials
CLOUDINARY_CLOUD_NAME=your_cloud_name
CLOUDINARY_API_KEY=your_api_key
CLOUDINARY_API_SECRET=your_api_secret

# 4. Vision AI Configuration
AI_PROVIDER=gemini
AI_API_KEY=your_gemini_api_key
AI_MODEL=gemini-1.5-flash

# 5. Geocoding User-Agent
GEOCODING_USER_AGENT=NAGARNOVA_CivicApp/1.0
```

---

### 7. (Optional) Download Page Backgrounds Offline
To save the 8 realistic Indian urban and civic photographs directly into `client/public/images/`:
```bash
node server/downloadImages.js
```
*(Note: If offline or skipped, NAGARNOVA automatically serves the high-resolution curated remote Unsplash photographs with dark gradient overlays).*

---

### 8. Seed Initial Real Civic Data
Populate MongoDB Atlas with municipal demo accounts, realistic civic issues in Mumbai, coordinates, and points:
```bash
cd server
node seed.js
cd ..
```

**Seeded Accounts for Testing:**
- **Municipal Admin**:
  - Email: `admin@nagarnova.gov.in`
  - Password: `AdminPassword123!`
- **Citizen User**:
  - Email: `aarav@citizen.in`
  - Password: `CitizenPassword123!`

---

### 9. Start Application in Development Mode

Run both frontend and backend concurrently from the root directory:
```bash
npm run dev
```

- **Backend API**: `http://localhost:5000`
- **Frontend Client**: `http://localhost:5173`
- **API Health Check**: `http://localhost:5000/api/health`

---

## 📡 Complete REST API Reference

### Authentication (`/api/auth`)
- `POST /api/auth/register` — Register new citizen account.
- `POST /api/auth/login` — Authenticate and receive JWT token.
- `GET /api/auth/me` — Retrieve current authenticated session profile.

### Reports (`/api/reports`)
- `POST /api/reports` — Upload image to Cloudinary, save report with GPS, AI metadata, and award +10 points.
- `GET /api/reports` — Fetch all public reports with optional category/status filters.
- `GET /api/reports/:id` — Retrieve specific report with full status history.
- `GET /api/reports/user/me` — Retrieve reports filed by the logged-in citizen.
- `PUT /api/reports/:id` — Update report details (reporter only).
- `DELETE /api/reports/:id` — Withdraw/delete report (reporter only).

### Vision AI (`/api/ai`)
- `POST /api/ai/analyze` — Multipart image upload sent to Gemini Vision API; returns structured JSON (`category`, `severity`, `confidence`, `description`, `recommendedAction`).

### Statistics & Leaderboard (`/api`)
- `GET /api/statistics` — Real database counts, status distribution, category breakdown, monthly trends.
- `GET /api/leaderboard` — Community citizen ranking by contribution points with badges and reports count.

### User Profile (`/api/users`)
- `GET /api/users/profile` — Full profile with current rank, earned badges, submitted and resolved counts.
- `PUT /api/users/profile` — Update name and upload new profile photo to Cloudinary.

### Administrative Management (`/api/admin`)
- `GET /api/admin/reports` — Search and filter all reports with pagination.
- `PUT /api/admin/reports/:id/status` — Update status to Verified (+20 pts to user), In Progress, Resolved (+30 pts to user), or Rejected.
- `DELETE /api/admin/reports/:id` — Permanently remove report and Cloudinary photo.
- `GET /api/admin/users` — View all registered citizens, roles, points, and submission records.

---

## 🛡️ Security Implementations

- **Password Hashing**: Salted `bcryptjs` hashing (rounds: 12).
- **JWT Protection**: Secure signed tokens with expiration checks.
- **HTTP Headers**: `helmet` security middleware for XSS, MIME, and clickjacking defense.
- **Rate Limiting**: `express-rate-limit` prevents brute-force requests.
- **Upload Validation**: Multer whitelist filtering for images only (`jpeg`, `jpg`, `png`, `webp`) with 10MB limits.
- **Zero Exposed Secrets**: All database strings, JWT secrets, Cloudinary secrets, and AI API keys reside exclusively in `server/.env`.

---

## 📜 License
This project is licensed under the MIT License — open for community and educational enhancements.
