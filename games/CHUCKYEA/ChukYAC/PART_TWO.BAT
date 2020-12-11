rem --- if we already copied files from Disk 2, don't bother doing it again
if exist %2\COMBAT\2a.lib goto 2c

rem --- make sure drive %1 contains Disk 2.
:2a
if exist %1\2a.lib goto 2b
cls
echo Insert YEAGER AIR COMBAT Disk 2 in drive %1.
@jchoice
goto 2a
:2b

rem --- copy Disk 2 files to the destination disk.
echo 
echo Copying files...
copy %1\*.* %2\COMBAT
:2c
if not exist %2\COMBAT\2a.lib goto error
if not exist %2\COMBAT\2b.lib goto error

rem --- if we already copied files from Disk 2, don't bother doing it again
if exist %2\COMBAT\3a.lib goto 3c

rem --- make sure drive %1 contains Disk 3.
:3a
if exist %1\3a.lib goto 3b
cls
echo Insert YEAGER AIR COMBAT Disk 3 in drive %1.
@jchoice
goto 3a
:3b

rem --- copy Disk 3 files to the destination disk.
echo 
echo Copying files...
copy %1\*.* %2\COMBAT
:3c
if not exist %2\COMBAT\3a.lib goto error

rem --- if we already copied files from Disk 4, then we're dealing with
rem     3.5" floppies, so don't do the steps below!
if exist %2\COMBAT\4a.lib goto 4c

rem --- make sure drive %1 contains Disk 4.
:4a
if exist %1\4a.lib goto 4b
cls
echo Insert YEAGER AIR COMBAT Disk 4 in drive %1.
@jchoice
goto 4a
:4b

rem --- copy Disk 4 files to the destination disk.
echo 
echo Copying files...
copy %1\*.* %2\COMBAT
:4c
if not exist %2\COMBAT\4a.lib goto error

rem --- installation was successful!
:installDone
cd %2\COMBAT
echo 
echo YEAGER AIR COMBAT is now installed on your destination disk.
echo To run it, type "YEAGER".
echo 
%2
goto done

rem --- general installation error.
:error
echo 
echo Installation Error:  Perhaps there isn't enough space on your destination
echo disk.  YEAGER AIR COMBAT requires at least 1.2 megabytes of free space.
goto errorDone

rem --- goto here after an error is detected, to print a message and exit.
:errorDone
echo YEAGER AIR COMBAT was not installed correctly.

:done

