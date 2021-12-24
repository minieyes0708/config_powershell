function Random-Prompt {
    $files = (Get-ChildItem ~/.config/oh-my-posh/themes)
    $index = Get-Random -Maximum ($files.Count)
    $env:OhMyPoshTheme = $files[$index - 1]
    oh-my-posh --init --shell pwsh --config $env:OhMyPoshTheme | Invoke-Expression
}
function Remove-OhMyPoshTheme {
    rm $env:OhMyPoshTheme
}
Random-Prompt
