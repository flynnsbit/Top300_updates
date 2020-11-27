:menu
echo off
cls
echo.
echo Press 1 for Wing Commander and the Secret Missions w/ SoundBlaster
echo Press 2 for Secret Missions 2: Crusade w/ SoundBlaster
echo Press 3 for Wing Commander and the Secret Missions w/ MT-32
echo Press 4 for Secret Missions 2: Crusade w/ MT-32
echo Press 5 to Transfer Saves from WC to Secret Missions
echo Press 6 to Quit
echo.
choice /C:123456 /N Please Choose:

if errorlevel = 6 goto quit
if errorlevel = 5 goto TRAN
if errorlevel = 4 goto smMT32
if errorlevel = 3 goto wcMT32
if errorlevel = 2 goto smSB16
if errorlevel = 1 goto wcSB16

:wcSB16
CONFIG -set "mididevice=default"
cd wing
copy .\sb16\*.* .\
cls
wc
goto quit

:smSB16
CONFIG -set "mididevice=default"
cd wing
copy .\sb16\*.* .\
cls
sm2
goto quit

:wcMT32
CONFIG -set "mididevice=mt32"
cd wing
copy .\mt32\*.* .\
cls
wc
goto quit

:smMT32
CONFIG -set "mididevice=mt32"
cd wing
copy .\mt32\*.* .\
cls
sm2
goto quit

:TRAN
cls
echo.
echo Press 1 transfer your Wing Commander save to Secret Missions 1
echo Press 2 transfer your Wing Commander or SM1 save to Secret Missions 2
echo Press 3 to return to the Launch Menu
echo.
choice /C:123 /N Please Choose:

if errorlevel = 3 goto menu
if errorlevel = 2 goto WC12SM2
if errorlevel = 1 goto WC12SM1

:WC12SM1
cd wing
cls
echo.
echo Note: To transfer a save from Wing Commander 1, your save *must* be
echo in the final system of the base game (Venice system). The Transfer program
echo does allow you to convert your save to any mission, so you can always convert
echo to the final mission before transferring if needed.
echo.
pause
cls
TRANSFER
cls
goto menu

:WC12SM2
cd wing
cls
echo.
echo Note: To transfer a save from Wing Commander 1, your save *must* be
echo in the final system of the base game (Venice system). If transferring from
echo Secret Missions 1, you must be in the Vigrid system.
echo.
echo The Transfer program does allow you to convert your save to any mission,
echo so you can always convert to the final mission before transferring if needed.
echo.
pause
cls
TRANS2
cls
goto menu

:quit
exit