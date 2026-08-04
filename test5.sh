#/bin/bash

# Data Sources
games_db="data/PSP_GAMES.tsv"
updates_db="data/PSP_UPDATES.tsv"
dlc_db="data/PSP_DLCS.tsv"

# Test case 5(a) : Bonks Adventure
cid="UP0555-NPUF30012_00-PCGENJIN0000EH15"
pkg="pkg/$cid.pkg"
echo "fetching $(cat $games_db | grep $cid | cut -f 4)"
wget "$(cat $games_db | grep $cid | cut -f 5)" -O $pkg
# save the iso and the pbp
pkg2zip/pkg2zip -x $pkg
pkg2zip/pkg2zip -p -x $pkg

# Test case 5(b) : Soldier Blade
cid="UP0555-NPUF30016_00-SOLDIERBLADEEH24"
pkg="pkg/$cid.pkg"
echo "fetching $(cat $games_db | grep $cid | cut -f 4)"
wget "$(cat $games_db | grep $cid | cut -f 5)" -O $pkg
# save the iso and the pbp
pkg2zip/pkg2zip -d -x $pkg
pkg2zip/pkg2zip -d -p -x $pkg

