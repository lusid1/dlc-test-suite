#/bin/bash

# Data Sources
games_db="data/PSP_GAMES.tsv"
updates_db="data/PSP_UPDATES.tsv"
dlc_db="data/PSP_DLCS.tsv"

# Test Case 3 : Buzz! Quiz World
cid="UP9000-NPUG80293_00-BQWPSPUS00000100"
pkg="pkg/$cid.pkg"
echo "fetching $(cat $games_db | grep $cid | cut -f 4)"
wget "$(cat $games_db | grep $cid | cut -f 5)" -O $pkg
# save the iso and the pbp
pkg2zip/pkg2zip -x $pkg
pkg2zip/pkg2zip -p -x $pkg

# now we need 2 DLC 
dlc1="UP9000-NPUG80293_00-0000000000000023" # Videogames Pack
dlc2="UP9000-NPUG80293_00-USA0ROCKIDL00035" # Rock Idols Pack
dlcpkg1="pkg/$dlc1.pkg"
dlcpkg2="pkg/$dlc2.pkg"
echo "fetching $(cat $dlc_db | grep $dlc1 | cut -f 3)"
wget "$(cat $dlc_db | grep $dlc1 | cut -f 4)" -O $dlcpkg1
echo "fetching $(cat $dlc_db | grep $dlc2 | cut -f 3)"
wget "$(cat $dlc_db | grep $dlc2 | cut -f 4)" -O $dlcpkg2
pkg2zip/pkg2zip -d -x $dlcpkg1 # decrypted
pkg2zip/pkg2zip -p -x $dlcpkg2 # encrypted
