REM ##################################
REM # Copy Files for 16,32 or 64 bit #
if NOT %redir%. == . goto redOK
set redir=nul
:redOK

if %PROCESSOR_ARCHITECTURE%. == AMD64. goto os64bit
if %OS%. == Windows_NT. goto os32bit
:os16Bit
set OSArch=16
echo Arch:%OSArch%:>>%redir%
set backup=xcopy /n
set restore=xcopy /y
copy /y XcomUtil\Bin\xcutil16.exe xcomutil.exe             >>%redir%
copy /y XcomUtil\Bin\xcutrt16.exe XcomUtil\Bin\xcomutrt.exe>>%redir%
copy /y XcomUtil\Bin\sdump16.exe  XcomUtil\Bin\sdump.exe   >>%redir%
copy /y XcomUtil\Bin\ResFix16.exe XcomUtil\Bin\ResFix.exe  >>%redir%
copy /y XcomUtil\Bin\ResInf16.exe XcomUtil\Bin\ResInfo.exe >>%redir%
copy /y XcomUtil\Bin\BatRun16.exe XcomUtil\Bin\BatRun.exe  >>%redir%
copy /y XcomUtil\Bin\xcopy16.exe  XcomUtil\Bin\xcopy.exe   >>%redir%
copy /y XcomUtil\Bin\find16.com   XcomUtil\Bin\find.com    >>%redir%
goto EOF
:os32bit
set OSArch=32
echo Arch:%OSArch%:>>%redir%
set backup=xcopy /d /y
set restore=xcopy /y
if exist XcomUtil\Bin\find.com  del XcomUtil\Bin\find.com
if exist XcomUtil\Bin\xcopy.exe del XcomUtil\Bin\xcopy.exe
copy /y XcomUtil\Bin\xcutil32.exe xcomutil.exe             >>%redir%
copy /y XcomUtil\Bin\xcutrt32.exe XcomUtil\Bin\xcomutrt.exe>>%redir%
copy /y XcomUtil\Bin\sdump32.exe  XcomUtil\Bin\sdump.exe   >>%redir%
copy /y XcomUtil\Bin\ResFix32.exe XcomUtil\Bin\ResFix.exe  >>%redir%
copy /y XcomUtil\Bin\ResInf32.exe XcomUtil\Bin\ResInfo.exe >>%redir%
copy /y XcomUtil\Bin\BatRun32.exe XcomUtil\Bin\BatRun.exe  >>%redir%
goto EOF
:os64bit
set OSArch=64
echo Arch:%OSArch%:>>%redir%
set backup=xcopy /d /y
set restore=xcopy /y
if exist XcomUtil\Bin\find.com  del XcomUtil\Bin\find.com
if exist XcomUtil\Bin\xcopy.exe del XcomUtil\Bin\xcopy.exe
copy /y XcomUtil\Bin\xcutil32.exe xcomutil.exe             >>%redir%
copy /y XcomUtil\Bin\xcutrt32.exe XcomUtil\Bin\xcomutrt.exe>>%redir%
copy /y XcomUtil\Bin\sdump32.exe  XcomUtil\Bin\sdump.exe   >>%redir%
copy /y XcomUtil\Bin\ResFix32.exe XcomUtil\Bin\ResFix.exe  >>%redir%
copy /y XcomUtil\Bin\ResInf32.exe XcomUtil\Bin\ResInfo.exe >>%redir%
copy /y XcomUtil\Bin\BatRun32.exe XcomUtil\Bin\BatRun.exe  >>%redir%

:EOF