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


# This line creates a temp file version of Moneychanger.proto, called
# Moneychanger-lite-temp2.proto, where the import lines are commented out.
#
sed s/import/'\/\/import'/ Moneychanger.proto >> Moneychanger-lite-temp2.proto


# These lines create a file called Moneychanger-lite-temp.proto that
# has the fixed imports at the top of the file.
#
echo "import \"Generics-lite.proto\";" >> Moneychanger-lite-temp.proto
echo "import \"Bitcoin-lite.proto\";" >> Moneychanger-lite-temp.proto

# Next we put the LITE_RUNTIME option at the top of a new file called
# Moneychanger-lite.proto
#
echo "option optimize_for = LITE_RUNTIME;" >> Moneychanger-lite.proto

# Next we append Moneychanger-lite-temp.proto to Moneychanger-lite.proto
# This means the LITE_RUNTIME option is now followed by the corrected imports.
#
cat Moneychanger-lite-temp.proto >> Moneychanger-lite.proto

# Next we append Moneychanger-lite-temp2.proto to Moneychanger-lite.proto
# This means it now contains the original Moneychanger.proto contents, except
# with their original imports commented out.
#
cat Moneychanger-lite-temp2.proto >> Moneychanger-lite.proto

# Delete the temp files.
#
rm Moneychanger-lite-temp.proto
rm Moneychanger-lite-temp2.proto

# Compile the cc and h files.
#
echo "Building proto files" &&
protoc --cpp_out=. *lite.proto &&
echo "Moving *.pb.h -> ../../../include/otlib" &&
mv *.pb.h  ../../../include/otlib









