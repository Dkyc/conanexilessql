@echo off
::
::DONT TOUCH THESE DATE SETTINGS
For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set todaydate=%%c%%a%%b)
::
cd C:\CEAutoScript\bin
echo "Starting Wipe Script %backupdate%"
echo "Starting Download"
call C:\CEAutoScript\EDIT_THESE\get_files.bat
echo "Completed Download"
echo "Checking Consistency and Shrinking to One File"
call CheckGameDB.bat
echo "Consistency Check Complete"
echo "Making backup to gamedb_backup folder"
copy C:\CEAutoScript\bin\game.db C:\CEAutoScript\gamedb_backup\game_prewipe_%todaydate%.db
echo "game.db backup complete"
echo "Wiping Server"
call ServerCleanup.bat
echo "Wipe Complete"
echo "Uploading game.db"
call C:\CEAutoScript\EDIT_THESE\send_files.bat
echo "Completed Sending"
echo "DONE"
pause
exit