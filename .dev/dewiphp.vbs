' # Init Shell
Dim shell
Set shell = CreateObject("Wscript.Shell")

Dim APP_NAME : APP_NAME = "Dewiphp"
Dim PROTONSHELL_PATH : PROTONSHELL_PATH = ".core\protonshell\ProtonShell.exe"
Dim PHP_PATH : PHP_PATH = ".core\php\"
Dim PHP_NAME : PHP_NAME = "php-dewi.exe"

' # 1 : Development | 0 : Production
Dim ENV_DEBUG : ENV_DEBUG = 0

Randomize
APP_PORT = Int((49151 - 1024 + 1) * Rnd + 1024)

On Error Resume Next
shell.Run "taskkill /F /IM " & PHP_NAME, 1, True

shell.Run """" & PHP_PATH & PHP_NAME & """ -S localhost:" & APP_PORT, ENV_DEBUG
shell.Run """" & PROTONSHELL_PATH & """" & " -a " & """" & "http:localhost:" & """" & APP_PORT & " -n " & """" & APP_NAME & """" & " -iw"