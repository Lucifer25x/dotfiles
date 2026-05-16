@echo off
setlocal enabledelayedexpansion

REM ======================================
REM Basic Configuration
REM ======================================
set "DEST=D:\"

REM ======================================
REM Folder Pairs (source → destination)
REM ======================================
call :backup "C:\Users\lucifer25x\Documents\Backup"   "%DEST%\Backup"
call :backup "C:\Users\lucifer25x\Documents\Security" "%DEST%\Security"
call :backup "C:\Users\lucifer25x\Documents\Books"    "%DEST%\Books"
call :backup "C:\Users\lucifer25x\Music\Personal"     "%DEST%\Personal"
call :backup "C:\Users\lucifer25x\Documents\Obsidian" "%DEST%\Obsidian"
call :backup "C:\Users\lucifer25x\Pictures"           "%DEST%\Pictures"
call :backup "C:\Users\lucifer25x\Documents\UNEC"     "%DEST%\UNEC"

echo.
echo Backup finished.
pause
exit /b

REM ======================================
REM Subroutine: Copy only updated files
REM ======================================
:backup
set "SRC=%~1"
set "DST=%~2"

echo.
echo Checking "%SRC%" → "%DST%"
mkdir "%DST%" >nul 2>&1

REM /E  = copy subfolders
REM /XO = skip older destination files (only copy newer)
REM /FFT = fix timestamp precision
REM /R:2 /W:3 = retry twice, wait 3s
REM /NP = no progress
REM /TEE = show output
robocopy "%SRC%" "%DST%" /E /XO /FFT /R:2 /W:3 /NP /TEE

if !errorlevel! GEQ 8 (
    echo [ERROR] Something went wrong while copying "%SRC%"
) else (
    echo [OK] Backup complete for "%SRC%"
)
exit /b
