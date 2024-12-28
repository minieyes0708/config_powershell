$more_paths = (
    'C:\Program Files\7-Zip',
    ''
)
$original_paths = $env:PATH -split ';'

foreach ($path in $more_paths) {
    if ($path -and $original_paths -notcontains $path) {
        $original_paths += $path
    }
}
$env:PATH = $original_paths -join ';'