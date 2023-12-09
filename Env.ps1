$OutputEncoding = [console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding($False)

$env:PATH = "${env:PATH};C:\Users\${env:USERNAME}\AppData\Local\Programs\oh-my-posh\bin\"
$env:PATH = "${env:PATH};D:\minieyes\software\nvim-win64\bin"
$env:PATH = "${env:PATH};C:\ProgramData\chocolatey\bin"
$env:PATH = "${env:PATH};C:\Program Files\CMake\bin"
$env:PATH = "${env:PATH};C:\Program Files\7-Zip"
$env:FZF_DEFAULT_OPTS = '--height=40% --reverse'
