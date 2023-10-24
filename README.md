### set up

```sh
git clone git@github.com:kimsk/chia-sim-cats.git my-chia-sim-cats
cd my-chia-sim-cats

```

#### PowerShell

```sh
$CHIA_SIM_ROOT=(pwd)
$env:CHIA_ROOT="$($CHIA_SIM_ROOT)/main"
$env:CHIA_KEYS_ROOT="$($env:CHIA_ROOT)/keys"
$CHIA_KEYS_ROOT=$env:CHIA_KEYS_ROOT

```

#### bash

```sh
export CHIA_SIM_ROOT="$(pwd)"
export CHIA_ROOT="$CHIA_SIM_ROOT/main"
export CHIA_KEYS_ROOT="$CHIA_ROOT/keys"

```

> make sure CHIA_ROOT and CHIA_KEYS_ROOT are set correctly before proceed

```sh
chia init --fix-ssl-permissions
chia keys add -l farmer -f $CHIA_KEYS_ROOT/farmer.txt

```

### start

```sh
chia dev sim --root-path $CHIA_SIM_ROOT start -w

```

### verify

```sh
chia show -s
chia keys show
chia wallet show -f 3682562999

```

```sh
❯ chia show -s
Network: simulator0    Port: 43994   RPC Port: 23005
Node ID: 450cdcb05b9e200211ff9f2713b08c51da2f78b111c04a035be4742b9c28be29
Genesis Challenge: eb8c4d20b322be8d9fddbf9412016bdffe9a2901d7edb0e364e94266d0e095f7
Current Blockchain Status: Full Node Synced

Peak: Hash: a0058288f6558141171af50444f5e464b7ea8501a8cb702f57d9a42cbb824337
      Time: Tue Oct 24 2023 11:40:07 CDT                  Height:          4

Estimated network space: 36.793 MiB
Current difficulty: 1024
Current VDF sub_slot_iters: 1024

  Height: |   Hash:
        4 | a0058288f6558141171af50444f5e464b7ea8501a8cb702f57d9a42cbb824337
        3 | f6cc5e2ddf81a32ee691669c80d81bd919718d52d19d9d869d923073380bbfaf
        2 | c08d327607e59e86d9ef6bc281a9403a33284b276adf2ae375f9196fe21e9ace
        1 | bd03b58cba7ebd698ec3f6c7fb2b2a97c0b7bb6212aac02bf7762159f8161bc7


❯ chia keys show
Showing all public keys derived from your master seed and private key:

Label: farmer
Fingerprint: 3682562999
Master public key (m): 95cd6b1b6e03f761d824d8d699c21148dee15234b7a895eef21c5cc6c1573f37e25c9ac66b08a634f727b029a8efd18b
Farmer public key (m/12381/8444/0/0): 8ecb4ece88bec575120fd914060ae704f6ffc26a5563ae10c5a7c3ae07b4e5e939d3d0c3d54dd11b4853879565d03881
Pool public key (m/12381/8444/1/0): 869a6526d17e266eb91071efd7dcda90e5260b9ab0b829fcc9c7ee385e0b894567fc2e5d64a03235b1aa8841cad46cdb
First wallet address: txch1ztlxh9x5kxapmyqaavvy0yfeksln8m6xfm46pw26fgdnjd5hewyq855klv

❯ chia wallet show -f 3682562999
Wallet height: 4
Sync status: Synced
Balances, fingerprint: 3682562999

Chia Wallet:
   -Total Balance:         21000004.0 txch (21000003999999999999 mojo)
   -Pending Total Balance: 21000004.0 txch (21000003999999999999 mojo)
   -Spendable:             21000004.0 txch (21000003999999999999 mojo)
   -Type:                  STANDARD_WALLET
   -Wallet ID:             1

CAT1:
   -Total Balance:         1000000000.0  (1000000000000 mojo)
   -Pending Total Balance: 1000000000.0  (1000000000000 mojo)
   -Spendable:             1000000000.0  (1000000000000 mojo)
   -Type:                  CAT
   -Asset ID:              657bdae0165c622f635374e539ef7e4632750ecc87541071478c21a7ba67096c
   -Wallet ID:             2

CAT2:
   -Total Balance:         1000000000.0  (1000000000000 mojo)
   -Pending Total Balance: 1000000000.0  (1000000000000 mojo)
   -Spendable:             1000000000.0  (1000000000000 mojo)
   -Type:                  CAT
   -Asset ID:              1b19cf566eb4e2bf9f563eac9b0263c1bd8b1007163da62436306699142fc71d
   -Wallet ID:             3

chialisper:
   -Total Balance:         1.0
   -Pending Total Balance: 1.0
   -Spendable:             1.0
   -Type:                  DECENTRALIZED_ID
   -DID ID:                did:chia:1ysje70mewjnge6zz4xaj6en88x9tkxud3sf7s8yfs9dda4gudlaq5qx0sf
   -Wallet ID:             4

chialisper NFT Wallet:
   -Total Balance:         0.0
   -Pending Total Balance: 0.0
   -Spendable:             0.0
   -Type:                  NFT
   -DID ID:                did:chia:1ysje70mewjnge6zz4xaj6en88x9tkxud3sf7s8yfs9dda4gudlaq5qx0sf
   -Wallet ID:             5
```

