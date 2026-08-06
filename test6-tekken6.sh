#/bin/bash

# Data Sources
games_db="data/PSP_GAMES.tsv"
updates_db="data/PSP_UPDATES.tsv"
dlc_db="data/PSP_DLCS.tsv"

# Test case 6 : Tekken 6
cid="UP0700-NPUH10047_00-NBGATEKKEN6PSPGO"
pkg="pkg/$cid.pkg"
echo "fetching $(cat $games_db | grep $cid | cut -f 4)"
wget "$(cat $games_db | grep $cid | cut -f 5)" -O $pkg
# save the iso and the pbp
pkg2zip/pkg2zip -x $pkg    # ISO
pkg2zip/pkg2zip -p -x $pkg # EBOOT

