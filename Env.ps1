$OutputEncoding = [console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding($False)

$env:FZF_DEFAULT_OPTS = '--height=40% --reverse'
