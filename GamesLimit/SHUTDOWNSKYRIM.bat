@echo off
Start /b "" "E:\SteamLibrary\steamapps\common\Skyrim Special Edition\SkyrimSE.exe"
Timeout /t 7200 /nobreak >nul
echo set WshShell = WScript.CreateObject("WScript.Shell") > %tmp%\tmp.vbs
echo WScript.Quit (WshShell.Popup( "Skyrim will shutdown in 5 minutes" ,30 ,"Skyrim Shutdown", 4096)) >> %tmp%\tmp.vbs
cscript /nologo %tmp%\tmp.vbs
if %errorlevel%==1 (
  echo You Clicked OK
) else (
  echo The Message timed out.
)
del %tmp%\tmp.vbs
Timeout /t 240 /nobreak >nul
echo set WshShell = WScript.CreateObject("WScript.Shell") > %tmp%\tmp.vbs
echo WScript.Quit (WshShell.Popup( "Skyrim will shutdown in 30 seconds" ,30 ,"Skyrim Shutdown", 4096)) >> %tmp%\tmp.vbs
cscript /nologo %tmp%\tmp.vbs
if %errorlevel%==1 (
  echo You Clicked OK
) else (
  echo The Message timed out.
)
del %tmp%\tmp.vbs
taskkill /IM SkyrimSE.exe /T /F
taskkill /IM SkyrimSELauncher.exe /T /F 