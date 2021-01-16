:menu
@echo off
cls
echo.
echo Press 1 for Indiana Jones and the Fate of Atlantis w/ SoundBlaster
echo Press 2 for Indiana Jones and the Fate of Atlantis w/ MT-32
echo Press 3 to Quit
echo.
jchoice /C:123 /N Please Choose:

if errorlevel = 3 goto quit
if errorlevel = 2 goto MT32
if errorlevel = 1 goto SB16

:SB16
REM CONFIG -set"mididevice=default"
xcopy .\sb16\*.* .\
d:
cd atlantis
cls
@atlantis
goto quit

:MT32
mt32-pi -m -v
xcopy .\mt32\*.* .\
d:
cd atlantis
cls
@atlantis r
goto quit

:quit
exit