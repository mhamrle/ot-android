#!/bin/bash

set -e

FULL_PATH=$(pwd)

if [ -z "${ANDROID_NDK}" ] ; then
   echo "please set ANDROID_NDK"
   exit 1
fi

if [ -z "${OT_PATH}" ]; then
   echo "please set path to opentransaction repo OT_PATH"
   exit 1
fi

git submodule init
git submodule update

./getProtobufLibrary.sh

# build libsodium
(
        export ANDROID_NDK_HOME=$ANDROID_NDK
        cd ot/libsodium/

        ./autogen.sh

        for i in dist-build/android-[^b]*.sh; do
                $i
        done
)

for arch in ${BUILD_ARCHS:-armeabi armeabi-v7a x86 mips}; do
        $ANDROID_NDK/ndk-build APP_ABI="$arch" -j`nproc`

        mkdir -p install/${arch}/
        mkdir -p install/${arch}/lib/
        mkdir -p install/${arch}/include/

        cp -r ot/protobuf-2.5.0/src/google/ install/${arch}/include/
        cp -r ot/openssl-android/include/openssl/ install/${arch}/include/
        for lib in libssl.so libprotobuf.so libcryptoot.so libgnustl_shared.so; do
                cp -r libs/${arch}/${lib} install/${arch}/lib//
        done
        ln -fs libcryptoot.so  install/${arch}/lib//libcrypto.so

        case ${arch} in
                (armeabi)
                        libsodiumarch=arm ;;
                (armeabi-v7a)
                        libsodiumarch=armv7 ;;
                (*)
                        libsodiumarch=${arch} ;;
        esac
        cp ot/libsodium/libsodium-android-${libsodiumarch}/lib/libsodium.so install/${arch}/lib/
        cp -r ot/libsodium/libsodium-android-${libsodiumarch}/include/sodium* install/${arch}/include/

        (
            mkdir -p ${FULL_PATH}/build/$arch
            cd ${FULL_PATH}/build/$arch

            # TODO configurarion needs to be run twice
            cmake -DUSE_CCACHE=yes -DCMAKE_TOOLCHAIN_FILE=${FULL_PATH}/ot/android-cmake/android.toolchain.cmake -DANDROID_ABI=${arch} -DJAVA=ON -DANDROID_STL=gnustl_shared -DCMAKE_INSTALL_PREFIX=${FULL_PATH}/install/${arch}/ ${OT_PATH} || \
            cmake -DUSE_CCACHE=yes -DCMAKE_TOOLCHAIN_FILE=${FULL_PATH}/ot/android-cmake/android.toolchain.cmake -DANDROID_ABI=${arch} -DJAVA=ON -DANDROID_STL=gnustl_shared -DCMAKE_INSTALL_PREFIX=${FULL_PATH}/install/${arch}/ ${OT_PATH}
            make -j`nproc`
        )

        (
        cd ${FULL_PATH}/build/${arch}/lib
        for i in libJOpentxs.so libbigint.so liblucre.so libopentxs-ext*.so libopentxs-cash*.so libopentxs-basket*.so libopentxs-core*.so libopentxs-client*.so ../deps/libzmq_4/lib/libzmq.so libczmq.so; do
            cp $i ${FULL_PATH}/install/${arch}/lib/
        done
        )
        cp -r ${OT_PATH}/include/opentxs ${FULL_PATH}/install/${arch}/include/
        mkdir -p ${FULL_PATH}/install/${arch}/include/irrxml
        cp -r ${OT_PATH}/deps/irrxml/*.hpp ${FULL_PATH}/install/${arch}/include/irrxml/
        cp -r ${FULL_PATH}/build/${arch}/wrappers/java/otx_java/ install/${arch}/
done

OT_VERSION="`cd ${OT_PATH};git describe`"
tar cjf opentxs-${OT_VERSION}.tar.bz2 install
