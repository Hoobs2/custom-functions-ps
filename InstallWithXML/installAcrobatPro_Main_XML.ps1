Import-Module .\Modules\New-ITSLog\New-ITSLog #import NewITSLog Module
Import-Module .\Modules\Uninstall-Program\Uninstall-Program #import Uninstall-Program Module
#Import-Module .\Modules\Install-Program\Install-Program #import Install-Program Module

function Install-Program {
    param(
        $Install,
        $logPath
        
    )
    
    try {
        Start-Process $Install -Wait #Run Start-Process with -Wait

        #Write-Output $Install
        #Write-Output $installArgs #Test to confirm loop is correct

    } catch {
        # Log the error and continue to the next iteration
        $errorMessage = "$(Get-Date -Format 'yyyy-MM-dd hh:mm:ss') - Error: $_"
        Add-Content -Path $logPath -Value $errorMessage
        continue
    }
}

$configPath = "InstallWithXML\Config.xml"

$xmlLogObject = [xml](Get-Content -Path $configPath)

$logPath = $xmlLogObject.Configuration.Variables.Log.LogPath
$logFile = $xmlLogObject.Configuration.Variables.Log.LogFileName


$xmlObject = [xml](Get-Content -Path $configPath)
foreach ($item in $xmlObject.Configuration.Installs) {
    $Install = $item.install
    $Arguments = $item.args

    #Write-Output "$Install $Arguments"

    Install-Program -Install "$Install $Arguments" -logPath $logPath$logFile
    

}


New-ITSLog -logPath $logPath





