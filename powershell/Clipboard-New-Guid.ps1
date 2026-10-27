# Generate a new UUID v4 and copy it directly to the clipboard.

function Clipboard-New-Guid {
  $guid = [System.Guid]::NewGuid()
  $guid | Set-Clipboard

  Write-Host ""
  Write-Host "UUID v4"
  Write-Host "$guid"
  Write-Host ""
}

New-Alias -Name clipguid -Value Clipboard-New-Guid
