@echo off

title GUIs For Custom Things

:menu
echo.
echo 1) Notify
echo 2) Box
echo 3) Age
echo 4) Haha
echo 5) Hacked
set /p input=">>"
if %input% EQU 1 goto noti
if %input% EQU 2 goto box
if %input% EQU 3 goto name
if %input% EQU 4 goto Haha
if %input% EQU 5 goto Hacked

:Haha
cls
powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; $mainForm = New-Object System.Windows.Forms.Form; $mainForm.Text = 'Main Window'; $lbl = New-Object System.Windows.Forms.Label; $lbl.Text = 'You got Scammed'; $mainForm.Controls.Add($lbl); $mainForm.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterScreen; $mainForm.ShowDialog()}"
cls
goto menu

:box
cls
powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Upgrading Windows 10 to Windows 11 !', 'Windows', 'OK', [System.Windows.Forms.MessageBoxIcon]::Information);}" 
cls
goto menu

:noti
cls
powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; Add-Type -AssemblyName System.Drawing; $notify = New-Object System.Windows.Forms.NotifyIcon; $notify.Icon = [System.Drawing.SystemIcons]::Information; $notify.Visible = $true; $notify.ShowBalloonTip(0, '66 Trojens Has Been Found', 'Trojens Has Been Destroying Your PC.', [System.Windows.Forms.ToolTipIcon]::none)}" "
cls
goto menu

:name
cls 
powershell -Command "& {Add-Type -AssemblyName Microsoft.VisualBasic; [Microsoft.VisualBasic.Interaction]::InputBox('Enter your AGE:', 'Age Definer')}" > %TEMP%\out.tmp
set /p OUT=<%TEMP%\out.tmp
set msgBoxArgs="& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Your Age is: %OUT%', 'You Got Scammed');}"
powershell -Command %msgBoxArgs%
cls
goto menu

:Hacked
cls
powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Upgrading Windows 10 to Windows 11 !', 'Windows', 'OK', [System.Windows.Forms.MessageBoxIcon]::Information);}" 
cls
powershell -Command "& {Add-Type -AssemblyName Microsoft.VisualBasic; [Microsoft.VisualBasic.Interaction]::InputBox('Enter your AGE:', 'Age Definer')}" > %TEMP%\out.tmp
set /p OUT=<%TEMP%\out.tmp
set msgBoxArgs="& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Your Age is: %OUT%', 'You Got Scammed');}"
powershell -Command %msgBoxArgs%
cls
powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; Add-Type -AssemblyName System.Drawing; $notify = New-Object System.Windows.Forms.NotifyIcon; $notify.Icon = [System.Drawing.SystemIcons]::Information; $notify.Visible = $true; $notify.ShowBalloonTip(0, '66 Trojens Has Been Found', 'Trojens Has Been Destroying Your PC.', [System.Windows.Forms.ToolTipIcon]::none)}" "
cls
powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; Add-Type -AssemblyName System.Drawing; $notify = New-Object System.Windows.Forms.NotifyIcon; $notify.Icon = [System.Drawing.SystemIcons]::Information; $notify.Visible = $true; $notify.ShowBalloonTip(0, '66 Trojens Has Been Found', 'Trojens Has Been Destroying Your PC.', [System.Windows.Forms.ToolTipIcon]::none)}" "
cls
powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; $mainForm = New-Object System.Windows.Forms.Form; $mainForm.Text = 'Main Window'; $lbl = New-Object System.Windows.Forms.Label; $lbl.Text = 'You got Hacked'; $mainForm.Controls.Add($lbl); $mainForm.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterScreen; $mainForm.ShowDialog()}"
cls
powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Upgrading Windows 10 to Windows 11 !', 'Windows', 'OK', [System.Windows.Forms.MessageBoxIcon]::Information);}" 
cls
goto menu

