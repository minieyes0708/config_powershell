function Set-RandomPrompt {
    $files = (Get-ChildItem $env:ProgramPath/oh-my-posh/themes)
    $index = Get-Random -Maximum ($files.Count)
    $env:OhMyPoshTheme = $files[$index - 1]
    oh-my-posh --init --shell pwsh --config $env:OhMyPoshTheme | Invoke-Expression
}
function Select-OhMyPoshTheme {
    $folder = "$($env:ProgramPath)/oh-my-posh/themes"
    $filenames = Get-ChildItem $folder | ForEach-Object { $_.Name }
    $env:OhMyPoshTheme = Join-Path $($folder) $($filenames | fzf)
    oh-my-posh --init --shell pwsh --config $env:OhMyPoshTheme | Invoke-Expression
}
function Move-OhMyPoshThemeToBackup {
    Move-Item $env:OhMyPoshTheme $env:ProgramPath/oh-my-posh/themes_backup/
}
function Remove-OhMyPoshTheme {
    Remove-Item $env:OhMyPoshTheme
}