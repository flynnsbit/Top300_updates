@echo off
cycles max
if not exist amiga\resource.map goto failA
echo Checking amiga\resource.000...
iscrc32 amiga\resource.000 A56C635B
if errorlevel 1 goto failA
echo Checking amiga\resource.001...
iscrc32 amiga\resource.001 CE92A1F6
if errorlevel 1 goto failA
echo Checking amiga\resource.002...
iscrc32 amiga\resource.002 E8DAE10B
if errorlevel 1 goto failA
echo Checking amiga\resource.003...
iscrc32 amiga\resource.003 C32E8ACE
if errorlevel 1 goto failA
echo Checking amiga\resource.004...
iscrc32 amiga\resource.004 177AA0BA
if errorlevel 1 goto failA

if exist amiga\bank.001 goto okA
:failA
echo Amiga version's data files were not found, corrupt or were incomplete in AMIGA\
goto usage

:okA
if exist pc\resource.map goto okB
echo PC version's data files were not found in PC\
goto usage

:okB
iscrc32 amiga\resource.map 94132B90
if not errorlevel 1 goto okC
echo Unknown and therefore unsupported version in AMIGA\
echo Only use Amiga version 1.023!
echo Press any key to continue anyway, knowing that the patched game might not work...
@jchoice > nul
goto okC

:okC
echo Checking for 360K PC version...
iscrc32 pc\resource.map 6F7302AC > nul
if errorlevel 1 goto check720
if errorlevel 0 goto okD
:check720
echo 360K version not found. Checking for 720K PC version...
iscrc32 pc\resource.map 5DADD697
if errorlevel 1 goto failC
if errorlevel 0 goto okD
:failC
echo Unknown and therefore unsupported version in PC\
echo Only use PC version 1.000.111!
echo Press any key to continue anyway, knowing that the patched game might not work...
@jchoice > nul
goto anyway

