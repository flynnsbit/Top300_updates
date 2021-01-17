:menu
echo off
cls
echo.
echo Press 1 for King's Quest IV: The Perils of Rosella SCI w/ SoundBlaster
echo Press 2 for King's Quest IV: The Perils of Rosella SCI w/ MT32
echo Press 3 for King's Quest IV: The Perils of Rosella AGI (older)
echo Press 4 for King's Quest IV: The Perils of Rosella Ultimate*
echo Press 5 to Quit
echo.
echo *The hacked version combines the following assets:
echo 1. Amiga environmental sound effects
echo 2. AGI easter eggs
echo 3. Early SCI detailed backgrounds (later SCI were cut down)
echo 4. All patches from the latest SCI version (1.006.004)
echo. 
jchoice /C:12345 /N Please Choose:

if errorlevel = 5 goto quit
if errorlevel = 4 goto epi3
if errorlevel = 3 goto epi2
if errorlevel = 2 goto SCIMT32
if errorlevel = 1 goto SCISB

:SCISB
REM CONFIG -set"mididevice=default"
xcopy .\cfg\RESOURCE.SB RESOURCE.CFG
sierra
cls
goto quit

:SCIMT32
mt32-pi -m -v
xcopy .\cfg\RESOURCE.M32 RESOURCE.CFG
sierra
cls
goto quit

:epi2
echo off
cd agi
cls
echo.
echo To bypass the copy protection,
echo press alt-D, hit enter twice, then type "marble"
echo (or type "pirate" if you are feeling adventurous)
echo.
@jchoice
kq4
cd ..
cls
goto quit

:epi3
echo off
cd patch
cd new
sierra
cd ..
cd ..
cls
goto quit

:quit
exit