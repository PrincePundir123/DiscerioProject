@echo off
echo ===================================================
echo Starting Discer.io Local Services...
echo ===================================================

start "Discer.io - Game Server (Port 8000)" cmd /k "cd /d %~dp0game_environment\server && %USERPROFILE%\.bun\bin\bun.exe run src/index.ts"
start "Discer.io - Game Client (Port 3000)" cmd /k "cd /d %~dp0game_environment\client && npx vite --port 3000"
start "Discer.io - Backend API (Port 8001)" cmd /k "cd /d %~dp0backend && .venv\Scripts\python.exe main.py"
start "Discer.io - Frontend (Port 3001)" cmd /k "cd /d %~dp0frontend && npm run dev"

echo.
echo All services have been launched in separate terminal windows:
echo   - Frontend:    http://localhost:3001
echo   - Game Client: http://localhost:3000
echo   - Game Server: http://localhost:8000
echo   - Backend API: http://localhost:8001/docs
echo ===================================================

