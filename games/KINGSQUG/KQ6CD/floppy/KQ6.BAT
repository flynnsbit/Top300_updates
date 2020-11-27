echo off
if not exist seq.exe goto continue
echo ÿ
echo Please wait ...
echo This uncompression of the Opening Cartoon
echo will occur only once during the initial
echo startup.
echo ÿ
echo File Decompression software Copyright
echo (c) Haruyasu Yoshizaki, 1988-91
seq.exe >nul
del seq.exe
sync.exe >nul
del sync.exe
:continue
sierra
cd ..
