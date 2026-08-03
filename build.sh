#/bin/bash

# We need a current build of pkg2zip
rm -rf pkg2zip
git clone https://github.com/lusid1/pkg2zip.git
cd pkg2zip
make
cd ..

# We also need data sources
rm -rf data
mkdir data
mkdir pkg
cd data
wget https://nopaystation.com/tsv/PSP_GAMES.tsv
wget https://nopaystation.com/tsv/PSP_UPDATES.tsv
wget https://nopaystation.com/tsv/PSP_DLCS.tsv
cd ..
games_db="data/PSP_GAMES.tsv"
updates_db="data/PSP_UPDATES.tsv"
dlc_db="data/PSP_DLCS.tsv"

# Test case 1 : Rockband Unplugged
cid="UP8802-NPUH10015_00-RBUNPLUGGCCF0003"
pkg="pkg/$cid.pkg"
echo "fetching $(cat $games_db | grep $cid | cut -f 4)"
wget "$(cat $games_db | grep $cid | cut -f 5)" -O $pkg
# save the iso and the pbp
pkg2zip/pkg2zip -x $pkg
pkg2zip/pkg2zip -p -x $pkg

# now we need 2 DLC not included in the UMD version
dlc1="UP8802-ULUS10418_00-ALIVE00000000000" # Alive
dlc2="UP8802-ULUS10418_00-3SAND7S000000000" # 3's and 7's
dlcpkg1="pkg/$dlc1.pkg"
dlcpkg2="pkg/$dlc2.pkg"
echo "fetching $(cat $dlc_db | grep $dlc1 | cut -f 3)"
wget "$(cat $dlc_db | grep $dlc1 | cut -f 4)" -O $dlcpkg1
echo "fetching $(cat $dlc_db | grep $dlc2 | cut -f 3)"
wget "$(cat $dlc_db | grep $dlc2 | cut -f 4)" -O $dlcpkg2
pkg2zip/pkg2zip -d -x $dlcpkg1 # decrypted
pkg2zip/pkg2zip -p -x $dlcpkg2 # encrypted








