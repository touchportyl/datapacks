@echo off

set "folder_to_zip=%~1"
if not exist "%folder_to_zip%" (
    echo Error: Folder not found.
    goto :eof
)

set "released_folder=%~dp0..\1. released"
if not exist "%released_folder%" (
    mkdir "%released_folder%"
)

set "zip_filename=%released_folder%\%~nx1.zip"

echo Zipping "%folder_to_zip%"...
"C:\Program Files\7-Zip\7z.exe" a -tzip "%zip_filename%" "%folder_to_zip%\*"
echo Done.
