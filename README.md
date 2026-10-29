# Scripts

Personal scripts I've written, along with instructions on how to use them.

**Note:** These scripts are primarily intended for Windows systems running PowerShell 5.1 or later. They may rely on Windows-specific paths or functionality.

Clone this repository, or your own fork, to a location of your choice (e.g., `$HOME`):

```powershell
cd $HOME
git clone <repository-url>
```

## PowerShell

### Setup

1. **Create your PowerShell profile** (if it doesn't already exist) by running the following in PowerShell:

   ```powershell
   if (!(Test-Path -Path $PROFILE)) {
     New-Item -ItemType File -Path $PROFILE -Force
     Write-Host "`nProfile created at:`n$PROFILE"
     cd (Split-Path $PROFILE)
     Invoke-Item -Path (Split-Path $PROFILE)
   } else {
     Write-Host "`nProfile already exists at:`n$PROFILE`n"
     cd (Split-Path $PROFILE)
     Invoke-Item -Path (Split-Path $PROFILE)
   }
   ```

2. **Open your profile file** in your preferred editor. It will be named something like `Microsoft.PowerShell_profile.ps1`.

3. **Add the following to your profile** to automatically load all PowerShell scripts in the repository's `powershell` directory:

   ```powershell
   # Automatically load all custom scripts.
   Get-ChildItem "$HOME\scripts\powershell\*.ps1" | ForEach-Object { . $_.FullName }
   ```

   Replace the path if you cloned the repository somewhere else.

4. **Restart PowerShell** or reload your profile to load the scripts.

5. **If script execution is disabled**, PowerShell may prevent your profile and custom scripts from loading. If you encounter an error stating that running scripts is disabled, run the following command in PowerShell:

   ```powershell
   Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
   ```

   Then restart PowerShell or reload your profile.

### Adding scripts

Place any `.ps1` file(s) you want to use in the `powershell` directory. They will be loaded automatically whenever PowerShell starts.
