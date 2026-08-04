#/bin/bash

# Data Sources
games_db="data/PSP_GAMES.tsv"
updates_db="data/PSP_UPDATES.tsv"
dlc_db="data/PSP_DLCS.tsv"

# Test Case 4 : Patapon 3
cid="UP9000-UCUS98751_00-0000000000000001"
pkg="pkg/$cid.pkg"
echo "fetching $(cat $games_db | grep $cid | cut -f 4)"
wget "$(cat $games_db | grep $cid | cut -f 5)" -O $pkg
# save the iso and the pbp
pkg2zip/pkg2zip -x $pkg
pkg2zip/pkg2zip -p -x $pkg

# now we need 2 DLC  and the world map
dlc1="UP9000-UCUS98751_00-DLM0000000000006" # Mission Pack 1 - Witch and the Thunderbeast
dlc2="UP9000-UCUS98751_00-DLM0000000000010" # Mission Pack 1 - Terantus
dlc3="UP9000-UCUS98751_00-DLMC000000000000" # World Map
dlcpkg1="pkg/$dlc1.pkg"
dlcpkg2="pkg/$dlc2.pkg"
dlcpkg3="pkg/$dlc3.pkg"
echo "fetching $(cat $dlc_db | grep $dlc1 | cut -f 3)"
wget "$(cat $dlc_db | grep $dlc1 | cut -f 4)" -O $dlcpkg1
echo "fetching $(cat $dlc_db | grep $dlc2 | cut -f 3)"
wget "$(cat $dlc_db | grep $dlc2 | cut -f 4)" -O $dlcpkg2
echo "fetching $(cat $dlc_db | grep $dlc3 | cut -f 3)"
wget "$(cat $dlc_db | grep $dlc3 | cut -f 4)" -O $dlcpkg3
pkg2zip/pkg2zip -d -x $dlcpkg1 # decrypted
pkg2zip/pkg2zip -p -x $dlcpkg2 # encrypted
pkg2zip/pkg2zip -p -x $dlcpkg3 # encrypted (world map)

