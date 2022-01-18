function Random-Prompt {
    $files = (Get-ChildItem ~/.config/oh-my-posh/themes)
    $index = Get-Random -Maximum ($files.Count)
    $env:OhMyPoshTheme = $files[$index - 1]
    oh-my-posh --init --shell pwsh --config $env:OhMyPoshTheme | Invoke-Expression
}
function Backup-OhMyPoshTheme {
    mv $env:OhMyPoshTheme ~/.config/oh-my-posh/themes_backup/
}
function Remove-OhMyPoshTheme {
    rm $env:OhMyPoshTheme
}
switch ("$env:COMPUTERNAME-$env:USERNAME")
{
    "MINIEYESNB1-怡哲"
    {
        # Random-Prompt
        # oh-my-posh fails on win8
    }
    "NVT02863_NB-NVT02863"
    {
        Random-Prompt
    }
    "MINIEYES-PC2-chenv"
    {
        Random-Prompt
    }
    default
    {
        throw No matching settings
    }
}
