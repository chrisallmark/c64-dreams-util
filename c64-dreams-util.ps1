Set-StrictMode -Version Latest
$folder = ""
$folder_ext = 0
Get-ChildItem -Directory "C64 Dreams/C64 Dreams/Games" | ForEach-Object {
    $file = $_.Name
    $letter = $file.Substring(0, 1).ToUpper()
    if ($folder -ne $letter) {
        $count = 0
        $folder = $letter
    }
    $folder_ext = [math]::Floor($count / 256)
    $count++
    $targetDir = "THEC64\$folder$folder_ext\$file"
    New-Item -ItemType Directory -Force -Path $targetDir
    Get-ChildItem -Path "$($_.FullName)\*" -Include *.d64, *.g64, *.d81, *.d82, *.crt, *.tap, *.t64, *.prg | ForEach-Object {
        Copy-Item -LiteralPath $_.FullName -Destination $targetDir
        Copy-Item "THEC64-default.cjm" -Destination $targetDir
    }
}
