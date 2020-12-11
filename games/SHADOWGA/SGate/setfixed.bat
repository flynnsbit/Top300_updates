echo off
if %1x == x goto INSTRUCT
cls
echo This program will install the MINDSCAPE
echo floppy disk in drive A onto the hard
echo disk directory C:\%1.
echo If you do not wish to do this then
echo press Cntrl-Break now.
@jchoice
C:
cd\
a:install
if errorlevel 1 goto BADINSTAL
cls
echo All of the game files must be
echo copied to the hard disk.  If
echo you do not want this done now,
echo press Cntrl-Break.
@jchoice
md\%1 >nul:
cd\%1
copy a:*.* \%1 >nul:
finish %1
goto EXIT
:BADINSTAL
echo Installation has failed.  Aborting.
goto EXIT
:INSTRUCT
cls
echo This program allows you to install
echo your MINDSCAPE game on a hard disk.
echo The program takes one paramter. It
echo specifies the directory on the hard
echo disk to use.  If the directory does
echo not exist, it will be created.  The
echo directory should be specified
echo without a leading \.  The game is
echo always installed on hard disk C:
echo      SETFIXED GAME
echo will install the game on C:\GAME
:EXIT

