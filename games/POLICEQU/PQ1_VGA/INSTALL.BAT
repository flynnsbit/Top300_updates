@echo off
set FLAG1=0
if "%ddir%"=="" goto setupDirs

:start
cls
echo videoDrv=VGA320.DRV > %ddir%\resource.pq1
echo kbdDrv=IBMKBD.DRV >> %ddir%\resource.pq1
echo minHunk=239K >> %ddir%\resource.pq1
echo language=1 >> %ddir%\resource.pq1
echo patchDir=%sdir% >> %ddir%\resource.pq1
echo.
echo               Police Quest I Install
echo.
echo Please select your sound driver:
echo.
echo 1. Sound Blaster/Adlib
echo 2. Creative Music System/Game Blaster
echo 3. General MIDI Compatible Card
echo 4. IBM PS/1 AUDIO/JOYSTICK CARD
echo 5. Roland MT-32, MT-100, or LAPC-1 sound module
echo 6. IBM PC or compatible internal speaker
echo.
what c "" 123456
if "%what%"=="1" echo soundDrv=ADL.DRV >> %ddir%\resource.pq1
if "%what%"=="2" echo soundDrv=CMS.DRV >> %ddir%\resource.pq1
if "%what%"=="3" echo soundDrv=GENMIDI.DRV >> %ddir%\resource.pq1
if "%what%"=="4" echo soundDrv=IBMPS1.DRV >> %ddir%\resource.pq1
if "%what%"=="5" echo soundDrv=MT32.DRV >> %ddir%\resource.pq1
if "%what%"=="6" echo soundDrv=STD.DRV >> %ddir%\resource.pq1
cls
echo.
echo               Police Quest I Install
echo.
echo Please select your audio driver:
echo.
echo 1.            Sound Blaster Compatible
echo 2.              Disney Sound Source
echo 3.            ProAudio Spectrum Card
echo 4.          IBM PS/1 AUDIO/JOYSTICK CARD
echo 5.                No audio card
echo.
what c "" 12345
if "%what%"=="1" echo audioDrv=AUDBLAST.DRV >> %ddir%\resource.pq1
if "%what%"=="2" echo audioDrv=AUDDISNY.DRV >> %ddir%\resource.pq1
if "%what%"=="3" echo audioDrv=AUDPRO.DRV >> %ddir%\resource.pq1
if "%what%"=="4" echo audioDrv=AUDPS1.DRV >> %ddir%\resource.pq1
if "%what%"=="5" echo audioDrv=AUDNONE.DRV >> %ddir%\resource.pq1
cls
echo.
echo               Police Quest I Install
echo.
what c "Do you have a joystick? (Y/N) " YN
if "%what%"=="Y" echo joyDrv=JOYSTICK.DRV >> %ddir%\resource.pq1
echo.
what c "Do you have a Microsoft compatible mouse? (Y/N) " YN
if "%what%"=="Y" echo mouseDrv=STDMOUSE.DRV >> %ddir%\resource.pq1
echo.
echo Would you like to use EXTENDED, EXPANDED, or XMS memory? (Y/N)
what c "" YN
if "%what%"=="Y" echo memoryDrv=ARM.DRV >> %ddir%\resource.pq1
echo.
if %FLAG1%==1 goto createBatch
goto end

:setupDirs
set FLAG1=1
echo.
cls
echo.
echo Type in the directory to install to, or press enter for default
echo.
echo C:\SIERRA\PQCOL
echo.
what s "Please enter install directory: " 
pushdir
if "%what%"=="" set what=c:\sierra\pqcol
set ddir=%what%
echo.
echo Please enter the letter of your INSTALL drive (example C).
what c "" abcdefghij
set ddr=%what%:
copy popdir.com %ddr%\
godir %ddir%
%ddr%\popdir
goto start

:createBatch
echo cd %ddir% > %ddir%\..\pq1vga.bat
echo Please enter the letter of your CD-ROM Drive (example D).
what c "" abcdefghij
echo %what%: >> %ddir%\..\pq1vga.bat
echo cd \pq1_vga >> %ddir%\..\pq1vga.bat
echo.
echo scidhuv %ddr%resource.pq1 >> %ddir%\..\pq1vga.bat
echo cd \ >> %ddir%\..\pq1vga.bat
echo %ddr% >> %ddir%\..\pq1vga.bat
echo cd .. >> %ddir%\..\pq1vga.bat
echo.

:end
if %FLAG1%==1 goto endMsg
goto endCont

:endMsg
set ddir=
set ddr=
echo This completes the install process.  Thank you.  To run PQ1, enter
echo the directory above the install directory (i.e.  C:\SIERRA) and 
echo type PQ1VGA.
echo.
jchoice

:endCont
set FLAG1=
echo.
