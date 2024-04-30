@echo off
chcp 65001 

if "%~1" == "/help" goto help & Exit /B 0

set arg=
set attr=

set temp0=%~dp0
set temp1=%1

if "%temp1%"=="" goto withoutPath
if %temp0%==%temp1% goto withoutPath

if not x%temp1:\=%==x%temp1% (goto withPath) else (goto withoutPath)

:help
echo Usage patterns:([] - obligatory argument, {} - not obligatory) 
echo {Path} {hidden} {read-only} {archive}
echo.
echo Parameters:
echo   hidden - count hidden files.
echo   read-only - count read-only files.
echo   archive - count archive files.
shift
goto end2

:withPath
set folderpath=%~f1
:withPathLoop
if "%2" == "" goto end
set arg=%arg%%2
shift
goto withPathLoop

:withoutPath
set /P folderpath="Enter the path: "
if "%folderpath%" == "" set folderpath="C:\Lab3"
:withoutPathLoop
if "%1" == "" goto end
set arg=%arg%%1
shift
goto withoutPathLoop

:end
if "%arg%" == "" goto skip
if not x%arg:hidden=%==x%arg% set attr=%attr%:h
if not x%arg:archive=%==x%arg% set attr=%attr%:a
if not x%arg:read-only=%==x%arg% set attr=%attr%:r
:skip

dir /a%attr% %folderpath%
:end2
echo %ErrorLevel%
pause