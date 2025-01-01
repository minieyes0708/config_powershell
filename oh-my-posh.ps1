function Set-RandomPrompt {
    $files = (Get-ChildItem $env:ProgramPath/oh-my-posh/themes)
    $index = Get-Random -Maximum ($files.Count)
    $env:OhMyPoshTheme = $files[$index - 1]
    oh-my-posh --init --shell pwsh --config $env:OhMyPoshTheme | Invoke-Expression

    $script:OhMyPoshPromptFunction = $Function:prompt
    $Function:prompt = {
        $p = $executionContext.SessionState.Path.CurrentLocation
        $osc7 = ""
        if ($p.Provider.Name -eq "FileSystem") {
            $ansi_escape = [char]27
            $provider_path = $p.ProviderPath -Replace "\\", "/"
            $osc7 = "$ansi_escape]7;file://${env:COMPUTERNAME}/${provider_path}${ansi_escape}\"
        }
        "${osc7}" + $(Invoke-Command -ScriptBlock $script:OhMyPoshPromptFunction)
    }
}
function Select-OhMyPoshTheme {
    $folder = "$($env:ProgramPath)/oh-my-posh/themes"
    $filenames = Get-ChildItem $folder | ForEach-Object { $_.Name }
    $env:OhMyPoshTheme = Join-Path $($folder) $($filenames | fzf)
    oh-my-posh --init --shell pwsh --config $env:OhMyPoshTheme | Invoke-Expression

    $script:OhMyPoshPromptFunction = $Function:prompt
    $Function:prompt = {
        $p = $executionContext.SessionState.Path.CurrentLocation
        $osc7 = ""
        if ($p.Provider.Name -eq "FileSystem") {
            $ansi_escape = [char]27
            $provider_path = $p.ProviderPath -Replace "\\", "/"
            $osc7 = "$ansi_escape]7;file://${env:COMPUTERNAME}/${provider_path}${ansi_escape}\"
        }
        "${osc7}" + $(Invoke-Command -ScriptBlock $script:OhMyPoshPromptFunction)
    }
}
function Move-OhMyPoshThemeToBackup {
    Move-Item $env:OhMyPoshTheme $env:ProgramPath/oh-my-posh/themes_backup/
}
function Remove-OhMyPoshTheme {
    Remove-Item $env:OhMyPoshTheme
}
