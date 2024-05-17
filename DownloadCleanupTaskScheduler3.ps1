# Get all user profiles
$userProfiles = Get-ChildItem 'C:\Users\' -Directory

# For each user profile
foreach ($userProfile in $userProfiles) {
    # Define the action to be performed by the scheduled task
    $action = New-ScheduledTaskAction -Execute 'cmd.exe' -Argument "/c forfiles /p $($userProfile.FullName)\Downloads /s /m *.* /d -7 /c `"cmd /c del @path`""

    # Define the trigger for the scheduled task (daily at 12:00 AM)
    $trigger = New-ScheduledTaskTrigger -Daily -At 12am

    # Define the settings for the scheduled task
    $settings = New-ScheduledTaskSettingsSet

    # Define the principal for the scheduled task (run with highest privileges)
    $principal = New-ScheduledTaskPrincipal -UserId "SYSTEM" -LogonType ServiceAccount -RunLevel Highest

    # Register the scheduled task
    Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "CleanDownloads_$($userProfile.Name)" -Description "Delete files in $($userProfile.Name)'s Downloads folder older than 14 days" -Settings $settings -Principal $principal
}