:menu
@echo off
cls
echo.
echo Press 1 for Legend of Kyrandia Book 1 w/ SoundBlaster
echo Press 2 for Legend of Kyrandia Book 1 w/ MT-32
echo Press 3 to Quit
echo.
jchoice /C:123 /N Please Choose:

if errorlevel = 3 goto quit
if errorlevel = 2 goto MT32
if errorlevel = 1 goto SB16

:SB16
xcopy .\sb16\*.* .\
cls
@main
goto quit

:MT32
xcopy .\mt32\*.* .\
cls
@main
goto quit

:quit
exit
