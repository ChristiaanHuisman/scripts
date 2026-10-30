# Generate any amount of new UUID v4's and copy it directly to the clipboard.

function Copy-Guids {
  param (
    [string]$Potential = "1",
    [switch]$Print
  )

  Write-Host

  $amount = $Potential -as [int]

  if ($null -eq $amount -or $amount -lt 1) {
    Write-Host "This function only takes a positive number as an argument."
    Write-Host

    return
  }

  Write-Host "UUID v4:"

  $guids = [Collections.Generic.List[string]]::new($amount)

  for ($i = 0; $i -lt $amount; $i++) {
    $guid = [Guid]::NewGuid().ToString().ToUpper()
    $guids.Add($guid)

    Write-Host $guid
  }

  Set-Clipboard -Value $guids
  Write-Host
  Write-Host "Copied to clipboard."
  Write-Host
}

New-Alias -Name guids -Value Copy-Guids
