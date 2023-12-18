$ErrorActionPreference = "Stop"

$tailscaleInstalled = Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Where-Object { $_.DisplayName -like "Tailscale*" }
if ($tailscaleInstalled) {
    Write-Host "Tailscale is already installed."
    exit 0
}

if ([System.Environment]::Is64BitOperatingSystem) {
    $arch = "amd64"
} else {
    Write-Host "Sorry, this script only supports 64-bit x86 Windows."
    exit 0
}

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$latest_version = (Invoke-WebRequest -Uri "https://pkgs.tailscale.com/stable/" | Select-String -Pattern "tailscale_" | Select-Object -First 1).Line.Split('_')[1]

$tailscaleMsi = "https://pkgs.tailscale.com/stable/tailscale-setup-$latest_version-amd64.msi"
Write-Host "Downloading Tailscale MSI installer version: $latest_version using URL: $tailscaleMsi"
Invoke-WebRequest -Uri ${tailscaleMsi} -OutFile "$PSScriptRoot\tailscale.msi"

Write-Host "Installing Tailscale.."
Start-Process msiexec.exe -ArgumentList "/i $PSScriptRoot\tailscale.msi" -Wait
Write-Host "Tailscale has been installed."

Write-Host "Starting Tailscale..."

$tailscale_authkey = Read-Host "Please enter your Tailscale auth key (it should be tagged)"
$arguments = "up --authkey=$tailscale_authkey --unattended"
Start-Process "C:\Program Files\Tailscale\tailscale.exe" -ArgumentList "$arguments"