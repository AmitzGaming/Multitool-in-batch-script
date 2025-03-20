@echo off
title Private Folder
if EXIST "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B303090}" goto UNLOCK
if not EXIST Private goto MDLOCKER
:CONFIRM
echo Are you sure you  want to lock the folder(Y/N)
set/p "Cho=>"
if %Cho% EQU Y goto LOCK
if %Cho% EQU y goto LOCK
if %Cho% EQU N goto END
if %Cho% EQU n goto END
echo Invalid choice.
goto CONFIRM
:LOCK
ren Private "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B303090}"
attrib +h +s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B303090}"
echo Folder Locked
goto End
:UNLOCK
echo Enter password to Unlock folder
set/p "pass=>"
if NOT %pass% EQU Amitz_Gaming goto FAIL
attrib -h -s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B303090}"
ren "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B303090}" Private
echo Folder Unlocked Successfully
goto End
:FAIL
echo Invalid password
goto end 
:MDLOCKER
md Private
echo Private Created Successfully
goto End
:End
exit