# Notes

## config

- autofarm: `off`

> To farm manually, run

```sh
chia dev sim --root-path $CHIA_SIM_ROOT farm

```

> Or to farm automatically, run

```sh
chia dev sim --root-path $CHIA_SIM_ROOT autofarm on

```

## farming & prefarm

- Fingerprint: `3682562999`
- Reward address: `txch1a7wl6huvfck2x3rs5azynj7y65n8r4d33g63mh5d6ee4tzzh7j8s9w64sc`

## wallet addresses

```sh
❯ chia keys derive -f 3682562999 wallet-address -n 5 --show-hd-path
Wallet address 0 (m/12381/8444/2/0): txch1ztlxh9x5kxapmyqaavvy0yfeksln8m6xfm46pw26fgdnjd5hewyq855klv
Wallet address 1 (m/12381/8444/2/1): txch1fnxfpp95hjtj5yphpsd6wd35gpl4qgtdcla9zxhhfm09wq4e0cds4aqdsc
Wallet address 2 (m/12381/8444/2/2): txch1hw68na2zv6umz6qsazd9k82gtglgvr4zr672d7nwz0du04qmjqvs3lm88v
Wallet address 3 (m/12381/8444/2/3): txch19zql9t2u7k2z6sm2vcge9jdy627egdt424hms6rv04u3dy58mdlsxeydp9
Wallet address 4 (m/12381/8444/2/4): txch129hym5vzv9e69tmhh988mm6w8k2ptvtktaqduqdtvq5ma92m389qdjdw98
```

## cat tails

- CAT1: `657bdae0165c622f635374e539ef7e4632750ecc87541071478c21a7ba67096c`
- CAT2: `1b19cf566eb4e2bf9f563eac9b0263c1bd8b1007163da62436306699142fc71d`

## DID `did:chia:1ysje70mewjnge6zz4xaj6en88x9tkxud3sf7s8yfs9dda4gudlaq5qx0sf`

