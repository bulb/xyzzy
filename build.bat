@echo off

setlocal
call "%VS100COMNTOOLS%\vsvars32.bat"

if "%1"=="" (set CONFIGURATION=Release) else (set CONFIGURATION=%1)
if "%2"=="" (set TARGET=Build) else (set TARGET=%2)
if "%3"=="" (set VERBOSITY=normal) else (set VERBOSITY=%3)

echo Build xyzzy...
msbuild xyzzy.sln /nologo /p:Configuration=%CONFIGURATION% /target:%TARGET% /verbosity:%VERBOSITY% || exit /b 1
