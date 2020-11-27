echo off
cls
echo Please insert Disk 2 into drive A.
pause 
copy a:*.* \%1 >nul:
echo Installation completed.
:EXIT

