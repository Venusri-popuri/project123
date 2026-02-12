@echo off
echo ================================
echo Fake Review Detection - Runner
echo ================================

REM Check Python
python --version >nul 2>&1
IF ERRORLEVEL 1 (
    echo ❌ Python is not installed or not added to PATH.
    pause
    exit /b
)

echo ✅ Python found

REM Check pip
pip --version >nul 2>&1
IF ERRORLEVEL 1 (
    echo ❌ pip not found.
    pause
    exit /b
)

echo ✅ pip found

REM Check requirements.txt
IF NOT EXIST requirements.txt (
    echo ❌ requirements.txt not found!
    pause
    exit /b
)

echo 🔍 Checking installed packages...

REM Try installing requirements (pip will skip already installed ones)
pip install -r requirements.txt

IF ERRORLEVEL 1 (
    echo ❌ Error while installing requirements.
    pause
    exit /b
)

echo ✅ All requirements are installed

REM Run Django server
IF NOT EXIST manage.py (
    echo ❌ manage.py not found. Are you in the project folder?
    pause
    exit /b
)

echo 🚀 Starting Django Server...
python manage.py runserver

pause
