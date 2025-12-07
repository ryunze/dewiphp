@echo off

set ROOT_PROJECT="app"
set PORT=%RANDOM%

start .core\php\php.exe -S localhost:%PORT% -t %ROOT_PROJECT%
cmd /d /c start "" /B ".core\protonshell\ProtonShell.exe" -a "http:/localhost:%PORT%" -n "Dewiphp" -iw"