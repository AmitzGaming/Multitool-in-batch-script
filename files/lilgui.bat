@echo off
setlocal enabledelayedexpansion
if "%1"=="/?" if exist lilgui-help.txt ((type lilgui-help.txt|more)&exit/b) ELSE echo lilgui-help.txt not found
:getdata
if not "%~1"=="" set "%~1=%~2"
shift
shift
if not "%~1"=="" goto getdata
::All inputs will be taken through the above line
::Setting up default values for /h[eight] and /w[idth]
if not defined /r set "/r=0"
if not defined /h set "/h=5"
if not defined /w set "/w=5"
::Defining default variables if not specified
if not defined /a set "/a=2"
if not defined /pc set "/pc=P"
if not defined /fc set "/fc=F"
if not defined /s set "/s=%/h%-%/w%"
if not defined /f set "/f=1-1"
if not defined /o set "/o=0"
if defined /b if not defined /bc set "/bc=X"
if defined /t if not defined /tc set "/tc= "
::All default variables are defined till the above line
::Setting up all variables as blank
for /l %%a in (1,1,%/h%) do for /l %%b in (1,1,%/w%) do set "%%a-%%b= "
::Getting datas from lists of event_cells and block_cells
for %%a in (%/b%) do set "%%a=%/bc%"
for %%b in (%/t%) do set "%%b=%/tc%"
::Setting up characters
if %/a% neq 0 if %/a% neq 1 if %/a% neq 2 (
	for /l %%c in (1,1,%/w%) do set "_dis=!_dis!%/a%"
	set "_top=%/a%!_dis!%/a%"
	set "_bottom=%/a%!_dis!%/a%"
	set "_side=%/a%"
)
if %/a% equ 1 (
	for /l %%c in (1,1,%/w%) do set "_dis=!_dis!ƒ"
	set "_top=⁄!_dis!ø"
	set "_bottom=¿!_dis!Ÿ"
	set "_side=≥"
)
if %/a% equ 0 (
	for /l %%c in (1,1,%/w%) do set "_dis=!_dis!-"
	set "_top=-!_dis!-"
	set "_bottom=!_top!"
	set "_side=|"
)
if %/a% equ 2 (
	for /l %%c in (1,1,%/w%) do set "_dis=!_dis!Õ"
	set "_top=…!_dis!ª"
	set "_bottom=»!_dis!º"
	set "_side=∫"
)
::Setting up single characters
set "%/f%=%/fc%"
set "%/s%=%/pc%"
::Getting staring location
for /f "tokens=1,2 delims=-" %%d in ("%/s%") do set "_x=%%d"&set "_y=%%e"
::Setting up linefeed character
set ^"LF=^
%= This creates a variable containing a single linefeed (0x0A) character =%
^"
::Checking Resize
if %/r% equ 1 (
	set /a "_rsln=%/h%+4"
	set /a "_rscl=%/w%+3"
	mode !_rscl!,!_rsln!
)
::Getting Timeout
set _time=%/o%
if %_time% neq 0 for /f "tokens=1-3 delims=:.," %%a in ("%time: =0%") do set /a "_secd=(((1%%a*60)+1%%b)*60+1%%c)-366101+%_time%"
set _send=%_time%
::Setting up lines
for /l %%f in (1,1,%/h%) do (
	set "_line%%f=!_side!"
	for /l %%g in (1,1,%/w%) do (
		set _line%%f=!_line%%f!!%%f-%%g!
	)
	set "_line%%f=!_line%%f!!_side!!LF!"
)
goto :Display
:Change
::Changing required lines
if "%_x%" neq "%_lx%" (set "_toch=%_x% %_lx%") ELSE set "_toch=%_x%"
for %%y in (%_toch%) do (
	set "_line%%y="
	for /l %%z in (1,1,%/w%) do (
		set "_line%%y=!_line%%y!!%%y-%%z!"
	)
	set "_line%%y=%_side%!_line%%y!%_side%!LF!"
)
:Display
::Generating Display
set _display=
for /l %%h in (%/h%,-1,1) do set "_display=!_line%%h!!_display!"
if not %_time% equ 0 (cls&echo(!_top!!LF!!_display!!_bottom!!LF!Time:!_send!) ELSE cls&echo(!_top!!LF!!_display!!_bottom!
if %_time% neq 0 if %_send% leq 0 exit /b 3
::Setting up movement using choice
>nul choice /c wasd€ /t 1 /d €
if errorlevel 5 (
	if %_time% neq 0 for /f "tokens=1-3 delims=:.," %%a in ("%time: =0%") do set /a "_tmt=(((1%%a*60)+1%%b)*60+1%%c)-366101"&set /a "_send=_secd-_tmt"
	goto :Display
)
set "_move=%errorlevel%"
::Upward movement [w]
if %_move% equ 1 (
	set "_lx=%_x%"
	set "%_x%-%_y%= "
	if not %_x% equ 1 set /a "_x=%_x%-1"
	for %%z in (!_x!-!_y!) do if "!%%z!"=="%/bc%" (for %%a in (%/b%) do if "%%a"=="%%z" set "_x=%_x%") ELSE if "!%%z!"=="%/tc%" for %%b in (%/t%) do if "%%b"=="%%z" for %%1 in ("event:!_x!:!_y!") do (endlocal&set "_out=%%~1"&exit /b 2)
	if "%/f%"=="!_x!-!_y!" (endlocal&set "_out=finish"&exit /b 1)
	set "!_x!-!_y!=%/pc%"
	if %_time% neq 0 for /f "tokens=1-3 delims=:.," %%a in ("%time: =0%") do set /a "_tmt=(((1%%a*60)+1%%b)*60+1%%c)-366101"&set /a "_send=_secd-_tmt"
	goto :change
)
::Downward movement [s]
if %_move% equ 3 (
	set "_lx=%_x%"
	set "%_x%-%_y%= "
	if not %_x% equ %/h% set /a "_x=%_x%+1"
	for %%z in (!_x!-!_y!) do if "!%%z!"=="%/bc%" (for %%a in (%/b%) do if "%%a"=="%%z" set "_x=%_x%") ELSE if "!%%z!"=="%/tc%" for %%b in (%/t%) do if "%%b"=="%%z" for %%1 in ("event:!_x!:!_y!") do (endlocal&set "_out=%%~1"&exit /b 2)
	if "%/f%"=="!_x!-!_y!" (endlocal&set "_out=finish"&exit /b 1)
	set "!_x!-!_y!=%/pc%"
	if %_time% neq 0 for /f "tokens=1-3 delims=:.," %%a in ("%time: =0%") do set /a "_tmt=(((1%%a*60)+1%%b)*60+1%%c)-366101"&set /a "_send=_secd-_tmt"
	goto :change
)
::Left movement [a]
if %_move% equ 2 (
	set "_lx=%_x%"
	set "%_x%-%_y%= "
	if not %_y% equ 1 set /a "_y=%_y%-1"
	for %%z in (!_x!-!_y!) do if "!%%z!"=="%/bc%" (for %%a in (%/b%) do if "%%a"=="%%z" set "_y=%_y%") ELSE if "!%%z!"=="%/tc%" for %%b in (%/t%) do if "%%b"=="%%z" for %%1 in ("event:!_x!:!_y!") do (endlocal&set "_out=%%~1"&exit /b 2)
	if "%/f%"=="!_x!-!_y!" (endlocal&set "_out=finish"&exit /b 1)
	set "!_x!-!_y!=%/pc%"
	if %_time% neq 0 for /f "tokens=1-4 delims=:.," %%a in ("%time: =0%") do set /a "_tmt=(((1%%a*60)+1%%b)*60+1%%c)-366101"&set /a "_send=_secd-_tmt"
	goto :change
)
::Right movement [d]
if %_move% equ 4 (
	set "_lx=%_x%"
	set "%_x%-%_y%= "
	if not %_y% equ %/w% set /a "_y=%_y%+1"
	for %%z in (!_x!-!_y!) do if "!%%z!"=="%/bc%" (for %%a in (%/b%) do if "%%a"=="%%z" set "_y=%_y%") ELSE if "!%%z!"=="%/tc%" for %%b in (%/t%) do if "%%b"=="%%z" for %%1 in ("event:!_x!:!_y!") do (endlocal&set "_out=%%~1"&exit /b 2)
	if "%/f%"=="!_x!-!_y!" (endlocal&set "_out=finish"&exit /b 1)
	set "!_x!-!_y!=%/pc%"
	if %_time% neq 0 for /f "tokens=1-4 delims=:.," %%a in ("%time: =0%") do set /a "_tmt=(((1%%a*60)+1%%b)*60+1%%c)-366101"&set /a "_send=_secd-_tmt"
	goto :change
)