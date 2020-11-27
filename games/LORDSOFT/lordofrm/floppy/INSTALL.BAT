@echo off
setup
if errorlevel 2 goto end
lha x *.lzh
del *.lzh
del *.bat
:end

