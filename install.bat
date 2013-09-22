:start
@echo off
cls
cd /d %~dp0
goto setwiminfo


:setwiminfo
cls
echo Please enter the full path to the
set /p WIM=WIM file of your choice:
cls
echo Path set.
pause
imagex /info "%WIM%" | find "<NAME>" >> Images.txt
goto dest


:dest
cls
echo Where would you like to install the image?
set /p dest=Enter the drive letter here [A-Z]:
goto index


:index
echo :start >> Display.bat
echo @echo off >> Display.bat
echo cls >> Display.bat
echo cd /d "%~dp0" >> Display.bat
echo echo List of images avalable for instalation: >> Display.bat
echo echo *Note the image number on the left of the name* >> Display.bat
echo find /N "<NAME>" Images.txt >> Display.bat
echo pause >> Display.bat
echo del Images.txt >> Display.bat
echo exit >> Display.bat
start Display.bat
cls
set /p index=Please inter the number of the image (name) you want to install:
goto install 


:install
echo this will install the wim to the destination you selected.
pause
cls
imagex /apply "%WIM%" %index% "%dest%":
goto boot


:boot
echo EasyBCD is starting from which you can install the boot loader.
Y:\Programs\EasyBCD\EasyBCD.exe
pause
goto cleanup


:cleanup
del Display.bat
del Images.txt
goto choice


:choice
cls
echo do you want to install another image?
choice
if %ERRORLEVEL% EQU 1 goto start
if %ERRORLEVEL% EQU 2 goto end
echo Error please try again :(
pause
goto choice


:end
cls
echo Thank you for using Elliot Labs installer!
echo For feature requests please email elliot-labs@live.com
echo Thank you!
pause | echo Press any key to exit...
exit
