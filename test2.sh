#/bin/bash

# Data Sources
games_db="data/PSP_GAMES.tsv"
updates_db="data/PSP_UPDATES.tsv"
dlc_db="data/PSP_DLCS.tsv"

# Test Case 2 : LittleBigPlanet
cid="UP9000-UCUS98744_00-LBPPSPAFULL00001"
pkg="pkg/$cid.pkg"
echo "fetching $(cat $games_db | grep $cid | cut -f 4)"
wget "$(cat $games_db | grep $cid | cut -f 5)" -O $pkg
# save the iso and the pbp
pkg2zip/pkg2zip -x $pkg
pkg2zip/pkg2zip -p -x $pkg

# LBP DLC requires a patch pboot:
cid="UP9000-UCUS98744_00-LBPPDLCSONYPA002"
pkg="pkg/$cid.pkg"
echo "fetching $(cat $updates_db | grep $cid | cut -f 3)"
wget "$(cat $updates_db | grep $cid | cut -f 4)" -O $pkg
pkg2zip/pkg2zip -p -x $pkg

# now we need 2 DLC and a level pack
dlc1="UP9000-UCUS98744_00-LBPPDLCSONYLP007" # Easter Pack
dlc2="UP9000-UCUS98744_00-LBPPDLCSONYLP006" # Yuletide pack
dlc3="UP9000-UCUS98744_00-LBPPDLCSONYPK001" # Turbo level kit
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
pkg2zip/pkg2zip -p -x $dlcpkg3 # encrypted

