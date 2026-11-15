@echo off
title Install Thai Mod (Mini Patcher) - Constructor HD

echo ========================================================
echo   Constructor HD - Thai Mod Installer (Mini Patcher)
echo ========================================================
echo.

set "SOURCE_DIR=%~dp0"
set "TARGET_DIR=%~dp0.."

if not exist "%TARGET_DIR%\Constructor.exe" (
    set "TARGET_DIR=%~dp0"
)

if not exist "%TARGET_DIR%\Constructor.exe" (
    echo [ERROR] Constructor.exe not found!
    echo Please make sure the 'Constructor_Thai_Mod_Mini' folder is placed
    echo inside the Constructor game directory:
    echo SteamLibrary\steamapps\common\Constructor\
    echo.
    pause
    exit /b 1
)

echo Target game directory:
echo %TARGET_DIR%
echo.

:: Backup original files
if not exist "%TARGET_DIR%\Master\DATA\DATA.FIL.original" (
    if exist "%TARGET_DIR%\Master\DATA\DATA.FIL.bak" (
        echo [1/3] Found original backup, creating DATA.FIL.original...
        copy /y "%TARGET_DIR%\Master\DATA\DATA.FIL.bak" "%TARGET_DIR%\Master\DATA\DATA.FIL.original" >nul
    ) else if exist "%TARGET_DIR%\Master\DATA\DATA.FIL" (
        echo [1/3] Backing up original DATA.FIL...
        copy /y "%TARGET_DIR%\Master\DATA\DATA.FIL" "%TARGET_DIR%\Master\DATA\DATA.FIL.original" >nul
    )
)

if not exist "%TARGET_DIR%\Master\FONTS\DATA.FIL.original" (
    if exist "%TARGET_DIR%\Master\FONTS\DATA.FIL.bak" (
        echo [2/3] Found original backup, creating FONTS DATA.FIL.original...
        copy /y "%TARGET_DIR%\Master\FONTS\DATA.FIL.bak" "%TARGET_DIR%\Master\FONTS\DATA.FIL.original" >nul
    ) else if exist "%TARGET_DIR%\Master\FONTS\DATA.FIL" (
        echo [2/3] Backing up original FONTS DATA.FIL...
        copy /y "%TARGET_DIR%\Master\FONTS\DATA.FIL" "%TARGET_DIR%\Master\FONTS\DATA.FIL.original" >nul
    )
)

:: Copy D3D9 proxy and fonts
echo [3/3] Installing Mod files...
echo   - Copying d3d9.dll (DirectX Thai Shaping Proxy)...
copy /y "%SOURCE_DIR%d3d9.dll" "%TARGET_DIR%\d3d9.dll" >nul

echo   - Copying Thai Fonts (Kanit Bold)...
copy /y "%SOURCE_DIR%Master\FONTS\DATA.FIL" "%TARGET_DIR%\Master\FONTS\DATA.FIL" >nul

echo   - Patching Thai text into DATA.FIL...
"%SOURCE_DIR%patcher.exe" "%TARGET_DIR%\Master\DATA\DATA.FIL"

if errorlevel 1 (
    echo.
    echo [ERROR] Patching DATA.FIL failed!
    pause
    exit /b 1
)

echo.
echo ========================================================
echo           Thai Mod Installed Successfully!
echo           ติดตั้ง Mod ภาษาไทยเสร็จสมบูรณ์!
echo ========================================================
echo You can now launch the game via Steam.
echo.
pause
