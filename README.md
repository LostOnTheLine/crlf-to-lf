# CRLF-to-LF
A simple right-click option to convert Text files created in Windows with `CRLF` line endings to standard Unix/Linux/Script-Friendly `LF` line endings

NOTE: `.reg` file needs to be on a system drive not network drive, (C:\ drive always works) to run.

WARNING: It's a simple Registry file, but always read a `.reg` before running, modifying the registry is always something to be careful with as it can cause issues if not done correctly, never trust registry edits unless you have a basic idea of what the entries are doing

## This is a simple script to allow line-ending conversion via right-click

### Script to convert `CRLF` <small><small>(Windows Default)</small></small> text files to `LF` <small><small>(Standard Universal formats works on all modern systems including Windows)</small></small>

1. Create a directory to house the script. This should, ideally, contain no spaces. I prefer using `C:\tools` for user tools
   - For this example I will use `C:\tools\crlf`
2. Create a Windows Batch Script `.bat` file named `ToUnix.bat` (You can use your own name if you prefer)
3. This script will be very short, it starts with `@echo off` to make it not print commands while running, then runs the `dos2unix` command
   - `dos2unix` is included with `git` so if you have `git` installed it should work with the provided default, if not you can install it via [dos2unix Sourceforge](https://dos2unix.sourceforge.io/) & place the `bin` folder in your `crlf` directory (`C:\tools\crlf\bin`)
```bat
@echo off
"C:\\Program Files\\Git\\usr\\bin\\dos2unix.exe" "%1" # If Git installed
# "C:\\tools\\crlf\\bin\\dos2unix.exe" "%1" # Installed manually
# pause
```
4. Ideally use double `\\` in your path names, sometimes things called via the system won't work with single `\` but they ALWAYS work with double `\\`
5. "Quote" your path, this is not necessary when you have no spaces usually, but doesn't hurt if it isn't needed
6. Anything after `#` is a comment & is not seen by the system

### Manual Regisry entry

1. Open Regedit by pressing the `[Win]` key & typing `"regedit`. It will ask for elevated permissions, click `[Yes]`
2. Navigate to `Computer\HKEY_CLASSES_ROOT\*\shell`.
    - <small><small>You can click the directory bar under the `File`/`Edit`/etc menu & `[Ctrl]`+`[A]` twice to clear it & type `HKCR\*\shell`</small></small>
    - This Registry section sets commands for all files (`*`) in the `Shell` (File Explorer for this context)
3. Right-click on `shell` & Select `New` > `Key`
4. Name it `CRLF>LF`
   - This will be what is shown in the Right-click menu You can use a different name if you prefer
5. Right-click on `CRLF>LF` & Select `New` > `Key`
6. Name it exactly `command`
7. Inside the `command` Key to the right you will see a value named `(Default)` Edit it by double clicking or Right-clicking & selecting `Modify...`
8. Enter the location of your `.bat` file with a space & `%1` after it. This tells Windows to use run the script on the Right-clicked file which it refers to as `%1`
   - `C:\tools\crlf\ToUnix.bat %1` if using the example directory
9. It should immediately appear in your right-click menu, no restart required. You may need to click `Show more options` if you haven't bypassed that
