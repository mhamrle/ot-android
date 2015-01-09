FROM opentxs:latest

MAINTAINER Martin Hamrle "martin.hamrle@monetas.net"

ADD .gitignore .gitmodules run-build.sh AndroidManifest.xml Android.mk default.properties genproto.sh getProtobufLibrary.sh /home/otuser/ot-android/
ADD ot /home/otuser/ot-android/ot
ADD .git /home/otuser/ot-android/.git
ADD jni /home/otuser/ot-android/jni

WORKDIR /home/otuser/ot-android/
ENV OT_PATH /home/otuser/opentxs-source/
RUN ./run-build.sh
