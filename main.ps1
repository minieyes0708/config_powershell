foreach ($file in Get-ChildItem $PSScriptRoot/*.ps1) {
    if (-not ($file.Name -eq 'main.ps1')) {
        Unblock-File -Path $file; . $file
    }
}
function Initialize-Modules {
    Set-RandomPrompt
    Initialize-PSReadLine
    Import-Module -Name Terminal-Icons
}