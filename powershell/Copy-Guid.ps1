# Generate a new UUID v4 and copy it directly to the clipboard.

function Copy-Guid {
  $guid = [System.Guid]::NewGuid().ToString().ToUpper()

  Set-Clipboard -Value $guid

  Write-Host ""
  Write-Host "UUID v4:"
  Write-Host "$guid"
  Write-Host ""
}

New-Alias -Name copyguid -Value Copy-Guid
