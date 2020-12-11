:menu
@echo off
cls
echo.
echo Press 1 for CGA (4-color)
echo Press 2 for CGA Composite (16-color)
echo Press 3 for EGA (16-color)
echo Press 4 to Quit
echo.
jchoice /C:1234 /N Please Choose:

if errorlevel = 4 goto quit
if errorlevel = 3 goto EGA
if errorlevel = 2 goto CGA16
if errorlevel = 1 goto CGA4

:CGA4
del U2.CFG
copy .\CGA4\*.*
cls
ultima2.com
goto quit
cls

:CGA16
del U2.CFG
copy .\CGA16\*.*
cls
ultima2.com
goto quit
cls

:EGA
@echo off
cls
echo.
echo Press 1 for EGA Tileset (v2.0)
echo Press 2 for EGA Tileset (v1.0)
echo Press 3 for Alternate EGA Tileset (Wiltshire Dragon)
echo Press 4 for Commodore 64 Tileset
echo Press 5 to Quit
echo.
jchoice /C:12345 /N Please Choose:

if errorlevel = 5 goto quit
if errorlevel = 4 goto EGAC64
if errorlevel = 3 goto EGAALT
if errorlevel = 2 goto EGA10
if errorlevel = 1 goto EGA20

:EGA20
del U2.CFG
del SHAPES.EGA
copy .\EGA20\*.*
cls
ultima2.com
goto quit
cls

:EGA10
del U2.CFG
copy .\EGA10\*.*
cls
ultima2.com
goto quit
cls

:EGAALT
del U2.CFG
copy .\EGAALT\*.*
cls
ultima2.com
goto quit
cls

:EGAC64
del U2.CFG
copy .\EGAC64\*.*
cls
ultima2.com
goto quit
cls

:quit
exit