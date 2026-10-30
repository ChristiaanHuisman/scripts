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

  $guids = [Collections.Generic.List[string]]::new($amount)

  for ($i = 0; $i -lt $amount; $i++) {
    $guid = [Guid]::NewGuid().ToString().ToUpper()
    $guids.Add($guid)
  }

  if ($Print) {
    Write-Host "UUID v4:"

    foreach ($entry in $guids) {
      Write-Host $entry
    }

    Write-Host
  }

  $char = @("s", "")[$amount -eq 1]

  Set-Clipboard -Value $guids
  Write-Host "Copied $amount UUID v4$char to clipboard."
  Write-Host
}

New-Alias -Name guids -Value Copy-Guids
