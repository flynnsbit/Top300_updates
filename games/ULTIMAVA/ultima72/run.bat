:menu
@echo off
cls
echo.
echo Press 1 for Ultima VII, Part 2: Serpent Isle + The Silver Seed w/ SoundBlaster
echo Press 2 for Ultima VII, Part 2: Serpent Isle + The Silver Seed w/ MT32
echo Press 3 for Ultima VII, Part 2: Serpent Isle + The Silver Seed w/ Sound Canvas
echo Press 4 to Quit
echo.
jchoice /C:1234 /N Please Choose:

if errorlevel = 4 goto quit
if errorlevel = 3 goto SC55
if errorlevel = 2 goto MT32
if errorlevel = 1 goto SB16

:SB16
CONFIG -set "mididevice=default"
del SERPENT.CFG
xcopy .\sb16\*.*
cd STATIC
del MAINMENU.TIM
del MAINSHP.FLX
del MT32MUS.DAT
del MT32SFX.DAT
del R_SEND.XMI
del R_SINTRO.XMI
del R_VALOR.XMI
xcopy .\orig\*.*
cd ..
@serpent.com
goto quit
cls

:MT32
CONFIG -set "mididevice=mt32"
del SERPENT.CFG
xcopy .\mt32\*.*
cd STATIC
del MAINMENU.TIM
del MAINSHP.FLX
del MT32MUS.DAT
del MT32SFX.DAT
del R_SEND.XMI
del R_SINTRO.XMI
del R_VALOR.XMI
xcopy .\orig\*.*
cd ..
@serpent.com
goto quit
cls

:SC55
CONFIG -set "mididevice=fluidsynth"
del SERPENT.CFG
xcopy .\sc55\*.*
cd STATIC
del MAINMENU.TIM
del MAINSHP.FLX
del MT32MUS.DAT
del MT32SFX.DAT
del R_SEND.XMI
del R_SINTRO.XMI
del R_VALOR.XMI
xcopy .\patch\*.*
cd ..
@sifx.com
goto quit
cls

:quit
exit