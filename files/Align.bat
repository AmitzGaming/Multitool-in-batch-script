@echo off
::Align.bat
::Created by Sounak@9434
::Seperate help file included to keep the size low and to make loading faster
::Separate non-commented .bat file included to use in scripts for faster loading
::Show help check
if "%~1"=="" if exist align-help.txt (type align-help.txt&exit /b) ELSE (echo Help.txt not found&exit /b)
if "%~1"=="/?" if exist align-help.txt (type align-help.txt&exit /b) ELSE (echo Help.txt not found&exit /b)
::Line reset check
if "%~1"=="/s" set "_line="&exit /b
::Getting Data
set "_align=%~1"
set "_text=%~2"
if not "%~3"=="" set "_var=%~3"
::Getting window length if not defined
if not defined _line for /f "skip=4 tokens=2" %%a in ('mode con') do set "_line=%%a"&goto :next
:next
::Getting string length
setlocal enabledelayedexpansion
set "s=A!_text!"
set "_len=0"
for %%P in (4096 2048 1024 512 256 128 64 32 16 8 4 2 1) do (
	if "!s:~%%P,1!" neq "" (
		set /a "_len+=%%P"
		set "s=!s:~%%P!"
	)
)
::Variable define
if "%_align%"=="/m" (set "_a=2") ELSE set "_a=1"&set /a "_len+=1"
::Setting up spaces
for /l %%a in (%_len%,%_a%,%_line%) do set "_bsp=!_bsp! "
::Printing aligned text or setting it to a variable for further use
if not defined _var (endlocal&echo(%_bsp%%_text%) ELSE (endlocal&set %_var%=%_bsp%%_text%)
exit /b