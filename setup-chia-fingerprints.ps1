function Set-KeyPSVariable {
    $keys = (chia keys show --json | ConvertFrom-Json).keys
    foreach ($key in $keys) {
        $label = $key.label
        if ($label) {
            $fingerprint = $key.fingerprint
            $address = $key.wallet_address
            New-Variable -Name "$($label)_fp" -Value $fingerprint -Force -Scope 1
            Write-Host "`$$($label)_fp:`t`t$fingerprint"
            New-Variable -Name "$($label)_addr" -Value $address -Force -Scope 1
            Write-Host "`$$($label)_addr:`t`t$address"
        }
    } 
}

function Set-ChiaPSVariables {
    . Set-KeyPSVariable
}

$key_files = Get-ChildItem -Path $CHIA_KEYS_ROOT -Filter *.txt
foreach($key_file in $key_files) {
    chia keys add -l $key_file.BaseName -f $key_file.FullName
}

Set-ChiaPSVariables