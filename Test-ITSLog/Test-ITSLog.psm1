#Use to import in Script.
#Import-Module .\Test-ITSLog\Test-ITSLog
function New-ITSLog {
    param (
        [string]$logPath
    
    )
    if (!(Test-Path $logPath)) {
        New-Item -ItemType Directory -Path $logPath -Force
    }
}