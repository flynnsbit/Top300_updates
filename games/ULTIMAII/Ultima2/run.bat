:menu
echo off
cls
echo.
echo Press 1 for Ultima II: Revenge of the Enchantress (Original)
echo Press 2 for Ultima II: Revenge of the Enchantress (Upgrade)
echo Press 3 to Quit
echo.
jchoice /C:123 /N Please Choose:

if errorlevel = 3 goto quit
if errorlevel = 2 goto upgrade
if errorlevel = 1 goto original

:original
REM CONFIG -set"core=simple"
REM CONFIG -set"cputype=386_slow"
REM CONFIG -set"cycles=500"
cls
ultimaII.exe
goto quit
cls

:upgrade
REM CONFIG -set"core=auto"
REM CONFIG -set"cputype=auto"
REM CONFIG -set"cycles=10000"
cd .\upgrade
call run.bat
goto quit
cls

:quit
exit