:menu
echo off
cls
echo.
echo Press 1 for Lemmings 2: The Tribes w/ MT-32 & SoundBlaster
echo Press 2 for Lemmings 2: The Tribes w/ MT-32
echo Press 3 for Lemmings 2: The Tribes w/ SoundBlaster
echo Press 4 for Lemmings 2: The Tribes Demo
echo Press 5 to Quit
echo.
echo The demo contains a few exclusive levels
echo.
jchoice /C:12345 /N Please Choose:

if errorlevel = 5 goto quit
if errorlevel = 4 goto demo
if errorlevel = 3 goto SB16
if errorlevel = 2 goto MT32
if errorlevel = 1 goto MT32SB16

:SB16
xcopy .\sb16\*.* .\
cls
echo for working sound, disable
echo L1 and L2 cache before continuing
echo loads very slowly.
echo once game loads re-enable L2 cache to speed it up.
echo don't re-enable L1
jchoice
cls
L2
goto quit

:MT32
xcopy .\mt32\*.* .\
cls
sysctl sys L1-
L2
sysctl menu
goto quit

:MT32SB16
xcopy .\mt32sb16\*.* .\
cls
echo for working SFX, disable
echo L1 and L2 cache before continuing
echo loads very slowly.
echo once game loads re-enable L2 cache to speed it up.
echo don't re-enable L1
jchoice
cls
L2
goto quit

:demo
cd l2
cls
L2
goto quit

:quit
exit
