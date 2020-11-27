echo off
REM Disk install
cls

REM 
REM install drive:
REM
if %0==a:install goto adrive
if %0==A:install goto adrive
if %0==A:INSTALL goto adrive
if %0==b:install goto bdrive
if %0==B:install goto bdrive
if %0==B:INSTALL goto bdrive
if %0==install goto doinstall
if %0==INSTALL goto doinstall

echo Please change to the drive you wish to install from before
echo starting installation. 
goto End

:adrive
a:
goto doinstall

:bdrive
b:
goto doinstall

:doinstall
if "%1"=="" goto DriveNeeded
goto StartInstallation

:DriveNeeded
echo Please specify which drive to install on.
goto End

:StartInstallation
echo ษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
echo บ                                                               บ
echo บ                                                               บ
echo บ Installation of Lemmings2 into directory: %1\L2               บ
echo บ                                                               บ
echo บ                                                               บ
echo ศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
echo 

if not exist %1\L2\*.* goto CopyFiles

:DirectoryExists
echo WARNING:  The directory %1\L2 already exists.
echo Press Ctrl-C now to abort installation.
echo 
pause
echo 

REM
REM do the self extraction
REM
:CopyFiles
echo Copying Files....
md %1\l2
l2 %1\l2
if errorlevel == 0 goto ok

:InstallError
echo Installation of "Lemmings2" into %1\L2 was unsuccessful.
goto end

:ok
echo Installation successful, Change the current directory to %1\l2
echo and type 'l2' to play
:End
echo 


