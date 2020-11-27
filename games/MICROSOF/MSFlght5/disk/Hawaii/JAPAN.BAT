@echo off
if exist \japan.bat goto :setup
echo You should run this program from the same drive as your CD ROM
echo To change to this drive, enter the drive letter for your CD ROM;
echo i.e. D: and press return
echo Once in the correct drive, you can run 'Japan' again to complete
echo the installation.
goto :end
:setup
cd\japan
setup
:end
