# Open default browser tab with a preset link, full link or just a new tab.
# If a full link is provided the parameter needs the domain as well,
# while "https://" is automatically prefixed.

function Open-Browser {
  param (
    [string]$Link
  )

  Write-Host ""

  $presets = @{
    "yt" = "youtube.com";
    "ytm" = "music.youtube.com";
    "spot" = "open.spotify.com";
    "gmail" = "mail.google.com";
    "github" = "github.com";
    "dstv" = "dstv.stream";
    "netflix" = "netflix.com";
    "takealot" = "takealot.com";
    "wootware" = "wootware.co.za";
    "evetech" = "evetech.co.za";
  }

  $Link = $presets[$Link.ToLower()]

  Start-Process "https://$Link"

  Write-Host "Opening default browser."
  Write-Host ""
}

New-Alias -Name browser -Value Open-Browser
