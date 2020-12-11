REM Multi-Disk install, part 2.

:try2
echo Please insert "Disk 2" in Drive
cd
@jchoice
echo 
if exist disk02.lec goto docopy2
goto try2

:docopy2
echo Copying "Disk 2" files to %1\MONKEY...
copy *.* %1\MONKEY > NUL
if not exist %1\MONKEY\disk02.lec goto InstallError

:try3
echo Please insert "Disk 3" in Drive
cd
@jchoice
echo 
if exist disk03.lec goto docopy3
goto try3

:docopy3
echo Copying "Disk 3" files to %1\MONKEY...
copy *.* %1\MONKEY > NUL
if not exist %1\MONKEY\disk03.lec goto InstallError

:try4
echo Please insert "Disk 4" in Drive
cd
@jchoice
echo 
if exist disk04.lec goto docopy4
goto try4

:docopy4
echo Copying "Disk 4" files to %1\MONKEY...
copy *.* %1\MONKEY > NUL
if not exist %1\MONKEY\disk04.lec goto InstallError

cls
echo ษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
echo บ                                                                       บ
echo บ  "Monkey Island" has been successfully installed onto your hard disk. บ
echo บ                                                                       บ
echo บ  To run "Monkey Island" type MONKEY and press ENTER.                  บ
echo บ                                                                       บ
echo ศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
%1
cd %1\MONKEY
goto End

:InstallError
echo ERROR:  Installation of "Monkey" into %1\MONKEY was unsuccessful.  This might
echo         be because your hard disk is full.  "Monkey" needs at least 2,880K of
echo         free disk space.
:End
echo 

