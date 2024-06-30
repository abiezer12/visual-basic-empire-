@echo off
setlocal enabledelayedexpansion

set "timestamp=%date:/=-%_%time::=-%"
set "timestamp=!timestamp:.=-!"

set "backupFolder=D:\EMPIRE BACKUP\backup(empire record)"
set "mysqlBinPath=C:\xampp\mysql\bin"

%mysqlBinPath%\mysqldump -u root emp > "%backupFolder%\backup_%timestamp%.sql"

endlocal