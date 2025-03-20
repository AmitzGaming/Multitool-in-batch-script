@echo off
color 0a
mode 67,20
title Specification Checker

:start
echo Cheking Computer Specs .
ping localhost -n 1 >nul
cls
echo Cheking Computer Specs ..
ping localhost -n 1 >nul
cls
echo Cheking Computer Specs ...
ping localhost -n 1 >nul
cls
echo Cheking Computer Specs .
ping localhost -n 1 >nul
cls
echo Cheking Computer Specs ..
ping localhost -n 1 >nul
cls
echo Cheking Computer Specs ...
ping localhost -n 1 >nul
cls
echo Cheking Computer Specs .
ping localhost -n 1 >nul
cls
echo Cheking Computer Specs ..
ping localhost -n 1 >nul
cls
echo Cheking Computer Specs ...
ping localhost -n 1 >nul
cls
echo Cheking Computer Specs .
ping localhost -n 1 >nul
cls
echo Cheking Computer Specs ..
ping localhost -n 1 >nul
cls
echo Cheking Computer Specs ...
ping localhost -n 1 >nul
cls
echo Cheking Computer Specs .
ping localhost -n 1 >nul
cls
echo Cheking Computer Specs ..
ping localhost -n 1 >nul
cls
echo Cheking Computer Specs ....
ping localhost -n 1 >nul
cls
echo Cheking Computer Specs .
ping localhost -n 1 >nul
cls
echo Cheking Computer Specs ..
ping localhost -n 1 >nul
cls
echo Cheking Computer Specs ...
ping localhost -n 1 >nul
cls
echo Cheking Computer Specs .
ping localhost -n 1 >nul
cls
echo Cheking Computer Specs ..
ping localhost -n 1 >nul
cls
echo Cheking Computer Specs ...
ping localhost -n 1 >nul
cls
echo Cheking Computer Specs .
ping localhost -n 1 >nul
cls
echo Cheking Computer Specs ..
ping localhost -n 1 >nul
cls
echo Cheking Computer Specs ...
ping localhost -n 1 >nul
cls
echo Cheking Computer Specs .
ping localhost -n 1 >nul
cls
echo Cheking Computer Specs ..
ping localhost -n 1 >nul
cls
echo Cheking Computer Specs ...
ping localhost -n 1 >nul
cls
echo Cheking Computer Specs .
ping localhost -n 1 >nul
cls
echo Cheking Computer Specs ..
ping localhost -n 1 >nul
cls
echo Cheking Computer Specs ....
ping localhost -n 1 >nul
cls
echo Cheking Computer Specs .
ping localhost -n 1 >nul
cls
echo Cheking Computer Specs ..
ping localhost -n 1 >nul
cls
echo Cheking Computer Specs ...
ping localhost -n 1 >nul
cls
echo Cheking Computer Specs .
ping localhost -n 1 >nul
cls
echo Cheking Computer Specs ..
ping localhost -n 1 >nul
cls
echo Cheking Computer Specs ...
ping localhost -n 1 >nul
cls
echo Cheking Computer Specs .
ping localhost -n 1 >nul
cls
echo Cheking Computer Specs ..
ping localhost -n 1 >nul
cls
echo Cheking Computer Specs ...
ping localhost -n 1 >nul
cls
echo Cheking Computer Specs .
ping localhost -n 1 >nul
cls
echo Cheking Computer Specs ..
ping localhost -n 1 >nul
cls
echo Cheking Computer Specs ...
ping localhost -n 1 >nul
cls
echo Cheking Computer Specs .
ping localhost -n 1 >nul
cls
echo Cheking Computer Specs ..
ping localhost -n 1 >nul
cls
echo Cheking Computer Specs ....
ping localhost -n 1 >nul
cls
echo Cheking Computer Specs .
ping localhost -n 1 >nul
cls
echo Cheking Computer Specs ..
ping localhost -n 1 >nul
cls
echo Cheking Computer Specs ...
ping localhost -n 1 >nul
cls
echo Cheking Computer Specs .
ping localhost -n 1 >nul
cls
echo Cheking Computer Specs ..
ping localhost -n 1 >nul
cls
echo Cheking Computer Specs ...
ping localhost -n 1 >nul
cls
echo Cheking Computer Specs .
ping localhost -n 1 >nul
cls
echo Cheking Computer Specs ..
ping localhost -n 1 >nul
cls
echo Cheking Computer Specs ...
ping localhost -n 1 >nul
cls
echo Cheking Computer Specs .
ping localhost -n 1 >nul
cls
echo Cheking Computer Specs ..
ping localhost -n 1 >nul
cls
echo Cheking Computer Specs ...
ping localhost -n 1 >nul
cls
echo Cheking Computer Specs .
ping localhost -n 1 >nul
cls
echo Cheking Computer Specs ..
ping localhost -n 1 >nul
cls
echo Cheking Computer Specs ....
ping localhost -n 1 >nul
cls
echo.                     Computer Specification 
echo.
echo.
ping localhost -n 3 >nul
echo Running On   : %Os%
:: OS Information
for /f "tokens=2 delims==" %%A in ('wmic os get caption /value') do set OS=%%A
for /f "tokens=2 delims==" %%A in ('wmic os get version /value') do set Version=%%A
echo OS Info      : %OS% (Version: %Version%)
ping localhost -n 2 >nul
echo Computer Name: %computername%
ping localhost -n 2 >nul
echo UserFolder   : %UserName%
ping localhost -n 2 >nul
echo Processor    : %Processor_Identifier%
ping localhost -n 2 >nul
echo Architecture : %Processor_Architecture%
ping localhost -n 2 >nul
echo Cores        : %Number_Of_Processors%
ping localhost -n 2 >nul
echo Level        : %Processor_Level%
ping localhost -n 2 >nul
echo Revision     : %Processor_Revision%
ping localhost -n 2 >nul
:: CPU Information
for /f "tokens=2 delims==" %%A in ('wmic cpu get name /value') do set CPU=%%A
for /f "tokens=2 delims==" %%A in ('wmic cpu get numberofcores /value') do set Cores=%%A
for /f "tokens=2 delims==" %%A in ('wmic cpu get maxclockspeed /value') do set Speed=%%A
echo Processor    : %CPU%
ping localhost -n 2 >nul
echo Cores        : %Cores%
ping localhost -n 2 >nul
echo Clock Speed  : %Speed% MHz
ping localhost -n 2 >nul
:: RAM Information
for /f "tokens=2 delims==" %%A in ('wmic computersystem get totalphysicalmemory /value') do set RAM=%%A
set /a RAM_MB=%RAM:~0,-6%
echo Total RAM    : %RAM_MB% MB
ping localhost -n 2 >nul
:: GPU Information
for /f "tokens=2 delims==" %%A in ('wmic path win32_videocontroller get caption /value') do set GPU=%%A
echo Graphics Card: %GPU%
ping localhost -n 2 >nul
:: Disk Information
for /f "tokens=2 delims==" %%A in ('wmic diskdrive get size /value') do set DISK=%%A
set /a DISK_GB=%DISK:~0,-9%
echo Disk Size    : %DISK_GB% GB
ping localhost -n 2 >nul
pause >nul
exit