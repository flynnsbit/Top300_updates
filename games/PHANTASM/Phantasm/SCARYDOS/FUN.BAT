@echo off
:doscreen
cls
echo              ษอออออออออออออออออออออออออออออออออออออออออออออออออออป
echo              บ             The ImagiNation Network               บ
echo              วฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤถ
echo              บ                 CD-ROM Version                    บ
echo              วฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤถ
echo              บ                                                   บ
echo              บ     Here is your passport to the world of         บ
echo              บ  ImagiNation -- the most fun you can have with    บ
echo              บ  your modem!                                      บ
echo              บ                                                   บ
echo              บ     Test your skill with flight and sports        บ
echo              บ  simulators, try your luck at popular casino      บ
echo              บ  games, or challenge your mind with classic card  บ
echo              บ  and board games.  The fun is just a modem dial   บ
echo              บ  away...                                          บ
echo              บ                                                   บ
echo              บ                                                   บ
echo              บ         Press 1 - to install ImagiNation          บ
echo              บ                                                   บ
echo              บ         Press 2 - exit to DOS                     บ
echo              บ                                                   บ
echo              บ                                                   บ
echo              ศอออออออออออออออออออออออออออออออออออออออออออออออออออผ
what CE 12
if "%what%" == "1" goto install_INN
if "%what%" == "2" goto drop2dos
if "%what%" == "" goto drop2dos
goto doscreen
:install_INN
cd inn
install
:drop2dos
cls
