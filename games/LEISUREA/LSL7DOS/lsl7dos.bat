echo off 
cd \LSL7DOS 
call CheckCD   D 
call vesatest 
if errorlevel 0 goto vesafound 
echo A VESA driver was not found on your system. Please rerun install 
echo and check the readme file for help on installing a VESA driver. 
goto end 
:vesafound 
E:\GAMES\LSL7DOS\LSL7DOS\sier E:\GAMES\LSL7DOS\LSL7DOS\resource.cfg 
:end 
cd .. 
