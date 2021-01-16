@echo off
e:
cd\
copy launch.bat dbg_lnch.bat >> NUL
del launch.bat >> NUL
copy e:\utils\configs\mister1.sys c:\logo.sys >> NUL
copy e:\utils\configs\config.all c:\config.sys >> NUL
imgset r


