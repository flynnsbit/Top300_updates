echo off
cls
rem --- make sure the user specified valid drive letter (we allow A to H)
rem     for both the source and dest drives.
if %1a == a goto noDriveSpecified
if %1 == a: goto checkDest
if %1 == A: goto checkDest
if %1 == b: goto checkDest
if %1 == B: goto checkDest
if %1 == c: goto checkDest
if %1 == C: goto checkDest
if %1 == d: goto checkDest
if %1 == D: goto checkDest
if %1 == e: goto checkDest
if %1 == E: goto checkDest
if %1 == f: goto checkDest
if %1 == F: goto checkDest
if %1 == g: goto checkDest
if %1 == G: goto checkDest
if %1 == h: goto checkDest
if %1 == H: goto checkDest
goto notOnThatDrive
:checkDest
if %2a == a goto noDriveSpecified
if %1 == a: goto begin
if %1 == A: goto begin
if %1 == b: goto begin
if %1 == B: goto begin
if %2 == c: goto begin
if %2 == C: goto begin
if %2 == d: goto begin
if %2 == D: goto begin
if %2 == e: goto begin
if %2 == E: goto begin
if %2 == f: goto begin
if %2 == F: goto begin
if %2 == g: goto begin
if %2 == G: goto begin
if %1 == h: goto begin
if %1 == H: goto begin
:begin
echo ษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
echo บ                                                                       บ
echo บ                    YEAGER AIR COMBAT Installation                     บ
echo บ                                                                       บ
echo บ This will create a directory called %2\COMBAT on your destination     บ
echo บ disk, and will install YEAGER AIR COMBAT in that directory.           บ
echo บ                                                                       บ
echo บ If you don't want to install YEAGER AIR COMBAT now, press Ctrl-Break. บ
echo บ                                                                       บ
echo ศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
jchoice

rem --- create \COMBAT on the current drive.
echo 
echo Creating directory %2\COMBAT...
if not exist %2\COMBAT\*.* goto go_on
rem --- \COMBAT dir already exists.
:directoryExists
echo 
echo There is already a \COMBAT directory on drive %2.  If you don't want to
echo install YEAGER AIR COMBAT into that directory, press Ctrl-Break.
echo Otherwise, press any key to install YEAGER AIR COMBAT into %2\COMBAT.
jchoice
goto go_on2
:go_on
md %2\COMBAT
:go_on2

rem --- make sure source drive contains Disk 1
:1a
if exist %1\1a.lib goto 1b
echo 
echo Insert YEAGER AIR COMBAT Disk 1 in drive %1.
jchoice
goto 1a
:1b

rem --- copy program disk files, including next batch file, to dest disk.
echo 
echo Copying files...
copy %1\*.* %2\COMBAT
if not exist %2\COMBAT\yeager.exe goto error
if not exist %2\COMBAT\1a.lib goto error
if not exist %2\COMBAT\1b.lib goto error
if not exist %2\COMBAT\part_two.bat goto error

rem --- run next batch file
%2\COMBAT\part_two %1 %2

rem --- user didn't specify a drive letter followed by a colon.
:noDriveSpecified
echo 
echo Installation Error:  To install YEAGER AIR COMBAT, you must specify the
echo drive containing the floppies that you are installing FROM, and the drive
echo you are installing TO.  For example: if you are installing from
echo floppy drive A: to hard drive C:, then you should type
echo     INSTALL A: C:
echo ...and press Enter.
goto errorDone

rem --- user specified invalid drive letter.
:notOnThatDrive
echo 
echo Installation Error: Each drive letter must be a letter from A to H,
echo and must be followed by a colon.  For example, "INSTALL A: C:" will
echo install COMBAT from floppies on drive A: to hard drive C:.
goto errorDone

rem --- general installation error.
:error
echo 
echo Installation Error:  Perhaps there isn't enough space on your destination
echo disk.  YEAGER AIR COMBAT requires 1.2 megabytes of free space.
goto errorDone

rem --- goto here after an error is detected, to print a message and exit.
:errorDone
echo 
echo YEAGER AIR COMBAT was not installed correctly.
:done
