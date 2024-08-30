function Initialize-PsFZF {
    $env:FZF_ALT_C_COMMAND='fd -t d'

    Import-Module PSFzf
    Set-PsFzfOption -TabExpansion
    Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'
}
