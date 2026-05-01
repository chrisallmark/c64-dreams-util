Set-StrictMode -Version Latest

$src = "C64 Dreams/C64 Dreams/Games"
$cjm = "THEC64-default.cjm"

if (-not (Test-Path $src -PathType Container)) {
    Write-Error "Source directory not found: $src"
    exit 1
}
if (-not (Test-Path $cjm -PathType Leaf)) {
    Write-Error "Joystick mapping file not found: $cjm"
    exit 1
}

$folder = ""
$folder_ext = 0
Get-ChildItem -Directory $src | ForEach-Object {
    $file = $_.Name
    if ($file.StartsWith("!")) { return }
    $firstChar = $file.Substring(0, 1)
    $letter = if ($firstChar -match '\d') { '#' } else { $firstChar.ToUpper() }
    if ($folder -ne $letter) {
        $count = 0
        $folder = $letter
    }
    $folder_ext = [math]::Floor($count / 256)
    $count++
    Write-Host "Processing: $file"
    $targetDir = "THEC64\$folder$($folder_ext)\$file"
    New-Item -ItemType Directory -Force -Path $targetDir | Out-Null
    Get-ChildItem -Path "$($_.FullName)\*" -Include *.d64, *.g64, *.d81, *.d82, *.crt, *.tap, *.t64, *.prg | ForEach-Object {
        Copy-Item -LiteralPath $_.FullName -Destination $targetDir
        Copy-Item $cjm -Destination $targetDir
    }
}
