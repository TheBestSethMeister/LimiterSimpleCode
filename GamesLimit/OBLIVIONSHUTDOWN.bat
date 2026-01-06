@echo off
Start /b "" "E:\SteamLibrary\steamapps\common\Oblivion\OblivionLauncher.exe"
Timeout /t 7200 /nobreak >nul
echo set WshShell = WScript.CreateObject("WScript.Shell") > %tmp%\tmp.vbs
echo WScript.Quit (WshShell.Popup( "Oblivion will shutdown in 5 minutes" ,10 ,"Oblivion Shutdown", 4096)) >> %tmp%\tmp.vbs
cscript /nologo %tmp%\tmp.vbs
if %errorlevel%==1 (
  echo You Clicked OK
) else (
  echo The Message timed out.
)
del %tmp%\tmp.vbs
Timeout /t 260 /nobreak >nul
echo set WshShell = WScript.CreateObject("WScript.Shell") > %tmp%\tmp.vbs
echo WScript.Quit (WshShell.Popup( "Oblivion will shutdown in 30 seconds" ,30 ,"Oblivion Shutdown", 4096)) >> %tmp%\tmp.vbs
cscript /nologo %tmp%\tmp.vbs
if %errorlevel%==1 (
  echo You Clicked OK
) else (
  echo The Message timed out.
)
del %tmp%\tmp.vbs
taskkill /IM OblivionLauncher.exe /T /F
taskkill /IM Oblivion.exe /T /F 