#!/bin/sh
# This does the protobuf compilation process for you, incase you want the process outside of your build script process.
echo "cd ot/Open-Transactions/src/otlib/otprotob"
cd ot/Open-Transactions/src/otlib/otprotob


echo "Removing lite files (if they're there -- they may not be.)"

rm Bitcoin-lite.proto
rm Generics-lite.proto
rm Markets-lite.proto
rm Moneychanger-lite.proto

echo "Creating lite files..."

echo "option optimize_for = LITE_RUNTIME;" >> Bitcoin-lite.proto | cat Bitcoin.proto >> Bitcoin-lite.proto
echo "option optimize_for = LITE_RUNTIME;" >> Generics-lite.proto | cat Generics.proto >> Generics-lite.proto
echo "option optimize_for = LITE_RUNTIME;" >> Markets-lite.proto | cat Markets.proto >> Markets-lite.proto
echo "option optimize_for = LITE_RUNTIME;" >> Moneychanger-lite.proto | cat Moneychanger.proto >> Moneychanger-lite.proto


echo "Building proto files" &&
protoc --cpp_out=. *lite.proto &&
echo "Moving *.pb.h -> ../../../include/otlib" &&
mv *.pb.h  ../../../include/otlib

