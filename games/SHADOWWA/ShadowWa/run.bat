:menu
echo off
cls
echo.
echo Press 1 for Shadow Warrior (CD Audio)
echo Press 2 for Shadow Warrior Shareware w/ SB16 Midi
echo Press 3 for Shadow Warrior Shareware w/ SC-55 Midi
echo Press 4 for Shadow Warrior 3DFX
echo Press 5 to play Network Multiplayer
echo Press 6 to Quit
echo.
jchoice /C:123456 /N Please Choose:

if errorlevel = 6 goto quit
if errorlevel = 5 goto network
if errorlevel = 4 goto 3dfx
if errorlevel = 3 goto swsc
if errorlevel = 2 goto swsb
if errorlevel = 1 goto bio1

:bio1
cls
cd sw
xcopy .\network\sw.cfg sw.cfg
sw
cd ..
goto menu

:swsb
REM CONFIG -set"mididevice=default"
cd sw_shar
xcopy .\sb16\*.* .\
cls
sw
cd ..
goto menu

:swsc
mt32-pi -g -v
cd sw_shar
xcopy .\sc55\*.* .\
cls
sw
cd ..
goto menu

:3dfx
cls
cd sw
xcopy .\network\sw.cfg sw.cfg
SW3DFX
cd ..
goto menu

:network
cd ..
copy ExtIP*.* .\SW\
cd  SW
REM CONFIG -set"mididevice=default"
xcopy .\network\net.cfg sw.cfg
cls
network

:quit
exit