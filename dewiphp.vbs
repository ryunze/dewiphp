' # Core Init
Dim shell
Set shell = CreateObject("Wscript.Shell")
Dim PROTONSHELL_PATH : PROTONSHELL_PATH = ".core\protonshell\dewiphp-protonshell.exe"
Dim PHP_PATH : PHP_PATH = ".core\php\"
Dim PHP_NAME : PHP_NAME = "php-dewi.exe"

' # App Init
Dim APP_NAME : APP_NAME = "Dewiphp"
Dim PROJECT_PATH : PROJECT_PATH = ""

' # 1 : Development | 0 : Production
Dim ENV_DEBUG : ENV_DEBUG = 0

' # Generate Random Port
Randomize
APP_PORT = Int((49151 - 1024 + 1) * Rnd + 1024)

' # Kill Exist before re-run the app
On Error Resume Next
shell.Run "taskkill /F /IM " & PHP_NAME, 1, True

' # Run core
shell.Run """" & PHP_PATH & PHP_NAME & """ -S localhost:" & APP_PORT & " -t app\" & PROJECT_PATH, ENV_DEBUG
shell.Run """" & PROTONSHELL_PATH & """" & " -a " & """" & "http:localhost:" & """" & APP_PORT & " -n " & """" & APP_NAME & """" & " -iw"