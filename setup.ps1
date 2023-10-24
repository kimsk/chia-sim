if (Test-Path -Path ".git") {
    Remove-Item .git -Force -Recurse
} 

$CHIA_SIM_ROOT=(pwd)
$env:CHIA_ROOT="$($CHIA_SIM_ROOT)/main"
$env:CHIA_KEYS_ROOT="$($env:CHIA_ROOT)/keys"
$CHIA_KEYS_ROOT=$env:CHIA_KEYS_ROOT

chia init --fix-ssl-permissions
chia keys add -l farmer -f $CHIA_KEYS_ROOT/farmer.txt