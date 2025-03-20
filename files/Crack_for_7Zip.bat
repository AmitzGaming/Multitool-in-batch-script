@echo off

chcp 65001 >nul
color a

title Zip Cracker for 7-Zip - By Amitz Gaming

if not exist "C:\Program Files\7-zip" (
 echo 7-zip not installed!
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
if not exist "%wordlist%" (                                
 echo wordlist not found!
	pause
	exit
)

for /f %%a in (%wordlist%) do (
    set pass=%%a 
    call :attempt
)
echo shitt nothing pass cracking failed
pause
exit

:attempt
"C:\Program Files\7-zip\7zFM.exe" x -p%pass% "%archive%" -o"cracked" -y >nul 2>&1
echo attempt cracking... %pass%
if /I %errorlevel% EQU 0 (
    echo Password Found: %pass%
	pause
	exit
)