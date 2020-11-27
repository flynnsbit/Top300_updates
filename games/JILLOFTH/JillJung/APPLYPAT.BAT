@echo off
if exist JJFILE?.EXE goto reg
if not exist JILL2.EXE goto shareware
ren JILL1.EXE JJFILE1.EXE
ren JILL2.EXE JJFILE2.EXE
ren JILL3.EXE JJFILE3.EXE

:reg
if not exist PEAKS.DDT goto incomplete
mkdir old
copy JJFILE1.EXE OLD >NUL
copy JJFILE2.EXE OLD >NUL
copy JJFILE3.EXE OLD >NUL

:e1
set FILE=JJFILE1.EXE
:e1v10
iscrc32 %FILE% 7899CC28
if errorlevel 1 goto e1v12b
bspatch OLD\%FILE% %FILE% J1-10.DIF
goto e2
:e1v12b
iscrc32 %FILE% 171E9EC0
if errorlevel 1 goto e1v12c
bspatch OLD\%FILE% %FILE% J1-12B.DIF
goto e2
:e1v12c
iscrc32 %FILE% C52CA6D9
if errorlevel 1 goto e1v12d
bspatch OLD\%FILE% %FILE% J1-12C.DIF
goto e2
:e1v12d
iscrc32 %FILE% 0E7C596F
if errorlevel 1 goto badCRC
bspatch OLD\%FILE% %FILE% J1-12D.DIF
goto e2

:e2
set FILE=JJFILE2.EXE
:e2v10
iscrc32 %FILE% 6064EA0A
if errorlevel 1 goto e2v12b
bspatch OLD\%FILE% %FILE% J2-10.DIF
bspatch OLD\%FILE% JJFILE0.EXE J2-MENU.DIF
echo @echo off >JILL.BAT
echo cls >>JILL.BAT
echo jjfilea %1 %2 %3 >>JILL.BAT
echo. >>JILL.BAT
echo :Very important -- do not modify or remove this file, >>JILL.BAT
echo :it is VITAL to starting the game properly. >>JILL.BAT
echo @echo off >JJFILEA.BAT
echo jjfile0 >>JJFILEA.BAT
echo if not errorlevel 1 jjfileb %1 %2 %3 >>JJFILEA.BAT
echo.>JJFILEB.BAT
goto e3
:e2v12b
iscrc32 %FILE% 17477A49
if errorlevel 1 goto e2v12c
bspatch OLD\%FILE% %FILE% J2-12B.DIF
goto e3
:e2v12c
iscrc32 %FILE% 75176ED7
if errorlevel 1 goto e2v12d
bspatch OLD\%FILE% %FILE% J2-12C.DIF
goto e3
:e2v12d
iscrc32 %FILE% 0FDB489E
if errorlevel 1 goto badCRC
bspatch OLD\%FILE% %FILE% J2-12D.DIF
goto e3

:e3
set FILE=JJFILE3.EXE
:e1v10
iscrc32 %FILE% 3B4D8C3B
if errorlevel 1 goto e3v12b
bspatch OLD\%FILE% %FILE% J3-10.DIF
goto done
:e3v12b
iscrc32 %FILE% D5345AFB
if errorlevel 1 goto e3v12c
bspatch OLD\%FILE% %FILE% J3-12B.DIF
goto done
:e3v12c
iscrc32 %FILE% 3FFF0F6C
if errorlevel 1 goto e3v12d
bspatch OLD\%FILE% %FILE% J3-12C.DIF
goto done
:e3v12d
iscrc32 %FILE% E27D4300
if errorlevel 1 goto badCRC
bspatch OLD\%FILE% %FILE% J3-12D.DIF
goto done

:incomplete
echo File PEAKS.DDT is missing. This is usually a sign that this version was
echo downloaded from some abandonware site. Patching cannot continue.
goto eof

:badCRC
echo File %FILE% has a CRC that is not recognized and thus cannot be updated.
goto eof

:shareware
echo The shareware version is not supported.
goto eof

:done
echo Patching complete!
del *.dif
del iscrc32.com
del cwsdpmi.exe
del bspatch.exe

:eof
