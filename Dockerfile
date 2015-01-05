FROM ubuntu:14.04

MAINTAINER Martin Hamrle "martin.hamrle@monetas.net"

WORKDIR /home/otbuilder/

#install the following dependencies;
RUN set +x; \
		apt-get update \
		&& apt-get install -y software-properties-common --no-install-recommends \
		&& add-apt-repository ppa:hamrle/ppa \
		&& apt-get update \
		&& apt-get install -y make cmake libssl-dev protobuf-compiler libprotobuf-dev g++ libzmq3-dev libzmq3 git python3-dev swig3.0 p7zip-full curl --no-install-recommends \
		&& ln -s /usr/bin/swig3.0 /usr/bin/swig \
		&& apt-get autoremove
ENV DEBIAN_FRONTEND noninteractive
RUN set +x; \
		dpkg-reconfigure locales \
		&& locale-gen C.UTF-8 \
		&& update-locale LANG=C.UTF-8 || true 
#ENV LC_ALL C.UTF-8

RUN set +x; \
		apt-get install -y cppcheck ccache clang-format-3.5 

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

# setup a non-root user
RUN useradd -ms /bin/bash otuser
# become otuser and create build folder but check if it already exists 
USER otuser
ENV HOME /home/otuser
WORKDIR /home/otuser

ADD .gitignore .gitmodules run-build.sh AndroidManifest.xml Android.mk default.properties genproto.sh getProtobufLibrary.sh /home/otuser/ot-android/
ADD ot /home/otuser/ot-android/ot
ADD .git /home/otuser/ot-android/.git
ADD jni /home/otuser/ot-android/jni

#ADD ../opentxs /home/otuser/opentxs

USER root
RUN chown -R otuser:otuser /home/otuser/
USER otuser
RUN set +x; \
		cd /home/otuser/ot-android/ \
		&& OT_PATH=/home/otuser/ot-android/ot/opentxs/ ./run-build.sh
USER root

