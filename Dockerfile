FROM opentxs:latest

MAINTAINER Martin Hamrle "martin.hamrle@monetas.net"

RUN apt-get install -y --no-install-recommends p7zip-full curl automake autoconf libtool && apt-get autoremove

# Install android ndk
ENV ANDROID_NDK_VERSION r10c
#http://dl.google.com/android/ndk/android-ndk-r10c-linux-x86_64.bin
RUN curl -L http://dl.google.com/android/ndk/android-ndk-$ANDROID_NDK_VERSION-linux-x86_64.bin \
    -o /tmp/android-ndk-$ANDROID_NDK_VERSION-linux-x86_64.bin && \
    7z x /tmp/android-ndk-$ANDROID_NDK_VERSION-linux-x86_64.bin -o/usr/local && \
    ln -sf /usr/local/android-ndk-$ANDROID_NDK_VERSION /usr/local/android-ndk && \
    rm -rf /tmp/android-ndk-$ANDROID_NDK_VERSION-linux-x86_64.bin

ENV ANDROID_NDK /usr/local/android-ndk

##########

ADD .gitignore .gitmodules run-build.sh AndroidManifest.xml Android.mk default.properties genproto.sh getProtobufLibrary.sh /home/otuser/ot-android/
ADD ot /home/otuser/ot-android/ot
ADD .git /home/otuser/ot-android/.git
ADD jni /home/otuser/ot-android/jni

WORKDIR /home/otuser/ot-android/
ENV OT_PATH /home/otuser/opentxs-source/
RUN ./run-build.sh
