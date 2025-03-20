@echo off

echo.
title CALCULATOR - Amitz Gaming
color a
:op
set /p o=Operation:
if %o%==r/ goto sbc
if %o%==add goto ad
if %o%==sub goto sb
if %o%==mul goto ml
if %o%==bye exit
if %o%==div goto dv
if %o%==h/ goto his
if %o%==h? goto help
if %o%==c/ cls
if %o%==dm/ goto dark
if %o%==dwm/ goto def
if %o%==wm/ goto light
if %o%==i? goto inst
if %o%==A goto Ap
goto op
:dark
color 0f
goto op
:light
color f0
goto op
:def
color 1f
goto op
:sbc
cls
color 1f
echo SBC is a simple functionable calculator made by batch commands:
echo.
echo type i? for instructions;
echo type h? for help;
echo.
goto op
:inst
echo.
echo type add for addtion;
echo type sub for subtraction;
echo type mul for multiplication;
echo type div for division;
echo.
goto op 
:help
echo type h/ to see history
echo type c/ to clear screen
echo type restart to restart sbc
echo type dm/ for dark mode
echo type wm/ for light mode
echo type dwm/ for default mode
echo type bye to exit SBC
goto op
:his
doskey /history
goto op
:ad
set /p a=Number:
set /p b=Number:
set /a n1=%a%+%b%
echo Ans: %n1%
goto op
:sb
set /p a=Number:
set /p b=Number:
set /a n2=%a%-%b%
echo Ans: %n2%
goto op
:ml
set /p a=Number:
set /p b=Number:
set /a n3=%a%*%b%
echo Ans: %n3%
goto op
:dv
set /p a=Number:
set /p b=Number:
set /a n4=%a%/%b%
echo Ans: %n4%
goto op

:Ap
echo Help Tab
echo type add for addtion;
echo type sub for subtraction;
echo type mul for multiplication;
echo type div for division;
echo type h/ for History;
echo r/ goto sbc
echo add goto ad
echo sub goto sb
echo mul goto ml
