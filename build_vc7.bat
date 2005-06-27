echo off
set COMMAND=%1
if "%1" == "" set COMMAND=build
if "%2" == "" set PROFILE=Release

devenv quickfix.sln /%COMMAND% %PROFILE%
if ERRORLEVEL 1 goto quit
devenv quickfix_jni.sln /%COMMAND% %PROFILE%
if ERRORLEVEL 1 goto quit
pushd examples
devenv examples.sln /%COMMAND% %PROFILE%
popd
if ERRORLEVEL 1 goto quit
:quit