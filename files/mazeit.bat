::Mazeit.bat
::Created by Sounak@9434
::Converts amaze.exe output to lilgui usable output.
@echo off
setlocal
::Getting lines and cols
set /a lines=(%1-1)/2
set /a cols=(%2-1)/2
if "%3"=="On" set "_tset=1"
if "%4" neq "" set "_TOUT=%4"
::Generating random filename
set _filename=temp.mazeit
::Echoing output of amaze to random filename
>%_filename% amaze %lines% %cols% #
::Getting actual cols and lines
set /a _lines=(%lines%*2)+1
set /a _cols=(%cols%*2)+1
::Setting up starting and ending values
::Getting odd or even send statement
set "odd="
for %%a in (1 3 5 7 9) do if %cols:~-1% equ %%a set "odd=Y"
::Setting up value
if defined odd (set /a "_dat=%cols%+1") else set /a "_dat=%cols%+2"
set _finish="1-%_dat%"
set _start="%_lines%-%_dat%"
::Getting and setting up blocked spaces
setlocal enabledelayedexpansion
set _ln=1
set /a _cl=%_cols%-1
for /f "tokens=*" %%a in (%_filename%) do (
	set "#line#=%%a"
	for /l %%b in (0,1,%_cl%) do (
		if "!#line#:~%%b,1!"=="#" set /a "#cols=%%b+1"& set "_block=!_block! !_ln!-!#cols!"
	)
	set /a _ln+=1
)
if "%_tset%" equ "1" (if not defined _TOUT set /a "_TOUT=%_lines%*%_cols%/10") ELSE set _TOUT=0
call lilgui.bat /h %_lines% /w %_cols% /s %_start% /f %_finish% /b "%_block%" /bc %_BCC% /r 1 /pc %_PCC% /fc %_FCC% /a %_BRD% /o %_TOUT%
set "_exit=%errorlevel%"
del %_filename%
endlocal&exit /b %_exit%