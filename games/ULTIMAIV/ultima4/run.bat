:menu
echo off
cls
echo.
echo Press 1 for Ultima IV: Quest for the Avatar (Original)
echo Press 2 for Ultima IV: Quest for the Avatar (Upgrade)
echo Press 3 to Quit
echo.
echo The Upgrade version upgrades the game to VGA, improves the GUI,
echo adds midi music (from original Apple and Commodore version), 
echo corrects bugs, and adds command keys to reload and exit.
echo.
echo Note: If you choose the Upgraded version, do not use a cursor key
echo during the title, intro, or menu. If you do, the game locks out
echo all keyboard input and you have to kill dosbox to get out.
echo.
jchoice /C:123 /N Please Choose:

if errorlevel = 3 goto quit
if errorlevel = 2 goto upgrade
if errorlevel = 1 goto original

:original
goto video
cls

:upgrade
cd .\upgrade
cls
call run.bat
goto quit
cls

:video
echo off
cls
echo.
echo Press 1 for EGA
echo Press 2 for EGA Alternate
echo Press 3 for EGA with Runic font
echo Press 4 for EGA Alternate with Runic font
echo Press 5 to Return to the Previous Menu
echo.
echo Rune fonts replace latin characters with runes.
echo.
jchoice /C:12345 /N Please Choose:

if errorlevel = 5 goto menu
if errorlevel = 4 goto EGA-ALTR
if errorlevel = 3 goto EGAR
if errorlevel = 2 goto EGA-ALT
if errorlevel = 1 goto EGA

:EGA
echo off
del gpack.ega
del shapes.ega
del charset.ega
del start.ega
del rune_0.ega
del rune_1.ega
del rune_2.ega
del rune_3.ega
del rune_4.ega
del rune_5.ega
del key7.ega
del honesty.ega
del compassn.ega
del valor.ega
del justice.ega
del sacrific.ega
del honor.ega
del spirit.ega
del humility.ega
del truth.ega
del love.ega
del courage.ega
del stoncrcl.ega
xcopy .\EGA\*.*
cls
ULTIMA.COM
goto quit
cls

:EGA-ALT
echo off
del gpack.ega
del shapes.ega
del charset.ega
del start.ega
del rune_0.ega
del rune_1.ega
del rune_2.ega
del rune_3.ega
del rune_4.ega
del rune_5.ega
del key7.ega
del honesty.ega
del compassn.ega
del valor.ega
del justice.ega
del sacrific.ega
del honor.ega
del spirit.ega
del humility.ega
del truth.ega
del love.ega
del courage.ega
del stoncrcl.ega
xcopy .\EGA-ALT\*.*
cls
ULTIMA.COM
goto quit
cls

:EGAR
echo off
del gpack.ega
del shapes.ega
del charset.ega
del start.ega
del rune_0.ega
del rune_1.ega
del rune_2.ega
del rune_3.ega
del rune_4.ega
del rune_5.ega
del key7.ega
del honesty.ega
del compassn.ega
del valor.ega
del justice.ega
del sacrific.ega
del honor.ega
del spirit.ega
del humility.ega
del truth.ega
del love.ega
del courage.ega
del stoncrcl.ega
xcopy .\EGA\*.*
del charset.ega
xcopy .\runic\*.*
cls
ULTIMA.COM
goto quit
cls

:EGA-ALTR
echo off
del gpack.ega
del shapes.ega
del charset.ega
del start.ega
del rune_0.ega
del rune_1.ega
del rune_2.ega
del rune_3.ega
del rune_4.ega
del rune_5.ega
del key7.ega
del honesty.ega
del compassn.ega
del valor.ega
del justice.ega
del sacrific.ega
del honor.ega
del spirit.ega
del humility.ega
del truth.ega
del love.ega
del courage.ega
del stoncrcl.ega
xcopy .\EGA-ALT\*.*
del charset.ega
xcopy .\runic\*.*
cls
ULTIMA.COM
goto quit
cls

:quit
exit