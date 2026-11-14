@echo off
title Uninstall Thai Mod - Constructor HD

echo ========================================================
echo      Constructor HD (2017) - Thai Mod Uninstaller
echo ========================================================
echo.

set "SOURCE_DIR=%~dp0"
set "TARGET_DIR=%~dp0.."

if not exist "%TARGET_DIR%\Constructor.exe" (
    set "TARGET_DIR=%~dp0"
)

if not exist "%TARGET_DIR%\Constructor.exe" (
    echo [ERROR] Constructor.exe not found!
    pause
    exit /b 1
)

echo Restoring original English game files...
echo.

:: Remove d3d9.dll
if exist "%TARGET_DIR%\d3d9.dll" (
    del /f /q "%TARGET_DIR%\d3d9.dll"
    echo [-] Removed d3d9.dll proxy.
)

:: Restore DATA.FIL
if exist "%TARGET_DIR%\Master\DATA\DATA.FIL.original" (
    copy /y "%TARGET_DIR%\Master\DATA\DATA.FIL.original" "%TARGET_DIR%\Master\DATA\DATA.FIL" >nul
    echo [+] Restored original English DATA.FIL.
) else if exist "%TARGET_DIR%\Master\DATA\DATA.FIL.bak" (
    copy /y "%TARGET_DIR%\Master\DATA\DATA.FIL.bak" "%TARGET_DIR%\Master\DATA\DATA.FIL" >nul
    echo [+] Restored original English DATA.FIL.
)

:: Restore FONTS DATA.FIL
if exist "%TARGET_DIR%\Master\FONTS\DATA.FIL.original" (
    copy /y "%TARGET_DIR%\Master\FONTS\DATA.FIL.original" "%TARGET_DIR%\Master\FONTS\DATA.FIL" >nul
    echo [+] Restored original English FONTS DATA.FIL.
) else if exist "%TARGET_DIR%\Master\FONTS\DATA.FIL.bak" (
    copy /y "%TARGET_DIR%\Master\FONTS\DATA.FIL.bak" "%TARGET_DIR%\Master\FONTS\DATA.FIL" >nul
    echo [+] Restored original English FONTS DATA.FIL.
)

echo.
echo ========================================================
echo        Thai Mod Uninstalled - Restored to English!
echo              ถอนการติดตั้งเรียบร้อยแล้ว
echo ========================================================
echo.
pause
