@echo off
echo "Download ELVUI zip"
powershell.exe -nologo -noprofile -command "Invoke-WebRequest http://git.tukui.org/Elv/elvui/repository/archive.zip?ref=master -OutFile elvuitemp.zip"
echo "Unzip the file"
powershell.exe -nologo -noprofile -command "& { Add-Type -A 'System.IO.Compression.FileSystem'; [IO.Compression.ZipFile]::ExtractToDirectory('elvuitemp.zip', 'elvuitempfolder'); }"
echo "Move files"
powershell.exe -nologo -noprofile -command "Copy-Item elvuitempfolder/*/Elv* ./ -force -recurse"
echo "Delete temp files"
rmdir /S /Q elvuitempfolder
del /Q elvuitemp.zip