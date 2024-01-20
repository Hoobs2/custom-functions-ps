#Use to import in Script.
#Import-Module .\Modules\New-ITSLog\New-ITSLog
function New-ITSLog {
    param (
        [string]$logPath
    
    )
    if (!(Test-Path $logPath)) {
        New-Item -ItemType Directory -Path $logPath -Force
    }
}