# Navigates to the specified directory inside the current user directory.
# Use -Open flag to also automatically open File Explorer at the specified directory.

function Find-Directory {
  param (
    [string]$DirName,
    [switch]$Open
  )

  Write-Host ""

  if ($DirName -eq "") {
    Write-Host "No directory name specified."
    Write-Host ""

    return
  }

  Write-Host "This function only searches inside the current user directory."

  $paths = @(
    Get-ChildItem -Path "$HOME" -Filter $DirName -Directory -Recurse -ErrorAction SilentlyContinue |
    Sort-Object LastWriteTime -Descending |
    Select-Object -ExpandProperty FullName
  )

  if ($paths.Count -eq 0) {
    Write-Host "No directory found with the specified name."
  }
  elseif ($paths.Count -eq 1) {
    Write-Host "Navigating to specified directory."

    Set-Location $paths[0]
  }
  else {
    Write-Host ""
    Write-Host "Multiple directories found:"
    Write-Host "$($paths[0]) - Last modified"

    for ($i = 1; $i -lt $paths.Count; $i++) {
      Write-Host $paths[$i]
    }

    Write-Host ""
    Write-Host "Navigating to last modified specified directory."
    Write-Host "If this is not the desired directory, run cd with the desired path, e.g.:"
    Write-Host "cd $($paths[1])"

    Set-Location $paths[0]
  }

  Write-Host ""

  if ($Open -and $paths.Count -ne 0) {
    Invoke-Item -Path $paths[0]
  }
}

New-Alias -Name finddir -Value Find-Directory
