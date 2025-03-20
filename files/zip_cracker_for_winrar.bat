@echo off

chcp 65001 >nul
color a

title Zip Cracker for WinRAR - By Amitz Gaming

if not exist "C:\Program Files\WinRAR" (
 echo WinRAR not installed!
	pause
	exit
)

set /p archive="Enter archive:"
if not exist "%archive%" (
 echo Archive not found!
	pause
	exit
)

set /p wordlist="Enter wordlist:"
if not exist "%wordlist%," (                                
 echo wordlist not found!
	pause
	exit
)

for /f %%a in (%wordlist%) do (
    set pass=%%a
    call :attempt
)
echo  Cracking Failed! 
pause
exit

:attempt
"C:\Program Files\WinRAR\WinRAR.exe" x -p%pass% "%archive%" -o"cracked" -y >nul 2>&1
echo attempt cracking... %pass%  
if /I %errorlevel% EQU 0 (
    echo Password Found: %pass%
	pause
	exit
)