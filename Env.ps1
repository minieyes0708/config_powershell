$OutputEncoding = [console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding($False)

$env:PATH = "${env:PATH};C:\Users\${env:USERNAME}\AppData\Local\Programs\oh-my-posh\bin\"
$env:PATH = "${env:PATH};C:\msys64\usr\bin\"
$env:FZF_DEFAULT_OPTS = '--height=40% --reverse'
