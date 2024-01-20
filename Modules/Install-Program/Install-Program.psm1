#Use to import in Script.
#Import-Module .\Modules\Install-Program\Install-Program
function Install-Program {
    param(
        [array[]]$Installs,
        [string]$logPath
        
    )

    foreach ($Entry in $Installs) {
        $installCommand = $Entry[0] #Path for varification
        $installArgs = $Entry[1] #Install Command and argument

    #Run Start-Process with -Wait
        try {
            Start-Process $installCommand $installArgs -Wait

            #Write-Output $installCommand #Test to confirm loop is correct
            #Write-Output $installArgs #Test to confirm loop is correct

            $logMessage = "$(Get-Date -Format 'yyyy-MM-dd hh:mm:ss') - '$installCommand' with '$installArgs' Install was attempted."
            Add-content -Path $logPath -Value $logMessage
        } catch {
            # Log the error and continue to the next iteration
            $errorMessage = "$(Get-Date -Format 'yyyy-MM-dd hh:mm:ss') - Install issue with '$installCommand' and '$installArgs' - Error: $_"
            Add-Content -Path $logPath -Value $errorMessage
            continue
        }
    }
}