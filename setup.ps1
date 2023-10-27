if (Test-Path -Path ".git") {
    Remove-Item .git -Force -Recurse
} 

. ./setup-chia-env.ps1

chia init --fix-ssl-permissions

. ./setup-chia-fingerprints.ps1