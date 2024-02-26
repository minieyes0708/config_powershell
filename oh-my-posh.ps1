function Random-Prompt {
    $files = (Get-ChildItem $env:DotConfig/oh-my-posh/themes)
    $index = Get-Random -Maximum ($files.Count)
    $env:OhMyPoshTheme = $files[$index - 1]
    oh-my-posh --init --shell pwsh --config $env:OhMyPoshTheme | Invoke-Expression
}
function Backup-OhMyPoshTheme {
    mv $env:OhMyPoshTheme $env:DotConfig/oh-my-posh/themes_backup/
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
    default
    {
        Random-Prompt
    }
}
