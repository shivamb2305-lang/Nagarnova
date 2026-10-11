@echo off
title NAGARNOVA Civic Platform Launcher
echo ============================================================
echo   🏛️  NAGARNOVA - Civic Issue Reporting Platform
echo   "See the Problem. Report It. Make the City Better."
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

echo.
echo ============================================================
echo   🚀 Starting NAGARNOVA Full-Stack Platform...
echo   Frontend: http://localhost:5173
echo   Backend:  http://localhost:5000
echo ============================================================
echo.

npm run dev
pause
