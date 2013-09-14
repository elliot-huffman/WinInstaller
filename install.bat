:start
@echo off
cls
cd /d %~dp0

rem Sets up the working directory.




goto Menu





:Menu
cls
set selection=
cls
echo 1. Windows Server
echo 2. Windows Client
set /p selection=Please chose which OS type you want [1 or 2]:
if %selection% EQU 1 goto Server
if %selection% EQU 2 goto Client
cls
echo Invalid input try again!
pause
goto Menu

:Server
cls
set selection=
echo 1. Server 2008 (x86)
echo 2. Server 2012 (x64)
set /p selection=Please chose which OS you want [1 or 2]:
if %selection% EQU 1 goto 2008
if %selection% EQU 2 goto 2012
cls
echo Invalid input try again!
pause
goto Server

:Client
cls
set selection=
echo 1. Windows 8
echo 2. Windows 7
echo 3. Windows Vista
set /p selection=Please chose which OS you want [1, 2 or 3]:
if %selection% EQU 1 goto 8
if %selection% EQU 2 goto 7
if %selection% EQU 3 goto Vista
cls
echo Invalid input try again!
pause
goto Client


:2008
cls
set selection=
echo 1. Server Standard
echo 2. Server Enterprise
echo 3. Server Data Center
echo 4. Server Standard Core (no GUI)
echo 5. Server Enterprise Core (no GUI)
echo 6. Server Data Center (no GUI)
set /p selection=Please chose which OS type you want [1-6]:
if %selection% EQU 1 goto i19
if %selection% EQU 2 goto i18
if %selection% EQU 3 goto i17
if %selection% EQU 4 goto i16
if %selection% EQU 5 goto i15
if %selection% EQU 6 goto i14
cls
echo Invalid input try again!
pause
goto 2008

:2012
cls
set selection=
echo All are 64 bit (x64)
echo 1. Server Standard Core (no GUI)
echo 2. Server Standard
echo 3. Server Data Center Core (no GUI)
echo 4. Server Data Center
set /p selection=Please chose which OS type you want [1-4]:
if %selection% EQU 1 goto i23
if %selection% EQU 2 goto i22
if %selection% EQU 3 goto i21
if %selection% EQU 4 goto i20
cls
echo Invalid input try again!
pause
goto 2012


:8
cls
set selection=
echo 1. Windows 8 x86
echo 2. Windows 8 Pro x86
echo 3. Windows 8 x64
echo 4. Windows 8 Pro x64
set /p selection=Please chose which OS type you want [1-4]:
if %selection% EQU 1 goto i10
if %selection% EQU 2 goto i11
if %selection% EQU 3 goto i12
if %selection% EQU 4 goto i13
cls
echo Invalid input try again!
pause
goto 8


:7
cls
set selection=
echo 1. Windows 7 Starter x86
echo 2. Windows 7 Home Basic x86
echo 3. Windows 7 Home Premium x86
echo 4. Windows 7 Professional x86
echo 5. Windows 7 Ultimate x86
echo 6. Windows 7 Home Basic x64
echo 7. Windows 7 Home Premium x64
echo 8. Windows 7 Professional x64
echo 9. Windows 7 Ultimate x64
set /p selection=Please chose which OS type you want [1-9]:
if %selection% EQU 1 goto i5
if %selection% EQU 2 goto i4
if %selection% EQU 3 goto i3
if %selection% EQU 4 goto i2
if %selection% EQU 5 goto i1
if %selection% EQU 6 goto i9
if %selection% EQU 7 goto i8
if %selection% EQU 8 goto i7
if %selection% EQU 9 goto i6
cls
echo Invalid input try again!
pause
goto 7


:Vista
cls
set selection=
echo 1.  Windows Vista Starter x86
echo 2.  Windows Vista Business N x86
echo 3.  Windows Vista Home Basic N x86
echo 4.  Windows Vista Ultimate x86
echo 5.  Windows Vista Home Premium x86
echo 6.  Windows Vista Home Basic x86
echo 7.  Windows Vista Business x86
echo 8.  Windows Vista Ultiamte x64
echo 9.  Windows Vista Home Premium x64
echo 10. Windows Vista Home Basic x64
echo 11. Windows Vista Vista Business x64
set /p selection=Please chose which OS type you want [1-11]:
if %selection% EQU 1 goto i24
if %selection% EQU 2 goto i25
if %selection% EQU 3 goto i26
if %selection% EQU 4 goto i27
if %selection% EQU 5 goto i28
if %selection% EQU 6 goto i29
if %selection% EQU 7 goto i30
if %selection% EQU 8 goto i31
if %selection% EQU 9 goto i32
if %selection% EQU 10 goto i33
if %selection% EQU 11 goto i34
cls
echo Invalid input try again!
pause
goto Vista



:i1
set index=1
goto dest
:i2
set index=2
goto dest
:i3
set index=3
goto dest
:i4
set index=4
goto dest
:i5
set index=5
goto dest
:i6
set index=6
goto dest
:i7
set index=7
goto dest
:i8
set index=8
goto dest
:i9
set index=9
goto dest
:i10
set index=10
goto dest
:i11
set index=11
goto dest
:i12
set index=12
goto dest
:i13
set index=13
goto dest
:i14
set index=14
goto dest
:i15
set index=15
goto dest
:i16
set index=16
goto dest
:i17
set index=17
goto dest
:i18
set index=18
goto dest
:i19
set index=19
goto dest
:i20
set index=20
goto dest
:i21
set index=21
goto dest
:i22
set index=22
goto dest
:i23
set index=23
goto dest
:i24
set index=24
goto dest
:i25
set index=25
goto dest
:i26
set index=26
goto dest
:i27
set index=27
goto dest
:i28
set index=28
goto dest
:i29
set index=29
goto dest
:i30
set index=30
goto dest
:i31
set index=31
goto dest
:i32
set index=32
goto dest
:i33
set index=33
goto dest
:i34
set index=34
goto dest



:install
imagex /apply Y:\WIMs\install.wim %index% %dest%:
pause
goto Boot




:dest
cls
echo Please enter the drive letter you want to install to.
set /p dest=Please chose which letter you want [A-Z]:
goto install




:Boot
cls
echo This will run EasyBCD from which you can install the Boot Loader.
pause
Y:\Programs\EasyBCD\EasyBCD.exe
cls
echo Instalation complete!
pause
