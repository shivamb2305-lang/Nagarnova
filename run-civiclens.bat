@echo off
title CivicLens Platform Launcher
echo ============================================================
echo   🔍  CivicLens — AI Civic Reporting & Resolution Platform
echo   "AI-Powered Civic Issue Detection, Reporting & Resolution"
echo ============================================================
echo.

:: Check Node.js
where node >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERROR] Node.js is not installed or not in PATH!
    echo Please install Node.js from https://nodejs.org/
    pause
    exit /b 1
)

:: Install root dependencies if missing
if not exist "node_modules" (
    echo [1/3] Installing root dependencies...
    call npm install
)

:: Install server dependencies if missing
if not exist "server\node_modules" (
    echo [2/3] Installing server dependencies...
    call npm --prefix server install
)

:: Install client dependencies if missing
if not exist "client\node_modules" (
    echo [3/3] Installing client dependencies...
    call npm --prefix client install
)

:: Create server/.env if missing
if not exist "server\.env" (
    if exist "server\.env.example" (
        copy "server\.env.example" "server\.env" >nul
        echo [INFO] Created server\.env from template.
    )
)

:: Create client/.env if missing
if not exist "client\.env" (
    if exist "client\.env.example" (
        copy "client\.env.example" "client\.env" >nul
        echo [INFO] Created client\.env from template.
    )
)

echo.
echo ============================================================
echo   🚀 Starting CivicLens Full-Stack Platform...
echo   Frontend: http://localhost:5173
echo   Backend:  http://localhost:5000
echo ============================================================
echo.

npm run dev
pause
