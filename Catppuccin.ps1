function Initialize-Catppuccin {
    Import-Module Catppuccin
    $Flavor = $Catppuccin['Frappe']

    $env:FZF_DEFAULT_OPTS = @"
        --height=40% --reverse
        --color=bg+:$($Flavor.Surface0),bg:$($Flavor.Base),spinner:$($Flavor.Rosewater)
        --color=hl:$($Flavor.Red),fg:$($Flavor.Text),header:$($Flavor.Red)
        --color=info:$($Flavor.Mauve),pointer:$($Flavor.Rosewater),marker:$($Flavor.Rosewater)
        --color=fg+:$($Flavor.Text),prompt:$($Flavor.Mauve),hl+:$($Flavor.Red)
        --color=border:$($Flavor.Surface2)
"@
    $Colors = @{
        # Largely based on the Code Editor style guide
        # Emphasis, ListPrediction and ListPredictionSelected are inspired by the Catppuccin fzf theme

        # Powershell colours
        ContinuationPrompt     = $Flavor.Teal.Foreground()
        Emphasis               = $Flavor.Red.Foreground()
        Selection              = $Flavor.Surface0.Background()

        # PSReadLine prediction colours
        InlinePrediction       = $Flavor.Overlay0.Foreground()
        ListPrediction         = $Flavor.Mauve.Foreground()
        ListPredictionSelected = $Flavor.Surface0.Background()

        # Syntax highlighting
        Command                = $Flavor.Blue.Foreground()
        Comment                = $Flavor.Overlay0.Foreground()
        Default                = $Flavor.Text.Foreground()
        Error                  = $Flavor.Red.Foreground()
        Keyword                = $Flavor.Mauve.Foreground()
        Member                 = $Flavor.Rosewater.Foreground()
        Number                 = $Flavor.Peach.Foreground()
        Operator               = $Flavor.Sky.Foreground()
        Parameter              = $Flavor.Pink.Foreground()
        String                 = $Flavor.Green.Foreground()
        Type                   = $Flavor.Yellow.Foreground()
        Variable               = $Flavor.Lavender.Foreground()
    }
    # Set the colours
    Set-PSReadLineOption -Colors $Colors

    # The following colors are used by PowerShell's formatting
    # Again PS 7.2+ only
    $PSStyle.Formatting.Debug = $Flavor.Sky.Foreground()
    $PSStyle.Formatting.Error = $Flavor.Red.Foreground()
    $PSStyle.Formatting.ErrorAccent = $Flavor.Blue.Foreground()
    $PSStyle.Formatting.FormatAccent = $Flavor.Teal.Foreground()
    $PSStyle.Formatting.TableHeader = $Flavor.Rosewater.Foreground()
    $PSStyle.Formatting.Verbose = $Flavor.Yellow.Foreground()
    $PSStyle.Formatting.Warning = $Flavor.Peach.Foreground()
}