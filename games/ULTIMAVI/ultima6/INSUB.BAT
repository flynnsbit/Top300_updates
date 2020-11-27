echo off
:adv1
cls
if exist %2\u6.1 goto adv1a
echo Please insert the PROGRAM disk.
pause
goto adv1
:adv1a
cls
echo Copying files...
copy %2\*.*>NUL
:adv2
cls
if exist %2\u6.2 goto adv2a
echo Please insert the INTRODUCTION disk.
pause
goto adv2
:adv2a
cls
echo Copying files...
copy %2\*.*>NUL
:adv3
cls
if exist %2\u6.4 goto adv3a
echo Please insert the GAME disk.
pause
goto adv3
:adv3a
cls
echo Copying files...
copy %2\*.*>NUL
:adv4
cls
if exist %2\u6.5 goto adv4a
echo Please insert the MAP disk.
pause
goto adv4
:adv4a
cls
echo Copying files...
copy %2\*.*>NUL
:adv5
cls
if exist %2\u6.6 goto adv5a
echo Please insert the POPULACE A disk.
pause
goto adv5
:adv5a
cls
echo Copying files...
copy %2\*.*>NUL
:adv6
cls
if exist %2\u6.7 goto adv6a
echo Please insert the POPULACE B disk.
pause
goto adv6
:adv6a
cls
echo Copying files...
copy %2\*.*>NUL
cls
:adv7
cls
install
