
REM Multi-Disk install, part 2.
:try2
echo Please insert "Disk 2" in Drive
cd
jchoice
echo 
if exist 86.lfl goto docopy2
goto try2

:docopy2
echo Copying "Disk 2" files to %1\LOOM...
copy *.* %1\LOOM > NUL
if not exist %1\LOOM\86.lfl goto InstallError

:try3
echo Please insert "Disk 3" in Drive
cd
jchoice
echo 
if exist 66.lfl goto docopy3
goto try3

:docopy3
echo Copying "Disk 3" files to %1\LOOM...
copy *.* %1\LOOM > NUL
if not exist %1\LOOM\66.lfl goto InstallError

cls
echo ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
echo บ                                                              บ
echo บ  "Loom" has been successfully installed onto your hard disk. บ
echo บ                                                              บ
echo บ  To run "Loom" now, type LOOM and press ENTER.               บ
echo บ                                                              บ
echo ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
%1
cd %1\LOOM
goto End

:InstallError
echo ERROR:  Installation of "Loom" into %1\LOOM was unsuccessful.  This might
echo         be because your hard disk is full.  "Loom" needs at least 2,163K of
echo         free disk space.
:End
echo 