:okD
echo Found! Patching...
:anyway
chdir amiga
..\sciget script 0 79
..\sciget script 81 999
..\sciget text 0 999
..\sciget sound 600 999
..\sciget vocab 0 999
..\sciget font 0 999
..\sciget cursor 0 999
..\sciget view 600 999
..\sciget view 2
..\sciget view 260 270
chdir ..
chdir pc
..\sciget view 0 999
..\sciget pic 0 999
..\sciget sound 0 299
chdir ..
mkdir new
if exist new\*.* del new\*.*
chdir new
copy ..\pc\view.* .
copy ..\pc\pic.* .
copy ..\pc\cursor.* .
copy ..\pc\font.* .
copy ..\pc\patch.* .
copy ..\pc\sound.* .
copy ..\amiga\script.* .
copy ..\amiga\text.* .
copy ..\amiga\sound.* .
copy ..\amiga\font.* .
copy ..\amiga\cursor.* .
copy ..\amiga\vocab.* .
copy ..\amiga\bank.001 .
copy ..\amiga\view.002 .
copy ..\amiga\view.602 .
copy ..\amiga\view.604 .
copy ..\amiga\view.605 .
copy ..\amiga\view.606 .
copy ..\amiga\view.607 .
copy ..\amiga\view.608 .
copy ..\amiga\view.609 .
copy ..\amiga\view.610 .
copy ..\amiga\view.612 .
copy ..\amiga\view.614 .
copy ..\amiga\view.653 .
copy ..\amiga\view.904 .
copy ..\amiga\view.936 .
copy ..\amiga\view.940 .
copy ..\amiga\view.950 .
copy ..\amiga\view.967 .
copy ..\amiga\view.991 .
copy ..\amiga\view.26? .
copy ..\amiga\view.270 .
copy ..\script.* .
copy ..\sound.* .
copy ..\patch.* .
copy ..\pic.* .
copy ..\view.* .
..\change script.001 at 0000014C with 0C
..\change script.002 at 00000050 with 0C
..\change script.003 at 000000E4 with 0C
..\change script.004 at 00000177 with 0C
..\change script.005 at 000000BB with 0C
..\change script.006 at 00000051 with 0C
..\change script.007 at 00000299 with 0C
..\change script.007 at 000004C8 with 89 64 32 00 00
..\change script.007 at 000004ED with 2A
..\change script.008 at 00000050 with 0C
..\change script.009 at 00000090 with 0C
..\change script.010 at 00000086 with 0C
..\change script.011 at 000000B2 with 0C
..\change script.012 at 000000AE with 0C
..\change script.013 at 0000016C with 0C
..\change script.014 at 00000095 with 0C
..\change script.015 at 000000DB with 0C
..\change script.016 at 00000022 with 01
..\change script.016 at 000000BB with 0C
..\change script.017 at 00000022 with 01
..\change script.017 at 0000013A with 0C
..\change script.018 at 00000022 with 01
..\change script.018 at 00000121 with 0C
..\change script.019 at 00000176 with 0C
..\change script.020 at 0000005B with 0C
..\change script.021 at 00000046 with 0C
..\change script.022 at 000000EE with 0C
..\change script.023 at 000000AA with 0C
..\change script.024 at 00000074 with 0C
..\change script.025 at 00000102 with 0C
..\change script.026 at 00000046 with 0C
..\change script.027 at 00000064 with 0C
..\change script.028 at 00000089 with 0C
..\change script.028 at 000000D7 with 0A
..\change script.028 at 000000E0 with 8A
..\change script.028 at 0000011C with 1B
..\change script.028 at 0000011F with 8A
..\change script.029 at 00000083 with 0C
..\change script.030 at 000000EB with 0C
..\change script.037 at 0000004C with 00
..\change script.095 at 000000DF with 0C
..\change script.698 at 000006BA with 08
..\change script.699 at 0000003B with B6
..\change script.699 at 00000060 with B6
..\change script.699 at 00000085 with B6
..\change script.699 at 000002C1 with 1D
..\change script.699 at 000002CD with 94
..\change script.699 at 000002DA with 08
..\change script.699 at 000002E6 with 71
..\change script.699 at 000002EB with 5A
..\change script.699 at 000003CB with 49
..\change script.699 at 000003D7 with 6F
..\change script.699 at 000003EF with 57
..\change script.699 at 000004CE with 25
..\change script.699 at 000004DA with 94
..\change script.699 at 000004E7 with 27
..\change script.699 at 000004F3 with AF
..\change script.699 at 000005D3 with 46
..\change script.699 at 000005DF with 6B
..\change script.699 at 000005EB with 56
..\change script.699 at 000005F7 with 66
..\change script.996 at 000001F7 with 32 07
..\change script.996 at 00000219 with 32 07
..\change script.997 at 00000103 with 32 1E 00
..\respak00
..\iscrc32 resource.map dffce12e
if not errorlevel 1 goto okE
echo Something went wrong during patching:
echo The resulting RESOURCE.MAP file has an incorrect CRC32.
echo Press any key to continue anyway, knowing that the patched game might not work...
@jchoice > nul
goto okE

:okE
del script.*
del text.*
del sound.*
del vocab.*
del view.*
del pic.*
del cursor.*
del font.*
del patch.*
cd ..\amiga
ren script.080 _script.080
ren text.080 _text.080
del view.*
del script.*
del text.*
del font.*
del cursor.*
del vocab.*
del sound.*
ren _script.080 script.080
ren _text.080 text.080
cd ..\pc
del view.*
del pic.*
del sound.*
cd ..\new
copy ..\*.drv .
copy ..\sciv.exe .
copy ..\sierra.com .
copy ..\resource.cfg .
echo 1.1 > version
echo Done.
goto finish

:usage
echo 1. Extract the patch files into the current directory
echo 2. Extract the files from PC version 1.000.111 into a subdirectory PC\
echo 3. Extract the files from Amiga version 1.023 into a subdirectory AMIGA\
echo 4. Run PATCHKQ4.BAT (this file)
:finish
