echo off
cls
echo  This program will uninstall the
echo  MINDSCAPE floppy disk in drive A
echo  from its hard disk directory.
echo  If you do not wish to do this,
echo  press Ctrl-Break.
jchoice
c:
cd\
a:install /u
echo off
echo  You may now delete the files in
echo  the hard disk directory.

