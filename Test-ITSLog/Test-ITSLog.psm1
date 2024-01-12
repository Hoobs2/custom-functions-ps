#Use to import in Script.
#Import-Module .\Test-ITSLog\Test-ITSLog
function Test-ITSLog {
    param ()

    Test-Path -Path "C:\itslog\Intune" -PathType Container || New-Item -ItemType Directory -Path "C:\itslog\Intune" -Force
}
