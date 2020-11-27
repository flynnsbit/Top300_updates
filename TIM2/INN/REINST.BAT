@echo off
insttsn
if exist lsci.cfg goto Fixit
goto Done

:Fixit

if exist mail.cfg del mail.cfg

del		sl\lsci.cfg
lsciget	lsci.cfg sl\lsci.cfg -t video ..\ keyboard ..\ music ..\ dll ..\
lsciget	lsci.cfg sl\lsci.cfg mouseDrv prefix id modem pFlag prodPath virtualDir swapSize LOGONVOL SEASONS
echo	 pathStr	=	..\>>sl\lsci.cfg
echo  hostID = SIERRA>>sl\lsci.cfg

if not exist ll\lsci.cfg goto Done
del		ll\lsci.cfg
lsciget	lsci.cfg ll\lsci.cfg -t video ..\ keyboard ..\ music ..\ dll ..\
lsciget	lsci.cfg ll\lsci.cfg mouseDrv prefix id modem pFlag prodPath virtualDir swapSize LOGONVOL SEASONS
echo	 pathStr	=	..\>>ll\lsci.cfg
echo  hostID = SIERRA>>ll\lsci.cfg

:Done

