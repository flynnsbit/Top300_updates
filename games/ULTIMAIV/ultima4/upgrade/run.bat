:menu
@echo off
cls
echo.
echo Press 1 for EGA
echo Press 2 for VGA
echo Press 3 for EGA with Runic font
echo Press 4 for VGA Alternate with Runic font
echo Press 5 to Quit
echo.
echo Rune fonts replace latin characters with runes.
echo.
jchoice /C:12345 /N Please Choose:

if errorlevel = 5 goto quit
if errorlevel = 4 goto VGAR
if errorlevel = 3 goto EGAR
if errorlevel = 2 goto VGA
if errorlevel = 1 goto EGA

:EGA
@echo off
del charset.ega
del charset.vga
del compassn.ega
del courage.ega
del honesty.ega
del honor.ega
del humility.ega
del justice.ega
del key7.ega
del love.ega
del rune_0.ega
del rune_1.ega
del rune_2.ega
del rune_3.ega
del rune_4.ega
del rune_5.ega
del rune_6.ega
del rune_7.ega
del rune_8.ega
del sacrific.ega
del shapes.vga
del spirit.ega
del start.ega
del stoncrcl.ega
del truth.ega
del valor.ega
xcopy .\EGA\*.*
cls
goto music
cls

:VGA
@echo off
del charset.ega
del charset.vga
del compassn.ega
del courage.ega
del honesty.ega
del honor.ega
del humility.ega
del justice.ega
del key7.ega
del love.ega
del rune_0.ega
del rune_1.ega
del rune_2.ega
del rune_3.ega
del rune_4.ega
del rune_5.ega
del rune_6.ega
del rune_7.ega
del rune_8.ega
del sacrific.ega
del shapes.vga
del spirit.ega
del start.ega
del stoncrcl.ega
del truth.ega
del valor.ega
xcopy .\VGA\*.*
cls
goto music
cls

:EGAR
@echo off
del charset.ega
del charset.vga
del compassn.ega
del courage.ega
del honesty.ega
del honor.ega
del humility.ega
del justice.ega
del key7.ega
del love.ega
del rune_0.ega
del rune_1.ega
del rune_2.ega
del rune_3.ega
del rune_4.ega
del rune_5.ega
del rune_6.ega
del rune_7.ega
del rune_8.ega
del sacrific.ega
del shapes.vga
del spirit.ega
del start.ega
del stoncrcl.ega
del truth.ega
del valor.ega
xcopy .\EGA\*.*
del charset.ega
del charset.vga
xcopy .\runic\*.*
cls
goto music
cls

:VGAR
@echo off
del charset.ega
del charset.vga
del compassn.ega
del courage.ega
del honesty.ega
del honor.ega
del humility.ega
del justice.ega
del key7.ega
del love.ega
del rune_0.ega
del rune_1.ega
del rune_2.ega
del rune_3.ega
del rune_4.ega
del rune_5.ega
del rune_6.ega
del rune_7.ega
del rune_8.ega
del sacrific.ega
del shapes.vga
del spirit.ega
del start.ega
del stoncrcl.ega
del truth.ega
del valor.ega
xcopy .\VGA\*.*
del charset.ega
del charset.vga
xcopy .\runic\*.*
cls
goto music
cls

:music
@echo off
cls
echo.
echo Press 1 for Original Music
echo Press 2 for Music Upgrade Patch
echo Press 3 for Music Upgrade Patch #2
echo Press 4 to Quit
echo.
echo Original music is the original midi music the game shipped with.
echo.
echo The first patch adds midi music from the Apple and C64 versions.
echo.
echo The second is an alternative arrangement that uses "traditional
echo instruments", according to the creator.
echo.
jchoice /C:1234 /N Please Choose:

if errorlevel = 4 goto quit
if errorlevel = 3 goto mup2
if errorlevel = 2 goto mup
if errorlevel = 1 goto musorig

:musorig
del LARGE.XMI
xcopy .\musorig\*.*
cls
goto output
cls

:mup
del LARGE.XMI
xcopy .\mup\*.*
cls
goto output
cls

:mup2
del LARGE.XMI
xcopy .\mup2\*.*
cls
goto output
cls

:output
@echo off
cls
echo.
echo Press 1 for SoundBlaster
echo Press 2 for MT32
echo Press 3 for Sound Canvas
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
xcopy .\sb16\*.*
cls
@ULTIMA.COM
goto quit
cls

:MT32
mt32-pi -m -v
del MIDPAK.AD
del MIDPAK.ADV
del MIDPAK.COM
xcopy .\mt32\*.*
cls
@ULTIMA.COM
goto quit
cls

:SC55
mt32-pi -g -v
del MIDPAK.AD
del MIDPAK.ADV
del MIDPAK.COM
xcopy .\sc55\*.*
cls
@ULTIMA.COM
goto quit
cls

:quit
exit