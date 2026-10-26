# Navigates to the specified directory inside the current user directory.

function navto {
  param(
    [string]$dirName
  )

  if ($dirName -eq "") {
    Write-Host "`nNo directory name specified.`n"
    return
  }

  Write-Host "`nThis function only searches inside the current user directory."

  $paths = @(Get-ChildItem -Path "$HOME" -Filter $dirName -Directory -Recurse -ErrorAction SilentlyContinue |
    Sort-Object LastWriteTime -Descending |
    Select-Object -ExpandProperty FullName)

  if ($paths.Count -eq 0) {
    Write-Host "No directory found with the specified name inside user directory."
  }
  elseif ($paths.Count -eq 1) {
    Write-Host "Navigating to specified directory inside user directory."
    Set-Location $paths[0]
  }
  else {
    Write-Host "`nMultiple directories found:"
    Write-Host "$($paths[0]) - Last modified"

    for ($i = 1; $i -lt $paths.Count; $i++) {
      Write-Host $paths[$i]
    }

    Write-Host "`nNavigating to last modified specified directory inside user directory."
    Write-Host "If this is not the desired directory, run cd with the copied desired path, e.g.:"
    Write-Host "cd $($paths[1])"
    Set-Location $paths[0]
  }

  Write-Host ""
}
