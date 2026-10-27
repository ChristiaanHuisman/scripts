# Scripts

Personal scripts I've written and how to use them.

Clone this repository wherever you want to keep your scripts, e.g., `$HOME\scripts\`.

## PowerShell

### Setup

1. **Create your PowerShell profile** (if it doesn't already exist) by running the following in PowerShell:

   ```powershell
   if (!(Test-Path -Path $PROFILE)) {
     New-Item -ItemType File -Path $PROFILE -Force
     Write-Host "Profile created at: $PROFILE"
   }
   else {
     Write-Host "Profile already exists at: $PROFILE"
   }
   ```

2. **Open your profile file.** It will be named something like `Microsoft.PowerShell_profile.ps1`.

3. **Add the following to your profile** to automatically load all PowerShell scripts in the repository's `powershell` directory:

   ```powershell
   Get-ChildItem "$HOME\scripts\powershell\*.ps1" | ForEach-Object { . $_.FullName }
   ```

   Replace the path if you cloned the repository somewhere else.

4. **Restart PowerShell** or reload your profile to load the scripts.

### Adding scripts

Place any `.ps1` files you want to use in the `powershell` directory. They will be loaded automatically whenever PowerShell starts.