```sh
❯ chia wallet did get_did -i 4
DID:                    did:chia:1ysje70mewjnge6zz4xaj6en88x9tkxud3sf7s8yfs9dda4gudlaq5qx0sf
Coin ID:                0x84bcafe525cec77f8394f8e4737001402e4977c18f1ba6594ab18f902517a160

❯ cdv decode did:chia:1ysje70mewjnge6zz4xaj6en88x9tkxud3sf7s8yfs9dda4gudlaq5qx0sf
24259f3f7974a68ce842a9bb2d6667398abb1b8d8c13e81c89815aded51c6ffa

❯ chia wallet did get_details -id 24259f3f7974a68ce842a9bb2d6667398abb1b8d8c13e81c89815aded51c6ffa
DID:                    did:chia:1ysje70mewjnge6zz4xaj6en88x9tkxud3sf7s8yfs9dda4gudlaq5qx0sf
Coin ID:                84bcafe525cec77f8394f8e4737001402e4977c18f1ba6594ab18f902517a160
Inner P2 Address:       txch1xa4m9jsns9rmk6hdh0wg2huh949jl4rn3s33hwm5ehvuzft96caqajxx47
Public Key:             b79ce1053f997f2642207e4953964ea14b0ee198bbd986075f69923099620b5ac20e9b5ba4a3ebfab0a331e6d57d256b
Launcher ID:            24259f3f7974a68ce842a9bb2d6667398abb1b8d8c13e81c89815aded51c6ffa
DID Metadata:           {}
Recovery List Hash:     4bf5122f344554c53bde2ebb8cd2b7e3d1600ad631c385a5d7cce23c7785459a
Recovery Required Verifications: 0
Last Spend Puzzle:      0xff02ffff01ff02ffff01ff02ffff03ffff18ff2fff3480ffff01ff04ffff04ff20ffff04ff2fff808080ffff04ffff02ff3effff04ff02ffff04ff05ffff04ffff02ff2affff04ff02ffff04ff27ffff04ffff02ffff03ff77ffff01ff02ff36ffff04ff02ffff04ff09ffff04ff57ffff04ffff02ff2effff04ff02ffff04ff05ff80808080ff808080808080ffff011d80ff0180ffff04ffff02ffff03ff77ffff0181b7ffff015780ff0180ff808080808080ffff04ff77ff808080808080ffff02ff3affff04ff02ffff04ff05ffff04ffff02ff0bff5f80ffff01ff8080808080808080ffff01ff088080ff0180ffff04ffff01ffffffff4947ff0233ffff0401ff0102ffffff20ff02ffff03ff05ffff01ff02ff32ffff04ff02ffff04ff0dffff04ffff0bff3cffff0bff34ff2480ffff0bff3cffff0bff3cffff0bff34ff2c80ff0980ffff0bff3cff0bffff0bff34ff8080808080ff8080808080ffff010b80ff0180ffff02ffff03ffff22ffff09ffff0dff0580ff2280ffff09ffff0dff0b80ff2280ffff15ff17ffff0181ff8080ffff01ff0bff05ff0bff1780ffff01ff088080ff0180ff02ffff03ff0bffff01ff02ffff03ffff02ff26ffff04ff02ffff04ff13ff80808080ffff01ff02ffff03ffff20ff1780ffff01ff02ffff03ffff09ff81b3ffff01818f80ffff01ff02ff3affff04ff02ffff04ff05ffff04ff1bffff04ff34ff808080808080ffff01ff04ffff04ff23ffff04ffff02ff36ffff04ff02ffff04ff09ffff04ff53ffff04ffff02ff2effff04ff02ffff04ff05ff80808080ff808080808080ff738080ffff02ff3affff04ff02ffff04ff05ffff04ff1bffff04ff34ff8080808080808080ff0180ffff01ff088080ff0180ffff01ff04ff13ffff02ff3affff04ff02ffff04ff05ffff04ff1bffff04ff17ff8080808080808080ff0180ffff01ff02ffff03ff17ff80ffff01ff088080ff018080ff0180ffffff02ffff03ffff09ff09ff3880ffff01ff02ffff03ffff18ff2dffff010180ffff01ff0101ff8080ff0180ff8080ff0180ff0bff3cffff0bff34ff2880ffff0bff3cffff0bff3cffff0bff34ff2c80ff0580ffff0bff3cffff02ff32ffff04ff02ffff04ff07ffff04ffff0bff34ff3480ff8080808080ffff0bff34ff8080808080ffff02ffff03ffff07ff0580ffff01ff0bffff0102ffff02ff2effff04ff02ffff04ff09ff80808080ffff02ff2effff04ff02ffff04ff0dff8080808080ffff01ff0bffff0101ff058080ff0180ff02ffff03ffff21ff17ffff09ff0bff158080ffff01ff04ff30ffff04ff0bff808080ffff01ff088080ff0180ff018080ffff04ffff01ffa07faa3253bfddd1e0decb0906b2dc6247bbc4cf608f58345d173adb63e8b47c9fffa024259f3f7974a68ce842a9bb2d6667398abb1b8d8c13e81c89815aded51c6ffaa0eff07522495060c066f66f32acc2a77e3a3e737aca8baea4d1a64ea4cdc13da9ffff04ffff01ff02ffff01ff02ffff01ff02ffff03ff81bfffff01ff02ff05ff82017f80ffff01ff02ffff03ffff22ffff09ffff02ff7effff04ff02ffff04ff8217ffff80808080ff0b80ffff15ff17ff808080ffff01ff04ffff04ff28ffff04ff82017fff808080ffff04ffff04ff34ffff04ff8202ffffff04ff82017fffff04ffff04ff8202ffff8080ff8080808080ffff04ffff04ff38ffff04ff822fffff808080ffff02ff26ffff04ff02ffff04ff2fffff04ff17ffff04ff8217ffffff04ff822fffffff04ff8202ffffff04ff8205ffffff04ff820bffffff01ff8080808080808080808080808080ffff01ff088080ff018080ff0180ffff04ffff01ffffffff313dff4946ffff0233ff3c04ffffff0101ff02ff02ffff03ff05ffff01ff02ff3affff04ff02ffff04ff0dffff04ffff0bff2affff0bff22ff3c80ffff0bff2affff0bff2affff0bff22ff3280ff0980ffff0bff2aff0bffff0bff22ff8080808080ff8080808080ffff010b80ff0180ffffff02ffff03ff17ffff01ff02ffff03ff82013fffff01ff04ffff04ff30ffff04ffff0bffff0bffff02ff36ffff04ff02ffff04ff05ffff04ff27ffff04ff82023fffff04ff82053fffff04ff820b3fff8080808080808080ffff02ff7effff04ff02ffff04ffff02ff2effff04ff02ffff04ff2fffff04ff5fffff04ff82017fff808080808080ff8080808080ff2f80ff808080ffff02ff26ffff04ff02ffff04ff05ffff04ff0bffff04ff37ffff04ff2fffff04ff5fffff04ff8201bfffff04ff82017fffff04ffff10ff8202ffffff010180ff808080808080808080808080ffff01ff02ff26ffff04ff02ffff04ff05ffff04ff37ffff04ff2fffff04ff5fffff04ff8201bfffff04ff82017fffff04ff8202ffff8080808080808080808080ff0180ffff01ff02ffff03ffff15ff8202ffffff11ff0bffff01018080ffff01ff04ffff04ff20ffff04ff82017fffff04ff5fff80808080ff8080ffff01ff088080ff018080ff0180ff0bff17ffff02ff5effff04ff02ffff04ff09ffff04ff2fffff04ffff02ff7effff04ff02ffff04ffff04ff09ffff04ff0bff1d8080ff80808080ff808080808080ff5f80ffff04ffff0101ffff04ffff04ff2cffff04ff05ff808080ffff04ffff04ff20ffff04ff17ffff04ff0bff80808080ff80808080ffff0bff2affff0bff22ff2480ffff0bff2affff0bff2affff0bff22ff3280ff0580ffff0bff2affff02ff3affff04ff02ffff04ff07ffff04ffff0bff22ff2280ff8080808080ffff0bff22ff8080808080ff02ffff03ffff07ff0580ffff01ff0bffff0102ffff02ff7effff04ff02ffff04ff09ff80808080ffff02ff7effff04ff02ffff04ff0dff8080808080ffff01ff0bffff0101ff058080ff0180ff018080ffff04ffff01ff02ffff01ff02ffff01ff02ffff03ff0bffff01ff02ffff03ffff09ff05ffff1dff0bffff1effff0bff0bffff02ff06ffff04ff02ffff04ff17ff8080808080808080ffff01ff02ff17ff2f80ffff01ff088080ff0180ffff01ff04ffff04ff04ffff04ff05ffff04ffff02ff06ffff04ff02ffff04ff17ff80808080ff80808080ffff02ff17ff2f808080ff0180ffff04ffff01ff32ff02ffff03ffff07ff0580ffff01ff0bffff0102ffff02ff06ffff04ff02ffff04ff09ff80808080ffff02ff06ffff04ff02ffff04ff0dff8080808080ffff01ff0bffff0101ff058080ff0180ff018080ffff04ffff01b0b79ce1053f997f2642207e4953964ea14b0ee198bbd986075f69923099620b5ac20e9b5ba4a3ebfab0a331e6d57d256bff018080ffff04ffff01a04bf5122f344554c53bde2ebb8cd2b7e3d1600ad631c385a5d7cce23c7785459affff04ffff0180ffff04ffff01ffa07faa3253bfddd1e0decb0906b2dc6247bbc4cf608f58345d173adb63e8b47c9fffa024259f3f7974a68ce842a9bb2d6667398abb1b8d8c13e81c89815aded51c6ffaa0eff07522495060c066f66f32acc2a77e3a3e737aca8baea4d1a64ea4cdc13da9ffff04ffff0180ff01808080808080ff01808080
Last Spend Solution:    [['0x735e44a4a6a1b403306e095c9b3c0cbfcc0b47bc607fa8bb22f64d5051db451d', '0x01'], '0x01', ['0x01', ['0x', ['0x01', ['0x33', '0xa67aa6a99ca3fa69046f0e494ad1fc3db29ca0b1f97c23a5985e44e63c898079', '0x01', ['0x376bb2ca138147bb6aedbbdc855f972d4b2fd4738c231bbb74cdd9c12565d63a']]], '0x']]]
Last Spend Hints:       ['376bb2ca138147bb6aedbbdc855f972d4b2fd4738c231bbb74cdd9c12565d63a']
```

