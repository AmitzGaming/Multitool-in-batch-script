@echo off
color 0f
title Maze Game - Amitz Gaming
mode 49,20
>nul chcp 437
::Setting up variables
set "_lns=15"
set "_cls=15"
set "_lnf=31"
set "_clf=31"
set "_BCC=±"
set "_PCC="
set "_FCC=$"
set "_BRD=Û"
set "_COLORA=0f"
set "_TIMT=On"
:main
mode 49,20
call align.bat /m "±   ±   Û   Û±Û±Û Û±Û±Û"
call align.bat /m "Û   Û  ± ±      ± ±    "
call align.bat /m "±Û Û±  Û Û     Û  Û    "
call align.bat /m "Û±Û±Û ±   ±    ±  ±    "
call align.bat /m "± ± ± Û   Û   Û   Û±Û± "
call align.bat /m "Û Û Û ±Û±Û±  ±    ±    "
call align.bat /m "±   ± Û   Û  Û    Û    "
call align.bat /m "Û   Û ±   ± ±     ±    "
call align.bat /m "±   ± Û   Û Û±Û±Û Û±Û±Û"
call align.bat /r "V:2.0"
echo(
echo(
call align.bat /m "1.PLAY"
call align.bat /m "2.Options"
call align.bat /m "3.Defined specific game"
call align.bat /m "4.About"
call align.bat /m "5.EXIT"
echo(
>nul choice /c 12345
if errorlevel 5 exit
if errorlevel 4 goto :about
if errorlevel 3 goto :Specified
if errorlevel 2 goto :options
if errorlevel 1 goto :play
:play
setlocal enabledelayedexpansion
for /l %%a in (%_lns%,2,%_lnf%) do for /l %%b in (%_cls%,2,%_clf%) do (
	call mazeit.bat %%a %%b %_TIMT%
	set "_exit=!errorlevel!"
	if !_exit! neq 1 (goto :Lose) ELSE (
		cls
		echo Congratulation...
		echo Now moving on to the next level...
		>nul timeout /t 2
	)
)
endlocal
mode 49,20
call align.bat /m "Congratulation!!!"
call align.bat /m "You finished the game"
call align.bat /m "Run it again for new levels"
>nul timeout /t 5
goto :main
:Lose
endlocal
mode 49,20
call align.bat /m "Noooo!!! You Lose."
call align.bat /m "But don't worry, Play again"
call align.bat /m "I'm sure this time you'll win"
call align.bat /m "You can turn off timeout from options"
call align.bat /r "if you want"
>nul timeout /t 5
goto :main
:options
cls
color %_COLORA%
call align.bat /m "1.Blocked cell character=%_BCC%"
call align.bat /m "2.Player character=%_PCC%"
call align.bat /m "3.Finishing cell character=%_FCC%"
call align.bat /m "4.Starting number of lines=%_lns%"
call align.bat /m "5.Last number of lines=%_lnf%"
call align.bat /m "6.Starting number of coloumns=%_cls%"
call align.bat /m "7.Last number of coloumns=%_clf%"
call align.bat /m "8.Border cell=%_BRD%"
call align.bat /m "9.Color=%_COLORA%"
call align.bat /m "t.timeout=%_TIMT%"
call align.bat /m "x.Return to menu"
choice /c 123456789tx /n /m "Which value to change:"
set _cho=%errorlevel%
echo(
if %_cho% equ 11 goto :main
if %_cho% equ 10 if %_TIMT%==On (set _TIMT==Off) ELSE set _TIMT=On
if %_cho% equ 9 set /p "_COLORA=Color code:"
if %_cho% equ 8 set /p "_BRD=Changed Border cell:"
if %_cho% equ 7 set /p "_clf=Changed Last number of coloumns:"
if %_cho% equ 6 set /p "_cls=Changed Starting number of coloumns:"
if %_cho% equ 5 set /p "_lnf=Changed Last number of lines:"
if %_cho% equ 4 set /p "_lns=Changed Starting number of lines:"
if %_cho% equ 3 set /p "_FCC=Changed Finishing cell character:"
if %_cho% equ 2 set /p "_PCC=Changed Player character:"
if %_cho% equ 1 set /p "_BCC=Block cell character:"
goto :options
:specified
cls
echo(Maximum size for any is 51
echo(Minimum size for any is 15
set /p "_polines=Lines."
if %_polines% lss 15 goto :fake
if %_polines% gtr 51 goto :fake
set /p "_pocols=Cols."
if %_pocols% lss 15 goto :fake
if %_pocols% gtr 51 goto :fake
echo(Enter 0 for infinite
set /p "_TIMTOT=Timeout."
call mazeit.bat %_polines% %_pocols% %_TIMT% %_TIMTOT%
set _exit=%errorlevel%
mode 49,20
if %_exit% equ 1 (
	call align.bat /m "Congratulation!!!"
	call align.bat /m "You finished the specified game"
) ELSE (
	call align.bat /m "Noooo!!! You Lose."
	call align.bat /m "But don't worry, Play again"
)
>nul timeout /t 5
goto :main
:fake
echo(
echo Sorry, Invalid value
>nul timeout /t 5
goto :main
:about
mode 49,23
call align.bat /m "±   ±   Û   Û±Û±Û Û±Û±Û"
call align.bat /m "Û   Û  ± ±      ± ±    "
call align.bat /m "±Û Û±  Û Û     Û  Û    "
call align.bat /m "Û±Û±Û ±   ±    ±  ±    "
call align.bat /m "± ± ± Û   Û   Û   Û±Û± "
call align.bat /m "Û Û Û ±Û±Û±  ±    ±    "
call align.bat /m "±   ± Û   Û  Û    Û    "
call align.bat /m "Û   Û ±   ± ±     ±    "
call align.bat /m "±   ± Û   Û Û±Û±Û Û±Û±Û"
call align.bat /r "V:2.0"
echo(
echo(Maze game
echo(Created by Sounak@9434
echo(::Requirements:-
echo(	Align.bat
echo(	Amaze.exe
echo(	Mazeit.bat
echo(	Lilgui.bat
echo(Feel free to edit any of these tools.
echo(Thanks for downloading and playing.
echo(Press any key to return
>nul timeout /t -1
goto :main