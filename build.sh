#/bin/bash

# Clean up any old runs
rm -rf pkg2zip
rm -rf data
rm -rf pkg

# We need a current build of pkg2zip
git clone https://github.com/lusid1/pkg2zip.git
cd pkg2zip
make
cd ..

# We also need data sources
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

# and we need to build the test data sets
./test1.sh
./test2.sh
./test3.sh
