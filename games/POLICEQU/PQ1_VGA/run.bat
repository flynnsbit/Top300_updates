:menu
@echo off
cls
echo.
echo Press 1 for Police Quest 1: In Pursuit of the Death Angel VGA w/ SoundBlaster
echo Press 2 for Police Quest 1: In Pursuit of the Death Angel VGA w/ MT32
echo Press 3 for Police Quest 1: In Pursuit of the Death Angel VGA w/ Sound Canvas
echo Press 4 to Quit
echo.
jchoice /C:1234 /N Please Choose:

if errorlevel = 4 goto quit
if errorlevel = 3 goto SC55
if errorlevel = 2 goto MT32
if errorlevel = 1 goto SB16

:SB16
CONFIG -set "mididevice=default"
del RESOURCE.PQ1
xcopy .\sb16\*.*
cls
call PQ1VGA
goto quit
cls

:MT32
mt32-pi -m -v
del RESOURCE.PQ1
xcopy .\mt32\*.*
cls
call PQ1VGA
goto quit
cls

:SC55
mt32-pi -g -v
del RESOURCE.PQ1
xcopy .\sc55\*.*
cls
call PQ1VGA
goto quit
cls

:quit
exit