$more_paths = (
    'C:\Program Files\7-Zip',
    'D:\minieyes\software\nvim-win64\bin',
    'C:\Users\chenv\AppData\Local\Programs\Python\Python310',
    ''
)
$original_paths = $env:PATH -split ';'

foreach ($path in $more_paths) {
    if ($path -and $original_paths -notcontains $path) {
        $original_paths += $path
    }
}
$env:PATH = $original_paths -join ';'
