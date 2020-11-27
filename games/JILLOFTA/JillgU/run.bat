:menu
echo off
cls
echo.
echo Press 1 for Jill of the Jungle: Jill Goes Underground w/ SB16
echo Press 2 for Jill of the Jungle: Jill Goes Underground w/ FM Synth & Patch*
echo Press 3 to Quit
echo.
echo This NewRisingSun patch fixes several issues found in the official
echo release while also restoring jokes that were removed after v1.0
echo.
choice /C:123 /N Please Choose:

if errorlevel = 3 goto quit
if errorlevel = 2 goto epi2
if errorlevel = 1 goto epi1

:epi1
copy .\old\jjfile2.exe
jjfile2.exe
cls
goto quit

:epi2
copy .\new\jjfile2.exe
jjfile2.exe
cls
goto quit

:quit
exit