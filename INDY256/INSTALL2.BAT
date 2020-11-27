
REM Multi-Disk install, part 2.
:try2
echo Please insert "Disk 2" in Drive
cd
pause
echo 
if exist 91.lfl goto docopy2
goto try2

:docopy2
echo Copying "Disk 2" files to %1\INDY256...
copy *.* %1\INDY256 > NUL
if not exist %1\INDY256\91.lfl goto InstallError

:try3
echo Please insert "Disk 3" in Drive
cd
pause
echo 
if exist 82.lfl goto docopy3
goto try3

:docopy3
echo Copying "Disk 3" files to %1\INDY256...
copy *.* %1\INDY256 > NUL
if not exist %1\INDY256\82.lfl goto InstallError

:try4
echo Please insert "Disk 4" in Drive
cd
pause
echo 
if exist 94.lfl goto docopy4
goto try4

:docopy4
echo Copying "Disk 4" files to %1\INDY256...
copy *.* %1\INDY256 > NUL
if not exist %1\INDY256\94.lfl goto InstallError

cls
echo ษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
echo บ                                                                 บ
echo บ  "INDY256" has been successfully installed onto your hard disk. บ
echo บ                                                                 บ
echo บ  To run "INDY256" now, type INDY256 and press ENTER.            บ
echo บ                                                                 บ
echo ศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
%1
cd %1\INDY256
goto End

:InstallError
echo ERROR:  Installation of "INDY256" into %1\INDY256 was unsuccessful.
echo          This might be because your hard disk is full.  "INDY256" needs
echo          at least 4,800K of free disk space.
:End
echo 

