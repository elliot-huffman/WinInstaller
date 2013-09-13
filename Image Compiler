:start
@echo off
cd /d %~dp0

REM The "rem" is for putting notes into the bat files.
REM These notes are for you to read so you understand how this file works.
REM if the "rem" in all caps that means that it is an important note.

rem The above code sets up the working directory.


goto menu

rem The above code goes to the menu.


:menu
cls
set selection=
cls
echo 1. Auto Mode. #Coming Later#(Only executes 3. At the moment)
echo 2. Open Drivers folder (Driver integration is not used at the moment)
echo 3. Merge Install WIMs
echo 4. Create folder structure
echo 5. Unmount any mounted images on the mount directory (Not needed)
echo 6. Exit
set /p selection=Please chose what you want to do [1-6]:
if %selection% EQU 1 goto automode
if %selection% EQU 2 goto driverfolder
if %selection% EQU 3 goto installwim
if %selection% EQU 4 goto createfolders
if %selection% EQU 5 goto unmount
if %selection% EQU 6 exit


rem The above code is the menu




:createfolders
cls
echo Warning Creating folders will delete any existing ones of the same names: 7, 8, 2008, 2012, v, Final WIMs and Working!!!
pause
rd /s /q 7 8 2008 2012 V "Final WIMs" Working
md 7 8 2008 2012 V "Final WIMs" Working
cd Working
md Drivers Mount Temp
cd Drivers
md Install Boot
cd Boot
md x86 x64
cd %~dp0Working\Drivers\Install
md x86 x64
cd %~dp0Working\Temp
md Boot
cd %~dp07
md x86 x64
cd %~dp08
md x86 x64
cd %~dp0V
md x86 x64
cd %~dp02008
md x86 x64
goto start

rem The above code creates the folder structure




:automode
cls
set automode=1
echo auto mode
pause

goto end


:installwim

rem The %nameX% varible (Where "X" is a number) is in order of image index number.
rem The %Archtype% varible will be used in driver integration for the install.wim.

rem Ignore the error at the bigening it is it trying to unmount an image that is not mounted. 
rem It will only have any use when driver integration will be implamentamented.

@echo off
cls
cd /d %~dp0
echo This will merge all of the install.wim files into one.
echo This will also delte an existing install.wim if it is present.
echo If there is an error at the beginning of this script
echo ignore it it is meaningless.
pause
del /p "%~dp0Final WIMs\install.wim"
Dism /Unmount-Wim /MountDir:%~dp0Working\Mount /discard
Set Archtype=x86
Set name1=
Set name2=
Set name3=
Set name4=
Set name5=
Set name6=
Set name7=
Set Source=
Set Dest="Final WIMs\install.wim"
Set Number=
Set Image=
goto 7x86

:7x86
Set Image=%~dp07\x86\sources\install.wim
Set next=7x64
Set name1=Windows 7 STARTER x86
Set name2=Windows 7 HOMEBASIC x86
Set name3=Windows 7 HOMEPREMIUM x86
Set name4=Windows 7 PROFESSIONAL x86
Set name5=Windows 7 ULTIMATE x86
Set name6=
Set name7=
Set Number=5
goto export

:7x64
Set Image=%~dp07\x64\sources\install.wim
Set next=8x86
Set name1=Windows 7 HOMEBASIC x64
Set name2=Windows 7 HOMEPREMIUM x64
Set name3=Windows 7 PROFESSIONAL x64
Set name4=Windows 7 ULTIMATE x64
Set name5=
Set name6=
Set name7=
Set Number=4
goto export

:8x86
Set Image=%~dp08\x86\sources\install.wim
Set next=8x64
Set name1=Windows 8 Pro x86
Set name2=Windows 8 x86
Set name3=
Set name4=
Set name5=
Set name6=
Set name7=
Set Number=2
goto export

