#Use to import in Script.
#Import-Module .\Modules\Uninstall-Program\Uninstall-Program
function Uninstall-Program {
    param(
        [array[]]$Uninstalls,
        [string]$logPath
        
    )

    foreach ($Entry in $Uninstalls) {
        $uninstallCommand = $Entry[0] #Path for varification
        $uninstallArgs = $Entry[1] #Install Command and argument

    #Run Start-Process with -Wait
        try {
            Start-Process $uninstallCommand $uninstallArgs -Wait

            #Write-Output $uninstallCommand #Test to confirm loop is correct
            #Write-Output $uninstallArgs #Test to confirm loop is correct

            $logMessage = "$(Get-Date -Format 'yyyy-MM-dd hh:mm:ss') - '$uninstallCommand' with '$uninstallArgs' Uninstall was attempted."
            Add-content -Path $logPath -Value $logMessage
        } catch {
            #Log the error and continue to the next iteration
            $errorMessage = "$(Get-Date -Format 'yyyy-MM-dd hh:mm:ss') - Uninstall issue with '$uninstallCommand' and '$uninstallArgs' - Error: $_"
            Add-Content -Path $logPath -Value $errorMessage
            continue
        }
    }
}