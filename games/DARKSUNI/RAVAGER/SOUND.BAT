@echo off
cls
echo Make sure the Dark Sun II CD is in the CD-ROM drive.
jchoice
echo Copying sound information, please wait ...
COPY D:\*.ADV > NUL
SOUND_DS
DEL *.ADV > NUL
