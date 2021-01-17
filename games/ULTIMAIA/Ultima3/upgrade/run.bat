:menu
@echo off
cls
echo.
echo Press 1 for Ultima III: Exodus
echo Press 2 for Sosaria Mod (Lands of Lord British)
echo Press 3 to Quit
echo.
jchoice /C:123 /N Please Choose:

if errorlevel = 3 goto quit
if errorlevel = 2 goto modvideo
if errorlevel = 1 goto video

:video
@echo off
cls
echo.
echo Press 1 for CGA (4-color)
echo Press 2 for CGA Composite (16-color)
echo Press 3 for EGA (16-color)
echo Press 4 for EGA Alternate (16-color)
echo Press 5 for VGA (256-color)
echo Press 6 to Quit
echo.
jchoice /C:123456 /N Please Choose:

if errorlevel = 6 goto quit
if errorlevel = 5 goto VGA
if errorlevel = 4 goto EGA-ALT
if errorlevel = 3 goto EGA
if errorlevel = 2 goto CGA16
if errorlevel = 1 goto CGA4

:CGA4
del U3.CFG
xcopy .\CGA4\*.*
goto sound
cls

:CGA16
del U3.CFG
xcopy .\CGA16\*.*
goto sound
cls

:EGA
del U3.CFG
del SHAPES.EGA
xcopy .\EGA\*.*
goto sound
cls

:EGA-ALT
del U3.CFG
del SHAPES.EGA
xcopy .\EGA-ALT\*.*
goto sound
cls

:VGA
del U3.CFG
xcopy .\VGA\*.*
goto sound
cls

:modvideo
@echo off
cls
echo.
echo Press 1 for CGA (4-color)
echo Press 2 for CGA Composite (16-color)
echo Press 3 for EGA (16-color)
echo Press 4 for EGA Alternate (16-color)
echo Press 5 for VGA (256-color)
echo Press 6 to Quit
echo.
jchoice /C:123456 /N Please Choose:

if errorlevel = 6 goto quit
if errorlevel = 5 goto VGAM
if errorlevel = 4 goto EGA-ALTM
if errorlevel = 3 goto EGAM
if errorlevel = 2 goto CGA16M
if errorlevel = 1 goto CGA4M

:CGA4M
del U3.CFG
xcopy .\CGA4M\*.*
goto sound
cls

:CGA16M
del U3.CFG
xcopy .\CGA16M\*.*
goto sound
cls

:EGAM
del U3.CFG
del SHAPES.EGA
xcopy .\EGAM\*.*
goto sound
cls

:EGA-ALTM
del U3.CFG
del SHAPES.EGA
xcopy .\EGA-ALTM\*.*
goto sound
cls

:VGAM
del U3.CFG
xcopy .\VGAM\*.*
goto sound
cls

:sound
@echo off
cls
echo.
echo Press 1 for w/ SoundBlaster
echo Press 2 for w/ MT32
echo Press 3 for w/ Sound Canvas
echo Press 4 to Quit
echo.
jchoice /C:1234 /N Please Choose:

if errorlevel = 4 goto quit
if errorlevel = 3 goto SC55
if errorlevel = 2 goto MT32
if errorlevel = 1 goto SB16

:SB16
REM CONFIG -set"mididevice=default"
del MIDPAK.AD
del MIDPAK.ADV
del MIDPAK.COM
del SC32MPU.ADD
xcopy .\sb16\*.*
cls
ultima3.com
cls
goto quit

:MT32
mt32-pi -m -v
del MIDPAK.AD
del MIDPAK.ADV
del MIDPAK.COM
del SC32MPU.ADD
xcopy .\mt32\*.*
cls
ultima3.com
cls
goto quit

:SC55
mt32-pi -g -v
del MIDPAK.AD
del MIDPAK.ADV
del MIDPAK.COM
del SC32MPU.ADD
xcopy .\sc55\*.*
cls
ultima3.com
cls
goto quit

:quit
exit