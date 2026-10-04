# One-click build for Coucou (Windows). Run from this folder in PowerShell:
#   .\build.ps1          -> installer in .\release\
#   .\build.ps1 -Dev     -> live-reloading dev build
param([switch]$Dev)
$ErrorActionPreference = "Stop"
foreach ($t in "node","npm","cargo") {
  if (-not (Get-Command $t -ErrorAction SilentlyContinue)) {
    throw "Missing '$t'. Install Rust (rustup.rs), Node 20+ and the MSVC Build Tools (Desktop development with C++)."
  }
}
npm install
if ($Dev) { npm run tauri dev } else { npm run pack }
