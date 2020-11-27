@echo off
if %0==corlinst goto ok
if %0==Corlinst goto ok
if %0==CorlInst goto ok
if %0==CORLINST goto ok
echo +------------------------------------------------------------+
echo :                                                            :
echo :  You must switch to your CD-ROM drive before running this  :
echo :  program.                                                  :
echo :                                                            :
echo +------------------------------------------------------------+
goto end
:ok
echo +------------------------------------------------------------+
echo :                                                            :
echo :  This program will install X-Wing CD on systems using      :
echo :  Corel SCSI CD Extensions (CORELCDX.COM).                  :
echo :                                                            :
echo :  The files needed to run X-Wing CD will be copied to       :
echo :                                                            :
echo :  C:\XWINGCD                                                :
echo :                                                            :
echo :  This directory will be created if necessary.              :
echo :                                                            :
echo :  NOTE: You must have 1,900,000 Bytes free on your C:       :
echo :  drive to use this installation program.                   :
echo :                                                            :
echo +------------------------------------------------------------+
pause
md C:\XWINGCD
copy *.* C:\XWINGCD
c:
cd \xwingcd
setmuse
echo Enter XWINGCD to play X-Wing CD.
:end


