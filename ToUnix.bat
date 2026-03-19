@echo off
####### Remove the # From the line you want to use, # indicates a comment #######
"C:\\Program Files\\Git\\usr\\bin\\dos2unix.exe" "%1" # If Git is installed
# "C:\\tools\\bin\\crlf\\dos2unix.exe" "%1" # Installed manually from https://dos2unix.sourceforge.io/ Sample is C:\tools\crlf
# pause # optional: keeps window open after convert
