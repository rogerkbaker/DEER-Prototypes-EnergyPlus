rem # Source - https://stackoverflow.com/a
rem # Posted by aschipfl, modified by community. See post 'Timeline' for change history
rem # Retrieved 2026-01-04, License - CC BY-SA 3.0

@echo off
rem setlocal enabledelayedexpansion

rem Set the root folder path
set "rootDir=."

rem Loop through each subfolder
for /r "%rootDir%" %%F in (*.idf) do (
rem Check if the current item is a file
if exist "%%F" (
rem Duplicate the file
copy "%%F" "%%~dpF%%~nF.pxt" > nul
echo Duplicate created: "%%~dpF%%~nF.pxt"
  )
)

