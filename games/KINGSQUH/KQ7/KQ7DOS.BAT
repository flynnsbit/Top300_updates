@echo off 
cd \KQ7DOS 
call CheckCD   D 
@if exist vesadrv.bat call vesadrv.bat 
C:\KQ7DOS\sierra -o C:\KQ7DOS\resource.cfg 
:end 
cd .. 
