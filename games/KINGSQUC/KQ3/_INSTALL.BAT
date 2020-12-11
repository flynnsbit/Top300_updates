rem	----	Copy the files from disk 1. 
copy _kq3.bat %1\sierra\kq3.bat 
copy sierra.com %1\sierra\kq3\kq3.com 
copy agi %1 
copy *.ovl %1 
copy	hgc_font %1 
copy logdir %1 
copy picdir %1 
copy viewdir %1 
copy snddir %1 
copy object %1 
copy words.tok %1 
copy vol.0 %1 
copy vol.1 %1 
rem	----	If vol.2 is not on this disk, prompt for disk 2. 
echo ÿ 
if exist vol.2 goto :Vol2Here 
:GetVol2 
echo Please put disk 2 of 
echo King's Quest III 
echo in the drive. 
@jchoice 
if not exist vol.2 goto :GetVol2 
:Vol2Here 
copy vol.2 %1 
rem	----	If vol.3 is not on this disk, prompt for disk 3. 
if exist vol.3 goto :Vol3Here 
:GetVol3 
echo Please put disk 3 of 
echo King's Quest III 
echo in the drive. 
@jchoice 
if not exist vol.3 goto :GetVol3 
:Vol3Here 
copy vol.3 %1 
rem	----	Everything has been copied -- tell the user how 
rem	----	to start the game. 
echo ÿ 
echo ÿ 
%1 
cd \sierra 
echo To play King's Quest III, type 
echo 	cd \sierra 
echo Then type 
echo 	kq3 
