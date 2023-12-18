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
2. Run `Set-ExecutionPolicy Bypass`
3. Run `iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/speedking456/tailscale-ps1/main/install_tailscale.ps1'))`
4. Paste in your Tailscale auth key
5. (Optional) run `Set-ExecutionPolicy Default` to reset the execution policy on your machine.
