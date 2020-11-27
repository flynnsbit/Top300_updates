@ECHO OFF
if NOT EXIST patch.exe goto end
if EXIST language.eng patch.exe
del patch.exe
del patch.pif
del patch.rtp
:end 
