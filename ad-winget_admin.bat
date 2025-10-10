@echo off
:: Forcing user to get administrator access

:: Self-elevate: check for admin by testing net session
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting administrative privileges...
    powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
    exit /b
)
@echo off
color 3
echo/
chcp 65001 > nul
echo/
CHOICE /C YN /M " DO YOU READY TO UPDATE ALL APPS RUNNING IN YOUR SYSTEM "
IF ERRORLEVEL 2 GOTO NO
IF ERRORLEVEL 1 GOTO YES
  
:YES
ECHO Executing Script ...
echo/
echo                                          --------------⏪ ALL INSTALLED SOFTWARE UPDATER ⏩--------------

echo/
cd %USERPROFILE%\AppData\Local\Microsoft\WindowsApps\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe/
winget update --accept-source-agreements
color b
echo/
echo/
echo			                      THANK YOU FOR YOUR PATIENCE 😌. THE UPGRADE IS IN PROGRESS 🏃‍♀️‍➡️
echo/    
echo ...  ...  ...  ...  ...  ...  ...  ...  ...  ...  ...  ...  ...  ...  ...  ...  ...  ...  ...  ...  ...  ...  ...  ...  ...  ...  ...  ...  ...  ...  ...  ...  ..     
echo ...  ...  ...  ...  ...  ...  ...  ...  ...  ...  ...  ...  ...  ...  ...  ...  ...  ...  ...  ...  ...  ...  ...  ...  ...  ...  ...  ...  ...  ...  ...  ...  ..
echo ...  ...  ...  ...  ...  ...  ...  ...  ...  ...  ...  ...  ...  ...  ...  ...  ...  ...  ...  ...  ...  ...  ...  ...  ...  ...  ...  ...  ...  ...  ...  ...  ..
echo/
echo/
color 4
echo                                 YOU CAN STOP THIS PROCESS BY PRESSING "Ctrl+C" (Not recommended ❌ , can be harmful ☠️) 
echo/
cd %USERPROFILE%\AppData\Local\Microsoft\WindowsApps\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe/
winget upgrade --all --silent --include-unknown --disable-interactivity --accept-source-agreements --accept-package-agreements
echo/
echo        ALL SOFTWARE HAS BEEN UPDATED SUCCESSFULLY.
GOTO END
color 4  
:NO
color e
echo/
ECHO   						    DON'T FORGET TO UPDATE ME LATER.  GOODBYE 👋
echo/
GOTO END  
:END
pause
