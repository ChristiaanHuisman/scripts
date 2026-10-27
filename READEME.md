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

2. **Open your profile file.** It will be named something like `Microsoft.PowerShell_profile.ps1`. You can open it with your preferred editor.

3. **Add the scripts you want to invoke** by dot-sourcing them in your profile using `. ` followed by the script path. For example:

   ```powershell
   . "$HOME\scripts\powershell\navto.ps1"
   ```

   Repeat this for each script you want available in your PowerShell sessions.
