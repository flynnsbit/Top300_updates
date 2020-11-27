@echo off 
call CheckCD   D 
@if exist vesadrv.bat call vesadrv.bat 
C:\SCARYDOS\sierra C:\SCARYDOS\resource.cfg 
:end 
cd .. 
