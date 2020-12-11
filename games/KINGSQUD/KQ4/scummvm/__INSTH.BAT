rem	Prompt for each disk of the game in succession and copy
rem	everything over from it.

echo Copying game files...

:Vol1
exists %2:resource.001
if	not errorlevel 1 goto GetVol1
echo Please insert the disk labeled "Disk 1" in drive %2.
@jchoice
goto Vol1
:GetVol1
copy %2:sierra.exe >nul
copy %2:resource.* >nul

:Vol2
exists %2:resource.002
if	not errorlevel 1 goto GetVol2
echo Please insert the disk labeled "Disk 2" in drive %2.
@jchoice
goto Vol2
:GetVol2
copy %2:*.* >nul

:Vol3
exists %2:resource.003
if	not errorlevel 1 goto GetVol3
echo Please insert the disk labeled "Disk 3" in drive %2.
@jchoice
goto Vol3
:GetVol3
copy %2:*.* >nul

:Vol4
exists %2:resource.004
if	not errorlevel 1 goto GetVol4
echo Please insert the disk labeled "Disk 4" in drive %2.
@jchoice
goto Vol4
:GetVol4
copy %2:*.* >nul

:Vol5
exists %2:resource.005
if	not errorlevel 1 goto GetVol5
echo Please insert the disk labeled "Disk 5" in drive %2.
@jchoice
goto Vol5
:GetVol5
copy %2:*.* >nul

:Vol6
exists %2:resource.006
if	not errorlevel 1 goto GetVol6
echo Please insert the disk labeled "Disk 6" in drive %2.
@jchoice
goto Vol6
:GetVol6
copy %2:*.* >nul

:Vol7
exists %2:resource.007
if	not errorlevel 1 goto GetVol7
echo Please insert the disk labeled "Disk 7" in drive %2.
@jchoice
goto Vol7
:GetVol7
copy %2:*.* >nul

:Vol8
exists %2:resource.008
if	not errorlevel 1 goto GetVol8
echo Please insert the disk labeled "Disk 8" in drive %2.
@jchoice
goto Vol8
:GetVol8
copy %2:*.* >nul

:Vol9
exists %2:resource.009
if	not errorlevel 1 goto GetVol9
echo Please insert the disk labeled "Disk 9" in drive %2.
@jchoice
goto Vol9
:GetVol9
copy %2:*.* >nul

cd ..

echo	To play King's Quest IV, type
echo		cd \sierra
echo	and then
echo		kq4

