@echo off
cls
echo.
echo.
echo TRANSPORT TYCOON DELUXE - PLAYABLE DEMO
echo.
echo.
echo.
echo By default this demo is installed to C:\TTDXDEMO
echo.
echo.
echo To Install to a directory of your choice, you must
echo press CTRL-C to abort this installation. You can 
echo then copy the files TTDXDEMO.ZIP and PKUNZJR.COM into
echo a directory of your choice, change to that directory 
echo and enter PKUNZJR TTDXDEMO.ZIP to restore the game files
echo followed by DEMO to run the demo.
echo. 
echo.
echo Press any key to continue with the default installation
echo or CTRL-C to abort.
jchoice > nul
md c:\ttdxdemo
copy pkunzjr.com  c:\ttdxdemo
copy ttdxdemo.zip c:\ttdxdemo
c:
cd c:\ttdxdemo
pkunzjr ttdxdemo.zip
del pkunzjr.com  >nul
del ttdxdemo.zip >nul
demo.bat

