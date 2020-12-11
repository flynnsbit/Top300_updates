@echo off

echo This will delete everything in your savegame directory (GAMEDAT).  This
echo will not delete any individual savegames.  If you don't want to do this, 
echo hit (CTRL)-C now.  Otherwise, hit any key to continue.
jchoice > nul

cd gamedat
attrib -r -h -s *.*
echo y | del *.*
cd..

echo Everything in your savegame directory has been erased.