## NFTs

```sh
❯ chia rpc wallet nft_get_nfts '{"wallet_id": 5}' | jq "[.nft_list[] | { nft_id: .nft_id, launcher_id: .launcher_id, nft_coin_id: .nft_coin_id, owner_did: .owner_did, royalty_percentage: .royalty_percentage }]"
[
  {
    "nft_id": "nft159ul8qusflu8dfc6ggq9ccnht27gjelqqqg250zphca2rygk5zxq0vcnk2",
    "launcher_id": "0xa179f383904ff876a71a42005c62775abc8967e00010aa3c41be3aa19116a08c",
    "nft_coin_id": "0xbe92a25ace770f7f33a44489af00cd6ebc9aeaa4fa8ea5c9b9222957ff81b40b",
    "owner_did": "0x24259f3f7974a68ce842a9bb2d6667398abb1b8d8c13e81c89815aded51c6ffa",
    "royalty_percentage": 0
  },
  {
    "nft_id": "nft13cnh8pxz39dd9c7nha23xhqwdcr74w2x2kk7z4rk5hu27nrpzahsu6avg7",
    "launcher_id": "0x8e277384c2895ad2e3d3bf55135c0e6e07eab94655ade15476a5f8af4c61176f",
    "nft_coin_id": "0x2903e69c8831a5b66107da1067b97e924faceb6353442f1ea95fd4c0198d83d9",
    "owner_did": "0x24259f3f7974a68ce842a9bb2d6667398abb1b8d8c13e81c89815aded51c6ffa",
    "royalty_percentage": 200
  },
  {
    "nft_id": "nft10cfc04merye3r7envfz95v9t8ug7rk6z9424ravzwj3hdmead3ps66cz2v",
    "launcher_id": "0x7e1387d779193311fb3362445a30ab3f11e1db422d5551f58274a376ef3d6c43",
    "nft_coin_id": "0x217796a97cc9b9f30154888fe1c9be382f4ab089d60212895e83330badd13910",
    "owner_did": "0x24259f3f7974a68ce842a9bb2d6667398abb1b8d8c13e81c89815aded51c6ffa",
    "royalty_percentage": 300
  },
  {
    "nft_id": "nft1c5aavcgmmwgtgs9ft70w6p0msc9wmp7p4u2x5c8tpvsxxflfkjxq7tfgq7",
    "launcher_id": "0xc53bd6611bdb90b440a95f9eed05fb860aed87c1af146a60eb0b206327e9b48c",
    "nft_coin_id": "0x97306a43f1fd0db546029f4b673b327b7a7f23fee7531a7e6e2f6ea2f22465d1",
    "owner_did": "0x24259f3f7974a68ce842a9bb2d6667398abb1b8d8c13e81c89815aded51c6ffa",
    "royalty_percentage": 1000
  }
]
```
