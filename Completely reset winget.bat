@echo off
:: Self-elevate: check for admin by testing net session
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting administrative privileges...
    powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
    exit /b
)

:: Elevated: run the PowerShell command
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage -Name 'Microsoft.DesktopAppInstaller' | Reset-AppxPackage"

echo Done.
pause


