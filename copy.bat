@echo off

REM Get current date and time in a format suitable for a folder name
for /f "delims=" %%a in ('wmic OS Get localdatetime ^| find "."') do set datetime=%%a
set timestamp=%datetime:~0,4%%datetime:~4,2%%datetime:~6,2%_%datetime:~8,2%%datetime:~10,2%

REM Create a new folder with the timestamp
mkdir "D:\EMPIRE BACKUP\DATABASE BACKUP\data(%timestamp%)"

REM Copy the contents of C:\xampp\mysql\data to the new folder
robocopy C:\xampp\mysql\data "D:\EMPIRE BACKUP\DATABASE BACKUP\data(%timestamp%)" /E /MIR /IS

REM Compress the backup files using WinRAR
set "sourceFolder=D:\EMPIRE BACKUP\DATABASE BACKUP\data(%timestamp%)"
set "destinationZip=D:\EMPIRE BACKUP\DATABASE BACKUP\data(%timestamp%).rar"

pushd "%sourceFolder%"
"C:\Program Files\WinRAR\WinRAR.exe" a -r -m5 "%destinationZip%" *

REM Clean up: Change back to the original directory and delete the original folder after compression
popd
rmdir /s /q "%sourceFolder%"
