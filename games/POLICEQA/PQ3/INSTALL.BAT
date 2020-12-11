@echo off
set FLAG1=0
if "%ddir%"=="" goto setupDirs

:start
cls
echo videoDrv=VGA320.DRV > %ddir%\resource.pq3
echo kbdDrv=IBMKBD.DRV >> %ddir%\resource.pq3
echo minHunk=243K >> %ddir%\resource.pq3
echo patchDir=%sdir% >> %ddir%\resource.pq3
echo directory=\SIERRA\PQCOL >> %ddir%\resource.pq3
echo.
echo               Police Quest III Install
echo.
echo Please select your sound driver:
echo.
echo 1.  Roland MT-32 with CMS Sound Blaster
echo 2.  Roland MT-32, MT-100, LAPC-1, CM-32L, or CM-64
echo 3.  Pro Audio Spectrum
echo 4.  Sound Blaster Card
echo 5.  Adlib Music Synthesizer Card
echo 6.  Game Blaster Card
echo 7.  Tandy 3 Voice with DAC
echo 8.  Tandy 3 Voice
echo 9.  IBM PS/1 Audio/Joystick Card
echo 0.  IBM PC or Compatible Internal Speaker
what c "" 1234567890
if "%what%"=="1" echo soundDrv=MTBLAST.DRV >> %ddir%\resource.pq3
if "%what%"=="2" echo soundDrv=MT32.DRV >> %ddir%\resource.pq3
if "%what%"=="3" echo soundDrv=PROAUDIO.DRV >> %ddir%\resource.pq3
if "%what%"=="4" echo soundDrv=SNDBLAST.DRV >> %ddir%\resource.pq3
if "%what%"=="5" echo soundDrv=ADL.DRV >> %ddir%\resource.pq3
if "%what%"=="6" echo soundDrv=CMS.DRV >> %ddir%\resource.pq3
if "%what%"=="7" echo soundDrv=TANDY3VD.DRV >> %ddir%\resource.pq3
if "%what%"=="8" echo soundDrv=TANDY3V.DRV >> %ddir%\resource.pq3
if "%what%"=="9" echo soundDrv=IBMPS1.DRV >> %ddir%\resource.pq3
if "%what%"=="0" echo soundDrv=STD.DRV >> %ddir%\resource.pq3
cls
echo.
echo               Police Quest III Install
echo.
what c "Do you have a joystick? (Y/N) " YN
if "%what%"=="Y" echo joyDrv=JOYSTICK.DRV >> %ddir%\resource.pq3
echo.
what c "Do you have a Microsoft compatible mouse? (Y/N) " YN
if "%what%"=="Y" echo mouseDrv=STDMOUSE.DRV >> %ddir%\resource.pq3
echo.
echo Would you like to use EXTENDED, EXPANDED, or XMS memory? (Y/N)
what c "" YN
if "%what%"=="Y" echo memoryDrv=ARM.DRV >> %ddir%\resource.pq3
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
echo cd %ddir% > %ddir%\..\pq3.bat
echo Please enter the letter of your CD-ROM Drive (example D).
what c "" abcdefghij
echo %what%: >> %ddir%\..\pq3.bat
echo cd \pq3 >> %ddir%\..\pq3.bat
echo.
echo scidhuv %ddr%resource.pq3 >> %ddir%\..\pq3.bat
echo cd \ >> %ddir%\..\pq3.bat
echo %ddr% >> %ddir%\..\pq3.bat
echo cd .. >> %ddir%\..\pq3.bat
echo.

:end
if %FLAG1%==1 goto endMsg
goto endCont

:endMsg
set ddir=
set ddr=
echo This completes the install process.  Thank you.  To run PQ3, enter
echo the directory above the install directory (i.e.  C:\SIERRA) and 
echo type PQ3.
echo.
@jchoice

:endCont
set FLAG1=
echo.
