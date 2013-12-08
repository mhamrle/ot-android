#!/bin/sh
# This does the protobuf compilation process for you, incase you want the process outside of your build script process.
echo "cd ot/Open-Transactions/src/otlib/otprotob" &&
cd ot/Open-Transactions/src/otlib/otprotob &&
echo "Building proto files" &&
protoc --cpp_out=. *.proto && 
echo "Renaming & Moving pb.cc -> .." &&
mv Bitcoin.pb.cc .. &&
mv Generics.pb.cc .. &&
mv Markets.pb.cc .. &&
mv Moneychanger.pb.cc .. &&
echo "Moving *.pb.h -> ../../../include/otlib" &&
mv *.pb.h  ../../../include/otlib
