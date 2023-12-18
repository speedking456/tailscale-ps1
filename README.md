## Still WIP
Feel free to make a PR if you have any suggestions

### Requirements
- 64-bit Windows 10 or 11
- Tailnet setup
- Tailscale auth key

### Features
- Automatically install the latest version of tailscale on windows
- Automatically run `tailscale up` with an auth key

### Usage
1. Open powershell as an administrator
3. Run `Set-ExecutionPolicy Bypass`
4. Approve the change by pressing A
5. Run `iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/speedking456/tailscale-ps1/main/install_tailscale.ps1'))`
6. Go through the installer
7. Paste in your Tailscale auth key
8. (Optional) run `Set-ExecutionPolicy Default` to reset the execution policy on your machine.
