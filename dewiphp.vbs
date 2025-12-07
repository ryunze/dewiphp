' # Init Shell
Dim shell
Set shell = CreateObject("Wscript.Shell")

Dim APP_NAME : APP_NAME = "Dewiphp"
Dim PROTONSHELL_PATH : PROTONSHELL_PATH = ".core\protonshell\dewiphp-protonshell.exe"
Dim PHP_PATH : PHP_PATH = ".core\php\"
Dim PHP_NAME : PHP_NAME = "php-dewi.exe"
Dim PROJECT_PATH : PROJECT_PATH = ""

' # 1 : Development | 0 : Production
Dim ENV_DEBUG : ENV_DEBUG = 0

Randomize
APP_PORT = Int((49151 - 1024 + 1) * Rnd + 1024)

On Error Resume Next
shell.Run "taskkill /F /IM " & PHP_NAME, 1, True

shell.Run """" & PHP_PATH & PHP_NAME & """ -S localhost:" & APP_PORT & " -t app\" & PROJECT_PATH, ENV_DEBUG
shell.Run """" & PROTONSHELL_PATH & """" & " -a " & """" & "http:localhost:" & """" & APP_PORT & " -n " & """" & APP_NAME & """" & " -iw"