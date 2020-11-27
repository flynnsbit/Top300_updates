REM # Dosbox version pre 0.70 and ver 0.73 have issues.
ver>temp.txt
XcomUtil\Bin\find16 /i "dosbox" temp.txt>nul
REM if 1 then Unknown Version
if errorlevel 1 goto EOF
:isDB
XcomUtil\Bin\find16 /i "0.6" temp.txt>nul
if errorlevel 1 goto not6
goto oldVer
:not6
XcomUtil\Bin\find16 /i "0.5" temp.txt>nul
if errorlevel 1 goto not5
goto oldVer
:not5
XcomUtil\Bin\find16 /i "0.4" temp.txt>nul
if errorlevel 1 goto not4
goto oldVer
:not4
goto EOF
:oldVer
call XcomUtil\Batch\display.bat DBOld 99
:ErrOut
set ErrOut=Y
:EOF
del temp.txt
