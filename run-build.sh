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

for arch in ${BUILD_ARCHS:-armeabi armeabi-v7a x86 mips}; do
        $ANDROID_NDK/ndk-build APP_ABI="$arch" -j`nproc`

        mkdir -p install/${arch}/
        mkdir -p install/${arch}/lib/
        mkdir -p install/${arch}/include/

        cp -r ot/protobuf-2.5.0/src/google/ install/${arch}/include/
        cp -r ot/openssl-android/include/openssl/ install/${arch}/include/
        for lib in libssl.so libprotobuf.so libcryptoot.so; do
                cp -r libs/${arch}/${lib} install/${arch}/lib//
        done
        ln -fs libcryptoot.so  install/${arch}/lib//libcrypto.so

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
        for i in libbigint.so liblucre.so libopentxs-ext* libopentxs-cash* libopentxs-basket* libopentxs-core* libopentxs-client* ../deps/libzmq_4/lib/libzmq.so; do
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
