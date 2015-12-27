@echo off
echo Info: loading aliases
macros.bat
echo Info: injecting clink
"C:\Program Files (x86)\clink\0.4.5\clink" inject --profile "~\clink"
cls
