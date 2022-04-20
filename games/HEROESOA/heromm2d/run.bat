:menu
echo off
cls
echo.
echo Press 1 for Heroes of Might and Magic II
echo Press 2 for The Price of Loyalty (Expansion Pack)
echo Press 3 to play Network Multiplayer
echo Press 4 to Quit
echo.
jchoice /C:1234 /N Please Choose:

if errorlevel = 4 goto quit
if errorlevel = 3 goto network
if errorlevel = 2 goto POL
if errorlevel = 1 goto HOMM2

:HOMM2
echo off
CALL imgtry ide10 D "/cd/heromm2d/heroeso.chd" "/cd/heromm2d/heroeso.cue"
cls
echo.
echo Press 1 for Heroes of Might and Magic II w/ SoundBlaster
echo Press 2 for Heroes of Might and Magic II w/ MT-32
echo Press 3 for Heroes of Might and Magic II w/ Sound Canvas
echo Press 4 for Heroes of Might and Magic II w/ CD Audio
echo Press 5 to Quit
echo.
jchoice /C:12345 /N Please Choose:

if errorlevel = 5 goto quit
if errorlevel = 4 goto HOMMCDA
if errorlevel = 3 goto HOMMSC55
if errorlevel = 2 goto HOMMMT32
if errorlevel = 1 goto HOMMSB16

:HOMMSB16
REM CONFIG -set"mididevice=default"
cd HERO2
xcopy .\sb16\*.* .\
cd SOUND
xcopy .\sb16\*.* .\
cd ..
cls
HEROES2
goto quit

:HOMMMT32
mt32-pi -m -v
cd HERO2
xcopy .\mt32\*.* .\
cd SOUND
xcopy .\mt32\*.* .\
cd ..
cls
HEROES2
goto quit

:HOMMCDA
mt32-pi -g -v
cd HERO2
xcopy .\CDA\*.* .\
cd SOUND
xcopy .\cda\*.* .\
cd ..
cls
HEROES2
goto quit

:HOMMSC55
mt32-pi -g -v
cd HERO2
xcopy .\sc55\*.* .\
cd SOUND
xcopy .\sc55\*.* .\
cd ..
cls
HEROES2
goto quit

:POL
echo off
cls
CALL imgtry ide10 D "/cd/heromm2d/heroes1.chd" "/cd/heromm2d/heroes1.cue"
echo.
echo Press 1 for The Price of Loyalty w/ SoundBlaster
echo Press 2 for The Price of Loyalty w/ MT-32
echo Press 3 for The Price of Loyalty w/ Sound Canvas
echo Press 4 for The Price of Loyalty w/ CD Audio
echo Press 5 to Quit
echo.
jchoice /C:12345 /N Please Choose:

if errorlevel = 5 goto quit
if errorlevel = 4 goto POLCDA
if errorlevel = 3 goto POLSC55
if errorlevel = 2 goto POLMT32
if errorlevel = 1 goto POLSB16

:POLSB16
REM CONFIG -set"mididevice=default"
cd HEROES2
xcopy .\sb16\*.* .\
cd SOUND
xcopy .\sb16\*.* .\
cd ..
cls
HEROES2
goto quit

:POLMT32
mt32-pi -m -v
cd HEROES2
xcopy .\mt32\*.* .\
cd SOUND
xcopy .\mt32\*.* .\
cd ..
cls
HEROES2
goto quit

:POLCDA
mt32-pi -g -v
cd HEROES2
xcopy .\CDA\*.* .\
cd SOUND
xcopy .\cda\*.* .\
cd ..
cls
HEROES2
goto quit

:POLSC55
mt32-pi -g -v
cd HEROES2
xcopy .\sc55\*.* .\
cd SOUND
xcopy .\sc55\*.* .\
cd ..
cls
HEROES2
goto quit

:network
cd HEROES2
xcopy .\CDA\*.* .\
cd SOUND
xcopy .\cda\*.* .\
cd ..
cd ..
cls
call network
goto quit

:quit
exit
