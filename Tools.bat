@Echo off
cls

Title Tools Menu - Amitz Gaming
Set "Path=%Path%;%cd%;%cd%\files"
Color 0a
Mode 80,28

:Main
Cls
Echo.
Echo.Select the Menu-options (you can use KEYBOARD or MOUSE)
echo Made By Amitz Gaming
Echo.
echo -----------------------------------------------------------------------
echo -----------------------------------------------------------------------
CmdMenuSel 0AA0 "(01).WinRar" "(02).Zip file cracker for WinRar" "(03).GUIs" "(04).Password Generator" "(05).Web Ping" "(06).Colour" "(07).Custom Cmd" "(08).Zip file cracker for 7zip" "(09).Fake message of Hacker" "(10).Calculator" "(11).Snake Game in batch" "(12).Tic Tac Toe in batch" "(13).Critical Error" "(14).Maze Game in Batch" "(15).CmdRunner Game" "(16).Private Folder" "(17).Check Specification" "(18).Credits" "(19).Exit"
If /i "%Errorlevel%" == "1" start WinRar.exe
If /i "%Errorlevel%" == "2" start zip_cracker_for_winrar.bat
If /i "%Errorlevel%" == "3" start GUIs.bat
If /i "%Errorlevel%" == "4" start Password_Generator.bat
If /i "%Errorlevel%" == "5" start Web_ping.bat
If /i "%Errorlevel%" == "6" start colour.bat
If /i "%Errorlevel%" == "7" start Custom_CMD.bat
If /i "%Errorlevel%" == "8" start crack_for_7zip.bat
If /i "%Errorlevel%" == "9" start fakevirus.vbs
If /i "%Errorlevel%" == "10" start calc.bat
If /i "%Errorlevel%" == "11" start snake.bat
If /i "%Errorlevel%" == "12" start tic_tac_toe.bat
If /i "%Errorlevel%" == "13" start critical_error.vbs
If /i "%Errorlevel%" == "14" start mazeg.bat
If /i "%Errorlevel%" == "15" start 1cmdrunner1.lnk
If /i "%Errorlevel%" == "16" start Privatefolder.bat
If /i "%Errorlevel%" == "17" start specs.bat
If /i "%Errorlevel%" == "18" goto credits
If /i "%Errorlevel%" == "19" exit
Cls
timeout /t 1 >nul
Goto :Main


:credits 
cls
echo.
echo.Credits
echo.
echo Menu created by :Judago
echo Tool is created by : Amitz Gaming
echo.
echo.
pause >nul
cls
goto Main