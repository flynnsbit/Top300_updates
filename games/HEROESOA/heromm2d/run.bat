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
imgmount d ".\eXoDOS\heromm2d\CD\Heroes of Might and Magic 2.cue" -t cdrom
CONFIG -set "mididevice=default"
cd HERO2
copy .\sb16\*.* .\
cd SOUND
copy .\sb16\*.* .\
cd ..
cls
HEROES2
goto quit

:HOMMMT32
imgmount d ".\eXoDOS\heromm2d\CD\Heroes of Might and Magic 2.cue" -t cdrom
CONFIG -set "mididevice=mt32"
cd HERO2
copy .\mt32\*.* .\
cd SOUND
copy .\mt32\*.* .\
cd ..
cls
HEROES2
goto quit

:HOMMCDA
imgmount d ".\eXoDOS\heromm2d\CD\Heroes of Might and Magic 2.cue" -t cdrom
CONFIG -set "mididevice=fluidsynth"
cd HERO2
copy .\CDA\*.* .\
cd SOUND
copy .\cda\*.* .\
cd ..
cls
HEROES2
goto quit

:HOMMSC55
imgmount d ".\eXoDOS\heromm2d\CD\Heroes of Might and Magic 2.cue" -t cdrom
CONFIG -set "mididevice=fluidsynth"
cd HERO2
copy .\sc55\*.* .\
cd SOUND
copy .\sc55\*.* .\
cd ..
cls
HEROES2
goto quit

:POL
echo off
cls
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
imgmount d ".\eXoDOS\heromm2d\CD\Heroes of Might and Magic 2 - The Price of Loyalty.cue" -t cdrom
CONFIG -set "mididevice=default"
cd HEROES2
copy .\sb16\*.* .\
cd SOUND
copy .\sb16\*.* .\
cd ..
cls
HEROES2
goto quit

:POLMT32
imgmount d ".\eXoDOS\heromm2d\CD\Heroes of Might and Magic 2 - The Price of Loyalty.cue" -t cdrom
CONFIG -set "mididevice=mt32"
cd HEROES2
copy .\mt32\*.* .\
cd SOUND
copy .\mt32\*.* .\
cd ..
cls
HEROES2
goto quit

:POLCDA
imgmount d ".\eXoDOS\heromm2d\CD\Heroes of Might and Magic 2 - The Price of Loyalty.cue" -t cdrom
CONFIG -set "mididevice=fluidsynth"
cd HEROES2
copy .\CDA\*.* .\
cd SOUND
copy .\cda\*.* .\
cd ..
cls
HEROES2
goto quit

:POLSC55
imgmount d ".\eXoDOS\heromm2d\CD\Heroes of Might and Magic 2 - The Price of Loyalty.cue" -t cdrom
CONFIG -set "mididevice=fluidsynth"
cd HEROES2
copy .\sc55\*.* .\
cd SOUND
copy .\sc55\*.* .\
cd ..
cls
HEROES2
goto quit

:network
imgmount d ".\eXoDOS\heromm2d\CD\Heroes of Might and Magic 2 - The Price of Loyalty.cue" -t cdrom
cd HEROES2
copy .\CDA\*.* .\
cd SOUND
copy .\cda\*.* .\
cd ..
cd ..
cls
call network
goto quit

:quit
exit