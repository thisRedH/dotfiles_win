@echo off

if not "%~1" == "" set LINK="%~1" & GOTO GIT

echo Command: git clone --recursive {LINK}
echo. && echo Download dir: %CD% && echo.
set /p LINK="Git Repo Link: " && echo.

:GIT
git clone --recursive %LINK%

:EXIT
echo Fin
exit /b 0
