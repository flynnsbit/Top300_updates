@echo off
cls
echo  -= XcomUtil Installer =-
echo.

REM ### Varify CWD is Game Folder.

if exist geodata\obdata.dat goto gameok
echo This must be run from the game directory. 
@jchoice
goto EOF
:gameOK

REM ### Copy and verify files for x86 or x64 OS architecture
call XcomUtil\Batch\ArchFile.Bat
if exist xcomutil.exe if exist XcomUtil\Bin\xcomutrt.exe if exist XcomUtil\Bin\sdump.exe if exist XcomUtil\Bin\ResFix.exe if exist XcomUtil\Bin\ResInfo.exe goto FileTst2
goto archErr
:FileTst2
if %OSArch%. == 64. goto archFOK
if %OSArch%. == 32. goto archFOK
if %OSArch%. == 16. if exist XcomUtil\Bin\find.com if exist XcomUtil\Bin\xcopy.exe goto archFOK
:archErr
echo  Unable to find %OSArch%bit Files.
@jchoice
goto EOF
:archFOK
set OSArch=
set backup=
set restore=

REM Detect Steam.
if NOT exist ufoexe\geoscape.exe goto notStm
if exist "terror from the deep.exe" goto StmFiles
if exist terror.exe goto StmFiles
if exist "ufo defense.exe" goto StmFiles
if exist ufo.exe goto StmFiles
:notStm
goto setup
:StmFiles
echo Do you want to Configure Steam to use XcomUtil? (y)
XcomUtil\bin\sdump.exe * getresp yYnN y
if ERRORLEVEL 3 goto noStmSet
call XcomUtil\SteamSetup.bat sfx
goto setup
:noStmSet
echo.
echo You can configure Steam to use XcomUtil at any time by runing
echo XcomUtil\SteamSetup.bat

:setup
echo.
echo Do you want to configure XcomUtil now using XcuSetup? (y)
XcomUtil\bin\sdump.exe * getresp yYnN y
if ERRORLEVEL 3 goto Nosetup
call XcuSetup
goto EOF

:Nosetup
echo.
echo You will need to run XcuSetup manualy before using XcomUtil.
@jchoice
goto EOF

:EOF
set OSArch=
set backup=
set restore=

