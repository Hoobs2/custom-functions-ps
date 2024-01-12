Import-Module .\Test-ITSLog\Test-ITSLog

$value = Test-ITSLog
if ($value -eq 0) {
    Write-Output "0"
}
else {
    Write-Output "SAIDJUFGBJ"
}