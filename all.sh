#/bin/bash

# Clean up any old runs
rm -rf pkg2zip
rm -rf data
rm -rf pkg

# We need a fresh pkg2zip and fresh data sources
./prep.sh

# and we need to build the test data sets
./test1.sh
./test2.sh
./test3.sh
./test4.sh
./test5.sh
./test6-tekken6.sh 

