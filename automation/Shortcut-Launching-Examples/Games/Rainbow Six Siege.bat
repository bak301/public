@echo off
REM -------------------------------------------------------------------------------------
REM If you are using the "while media is playing, show" rule, please change RULE=media
REM otherwise place keep it at always
set RULE=always
REM -------------------------------------------------------------------------------------

IF %RULE% == always (goto saveall)
IF %RULE% == media (goto savestatic)

:SAVEALL
FOR /F "skip=2 tokens=2,*" %%A IN ('reg query "HKEY_CURRENT_USER\SOFTWARE\WhirlwindFX\SignalRgb\effects\selected" /v "always"') DO set "CurrentEffect=%%B" > nul 2> nul
goto layoutsave

:SAVESTATIC
FOR /F "skip=2 tokens=2,*" %%A IN ('reg query "HKEY_CURRENT_USER\SOFTWARE\WhirlwindFX\SignalRgb\effects\selected" /v "dynamic"') DO set "CurrentEffect=%%B" > nul 2> nul
goto layoutsave

:LAYOUTSAVE
FOR /F "skip=2 tokens=2,*" %%A IN ('reg query "HKEY_CURRENT_USER\SOFTWARE\WhirlwindFX\SignalRgb\layouts" /v "always"') DO set "CurrentLayout=%%B" > nul 2> nul
goto GameLaunch

:GAMELAUNCH
REM -------------------------------------------------------------------------------------
REM You will need to set the layout you have created for Rainbow Six: Siege (Or a generic Game layout)
REM -------------------------------------------------------------------------------------

explorer "signalrgb://layout/apply/Rainbow%%20Six%%20Siege?-silentlaunch-"

REM -------------------------------------------------------------------------------------

REM
REM
REM Do not edit anything below
REM
REM
timeout 2 > nul 2> nul
explorer "signalrgb://effect/apply/Rainbow%%20Six:%%20Siege?-silentlaunch-"
explorer steam://run/359550
echo Press any key to return to previous effects
pause > nul 2> nul
explorer "signalrgb://layout/apply/%CurrentLayout%?-silentlaunch-"
timeout 2 > nul 2> nul
explorer "signalrgb://effect/apply/%CurrentEffect%?-silentlaunch-" 