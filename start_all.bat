@echo off
echo ===================================================
echo Starting Discer.io Local Services...
echo ===================================================

where bun >nul 2>nul
if %ERRORLEVEL% EQU 0 (
    set BUN_CMD=bun
) else (
    set BUN_CMD=%USERPROFILE%\.bun\bin\bun.exe
)

start "Discer.io - Game Server (Port 8000)" cmd /k "cd /d %~dp0game_environment\server && %BUN_CMD% run src/index.ts"
start "Discer.io - Game Client (Port 3000)" cmd /k "cd /d %~dp0game_environment\client && npx vite --port 3000"
start "Discer.io - Backend API (Port 8001)" cmd /k "cd /d %~dp0backend && if exist .venv\Scripts\python.exe (.venv\Scripts\python.exe main.py) else (python main.py)"
start "Discer.io - Frontend (Port 3001)" cmd /k "cd /d %~dp0frontend && npm run dev"

echo.
echo All services have been launched in separate terminal windows:
echo   - Frontend:    http://localhost:3001
echo   - Game Client: http://localhost:3000
echo   - Game Server: http://localhost:8000
echo   - Backend API: http://localhost:8001/docs
echo ===================================================
