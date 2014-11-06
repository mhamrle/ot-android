#!/bin/bash

set -e

FULL_PATH=$(pwd)

if [ -z "${ANDROID_NDK}" ] ; then
   echo "please set ANDROID_NDK"
   exit 1
fi

if [ -z "${OT_PATH}" ]; then
   OT_PATH=${FULL_PATH}/ot/Open-Transactions/
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
done