:8x64
Set Image=%~dp08\x64\sources\install.wim
Set next=2008x86
Set name1=Windows 8 Pro x64
Set name2=Windows 8 x64
Set name3=
Set name4=
Set name5=
Set name6=
Set name7=
Set Number=2
goto export

:2008x86
Set Image=%~dp02008\x86\sources\install.wim
Set next=2012
Set name1=Windows Server 2008 Standard x86
Set name2=Windows Server 2008 Enterprise x86
Set name3=Windows Server 2008 Data Center x86
Set name4=Windows Server 2008 Standard Core x86
Set name5=Windows Server 2008 Enterprise Core x86
Set name6=Windows Server 2008 Data Center Core x86
Set name7=
Set Number=6
goto export

:2012
Set Image=%~dp02012\sources\install.wim
Set next=Vx86
Set name1=Windows Server 2012 Standard Core
Set name2=Windows Server 2012 Standard
Set name3=Windows Server 2012 Data Center Core
Set name4=Windows Server 2012 Data Center
Set name5=
Set name6=
Set name7=
Set Number=4
goto export

:Vx86
Set Image=%~dp0V\x86\sources\install.wim
Set next=Vx64
Set name1=Windows Vista Business x86
Set name2=Windows Vista Home Basic x86
Set name3=Windows Vista Home Premium x86
Set name4=Windows Vista Ultimate x86
Set name5=Windows Vista Home Basic N x86
Set name6=Windows Vista Business N x86
Set name7=Windows Vista Starter x86
Set Number=7
goto export

:Vx64
Set Image=%~dp0V\x64\sources\install.wim
Set next=info
rem if %automode% EQU 1 set next=
Set name1=Windows Vista Business x64
Set name2=Windows Vista Home Basic x64
Set name3=Windows Vista Home Premium x64
Set name4=Windows Vista Ultiamte x64
Set name5=
Set name6=
Set name7=
Set Number=4
goto export

REM The automode integration is in Vx64 it is disabled at the moment.

:export
if %Number% EQU 1 goto 1
if %Number% EQU 2 goto 2
if %Number% EQU 3 goto 3
if %Number% EQU 4 goto 4
if %Number% EQU 5 goto 5
if %Number% EQU 6 goto 6
if %Number% EQU 7 goto 7

:7
dism /Export-Image /sourceimagefile:%image% /sourceindex:7 /destinationimagefile:%dest% /destinationname:"%name7%" /compress:max
:6
dism /Export-Image /sourceimagefile:%image% /sourceindex:6 /destinationimagefile:%dest% /destinationname:"%name6%" /compress:max
:5
dism /Export-Image /sourceimagefile:%image% /sourceindex:5 /destinationimagefile:%dest% /destinationname:"%name5%" /compress:max
:4
dism /Export-Image /sourceimagefile:%image% /sourceindex:4 /destinationimagefile:%dest% /destinationname:"%name4%" /compress:max
:3
dism /Export-Image /sourceimagefile:%image% /sourceindex:3 /destinationimagefile:%dest% /destinationname:"%name3%" /compress:max
:2
dism /Export-Image /sourceimagefile:%image% /sourceindex:2 /destinationimagefile:%dest% /destinationname:"%name2%" /compress:max
:1
dism /Export-Image /sourceimagefile:%image% /sourceindex:1 /destinationimagefile:%dest% /destinationname:"%name1%" /compress:max

rem The numbers 7-1 is the ammount of indexes in a WIM

goto %next%



:info
echo Complete! Go to the "Final WIMs" folder to get the install.wim file.
pause
goto start



:driverfolder
explorer .\Working\Drivers
pause
goto start

rem The above code open the driver folder



:unmount
Dism /Unmount-Wim /MountDir:%~dp0Working\Mount /discard
pause
goto start



:end
Dism /Unmount-Wim /MountDir:%~dp0Working\Mount /discard
cls
@echo off
echo Operation completed successfully!
pause
