@echo off
goto:rem
***************************************
This file is part of RetroBat Scripts.
***************************************
:rem

taskkill /f /im emulationstation.exe>nul

:load_config
for /f "delims=" %%x in (..\system\retrobat.setup) do (set "%%x")
set appname=setup
set appbin=%appname%.bat
set apppath=%setup_dir%\%appbin%
:: set apparg=
goto check_setup

:check_setup
if exist %setup_dir%\%appbin% (
	goto runapp
) else (
	goto notfound
)

:runapp
cd ..
call %setup_dir%\%appbin%
goto exit

:notfound
echo %appbin% is missing. aborting.
timeout /t 3 >nul
goto exit

:exit
exit