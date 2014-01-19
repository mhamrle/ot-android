# TO CONFIGURE FOR ANDROID:
#
#export CROSS_COMPILE=i686-linux-android
#export TOOLCHAIN_CPU=x86
#export TOOLCHAIN_VERSION=4.8
#export TARGET_PLATFORM_VER=9
#export BUILD_PLATFORM=darwin-x86_64
#export NDK=/Users/au/ndk
#export ANDR_SDK=/Users/au/android-sdk-macosx
#export PREBUILT=$NDK/toolchains/$TOOLCHAIN_CPU-$TOOLCHAIN_VERSION
#export PLATFORM=$NDK/platforms/android-$TARGET_PLATFORM_VER/arch-$TOOLCHAIN_CPU/
#export CC="$NDK/toolchains/$TOOLCHAIN_CPU-$TOOLCHAIN_VERSION/prebuilt/$BUILD_PLATFORM/bin/$CROSS_COMPILE-gcc"
#export CXX="$NDK/toolchains/$TOOLCHAIN_CPU-$TOOLCHAIN_VERSION/prebuilt/$BUILD_PLATFORM/bin/$CROSS_COMPILE-g++"
#export CFLAGS="-fPIC -DANDROID -nostdlib"
#export ANDROID_ROOT="$NDK"
#export ANDROID_NDK_ROOT=$ANDROID_ROOT
#export LDFLAGS="-Wl,-rpath-link=$ANDROID_ROOT/platforms/android-$TARGET_PLATFORM_VER/arch-$TOOLCHAIN_CPU/usr/lib/ -L$ANDROID_ROOT/platforms/android-$TARGET_PLATFORM_VER/arch-$TOOLCHAIN_CPU/usr/lib/"
#export CPPFLAGS="-I$ANDROID_ROOT/platforms/android-$TARGET_PLATFORM_VER/arch-$TOOLCHAIN_CPU/usr/include/"
#export LIBS="-lc "
#export PATH=$ANDR_SDK/tools:$ANDR_SDK/platform-tools:$NDK/toolchains/$TOOLCHAIN_CPU-$TOOLCHAIN_VERSION/prebuilt/$BUILD_PLATFORM/bin:$PATH
#./configure --host=x86-i686-linux-android --with-sysroot=$PLATFORM CC=$CC CXX=$CXX --enable-cross-compile --with-protoc=protoc LIBS=$LIBS


LOCAL_PATH := $(call my-dir)/protobuf

include $(CLEAR_VARS)

CC_LITE_ONLY_FILES := \
    src/google/protobuf/message_lite.cc                              \
    src/google/protobuf/wire_format_lite.cc                          \
    src/google/protobuf/io/zero_copy_stream_impl_lite.cc

ifeq ($(TARGET_ARCH),x86)
CC_PLATFORM_DEP_FILES := \
    src/google/protobuf/stubs/atomicops_internals_x86_gcc.cc
else
    CC_PLATFORM_DEP_FILES :=
endif

CC_LITE_SRC_FILES := \
    $(CC_LITE_ONLY_FILES)                                            \
    src/google/protobuf/stubs/common.cc                              \
    src/google/protobuf/stubs/once.cc                                \
    src/google/protobuf/extension_set.cc                             \
    src/google/protobuf/generated_message_util.cc                    \
    src/google/protobuf/repeated_field.cc                            \
    src/google/protobuf/io/coded_stream.cc                           \
    src/google/protobuf/io/zero_copy_stream.cc                       \
    $(CC_PLATFORM_DEP_FILES)

CC_PROTOBUF_SRC_FILES := \
    $(CC_LITE_SRC_FILES)                                             \
    src/google/protobuf/message.cc                                   \
    src/google/protobuf/wire_format.cc                               \
    src/google/protobuf/io/zero_copy_stream_impl.cc                  \
    src/google/protobuf/stubs/strutil.cc                             \
    src/google/protobuf/stubs/substitute.cc                          \
    src/google/protobuf/stubs/structurally_valid.cc                  \
    src/google/protobuf/descriptor.cc                                \
    src/google/protobuf/descriptor.pb.cc                             \
    src/google/protobuf/descriptor_database.cc                       \
    src/google/protobuf/dynamic_message.cc                           \
    src/google/protobuf/extension_set_heavy.cc                       \
    src/google/protobuf/generated_message_reflection.cc              \
    src/google/protobuf/reflection_ops.cc                            \
    src/google/protobuf/service.cc                                   \
    src/google/protobuf/text_format.cc                               \
    src/google/protobuf/unknown_field_set.cc                         \
    src/google/protobuf/io/gzip_stream.cc                            \
    src/google/protobuf/io/printer.cc                                \
    src/google/protobuf/io/tokenizer.cc                              \
    src/google/protobuf/compiler/importer.cc                         \
    src/google/protobuf/compiler/parser.cc                           \
    src/google/protobuf/stubs/stringprintf.cc                        \


COMPILER_SRC_FILES :=  \
    src/google/protobuf/descriptor.cc \
    src/google/protobuf/descriptor.pb.cc \
    src/google/protobuf/descriptor_database.cc \
    src/google/protobuf/dynamic_message.cc \
    src/google/protobuf/extension_set.cc \
    src/google/protobuf/extension_set_heavy.cc \
    src/google/protobuf/generated_message_reflection.cc \
    src/google/protobuf/generated_message_util.cc \
    src/google/protobuf/message.cc \
    src/google/protobuf/message_lite.cc \
    src/google/protobuf/reflection_ops.cc \
    src/google/protobuf/repeated_field.cc \
    src/google/protobuf/service.cc \
    src/google/protobuf/text_format.cc \
    src/google/protobuf/unknown_field_set.cc \
    src/google/protobuf/wire_format.cc \
    src/google/protobuf/wire_format_lite.cc \
    src/google/protobuf/compiler/code_generator.cc \
    src/google/protobuf/compiler/command_line_interface.cc \
    src/google/protobuf/compiler/importer.cc \
    src/google/protobuf/compiler/main.cc \
    src/google/protobuf/compiler/parser.cc \
    src/google/protobuf/compiler/plugin.cc \
    src/google/protobuf/compiler/plugin.pb.cc \
    src/google/protobuf/compiler/subprocess.cc \
    src/google/protobuf/compiler/zip_writer.cc \
    src/google/protobuf/compiler/cpp/cpp_enum.cc \
    src/google/protobuf/compiler/cpp/cpp_enum_field.cc \
    src/google/protobuf/compiler/cpp/cpp_extension.cc \
    src/google/protobuf/compiler/cpp/cpp_field.cc \
    src/google/protobuf/compiler/cpp/cpp_file.cc \
    src/google/protobuf/compiler/cpp/cpp_generator.cc \
    src/google/protobuf/compiler/cpp/cpp_helpers.cc \
    src/google/protobuf/compiler/cpp/cpp_message.cc \
    src/google/protobuf/compiler/cpp/cpp_message_field.cc \
    src/google/protobuf/compiler/cpp/cpp_primitive_field.cc \
    src/google/protobuf/compiler/cpp/cpp_service.cc \
    src/google/protobuf/compiler/cpp/cpp_string_field.cc \
    src/google/protobuf/compiler/java/java_enum.cc \
    src/google/protobuf/compiler/java/java_enum_field.cc \
    src/google/protobuf/compiler/java/java_extension.cc \
    src/google/protobuf/compiler/java/java_field.cc \
    src/google/protobuf/compiler/java/java_file.cc \
    src/google/protobuf/compiler/java/java_generator.cc \
    src/google/protobuf/compiler/java/java_helpers.cc \
    src/google/protobuf/compiler/java/java_message.cc \
    src/google/protobuf/compiler/java/java_message_field.cc \
    src/google/protobuf/compiler/java/java_primitive_field.cc \
    src/google/protobuf/compiler/java/java_service.cc \
    src/google/protobuf/compiler/javamicro/javamicro_enum.cc \
    src/google/protobuf/compiler/javamicro/javamicro_enum_field.cc \
    src/google/protobuf/compiler/javamicro/javamicro_field.cc \
    src/google/protobuf/compiler/javamicro/javamicro_file.cc \
    src/google/protobuf/compiler/javamicro/javamicro_generator.cc \
    src/google/protobuf/compiler/javamicro/javamicro_helpers.cc \
    src/google/protobuf/compiler/javamicro/javamicro_message.cc \
    src/google/protobuf/compiler/javamicro/javamicro_message_field.cc \
    src/google/protobuf/compiler/javamicro/javamicro_primitive_field.cc \
    src/google/protobuf/compiler/python/python_generator.cc \
    src/google/protobuf/io/coded_stream.cc \
    src/google/protobuf/io/gzip_stream.cc \
    src/google/protobuf/io/printer.cc \
    src/google/protobuf/io/tokenizer.cc \
    src/google/protobuf/io/zero_copy_stream.cc \
    src/google/protobuf/io/zero_copy_stream_impl.cc \
    src/google/protobuf/io/zero_copy_stream_impl_lite.cc \
    src/google/protobuf/stubs/common.cc \
    src/google/protobuf/stubs/once.cc \
    src/google/protobuf/stubs/structurally_valid.cc \
    src/google/protobuf/stubs/strutil.cc \
    src/google/protobuf/stubs/substitute.cc

# C++ full library
# =======================================================
#include $(CLEAR_VARS)

LOCAL_MODULE := libprotobuf
LOCAL_MODULE_TAGS := optional

LOCAL_CPP_EXTENSION := .cc

LOCAL_SRC_FILES := \
    $(CC_LITE_SRC_FILES)                                             \

# NOTE: Use CC_PROTOBUF_SRC_FILES instead of CC_LITE_SRC_FILES above,
# if you want to build the full version of protocol buffers instead of
# the lite version.

LOCAL_C_INCLUDES := \
    $(LOCAL_PATH)/src

LOCAL_C_INCLUDES := \
    $(LOCAL_PATH)/src \
    $(JNI_H_INCLUDE)

LOCAL_SHARED_LIBRARIES := \
    libz libcutils libutils

LOCAL_LDLIBS := -lz

# stlport conflicts with the host stl library
#ifneq ($(TARGET_SIMULATOR),true)
#LOCAL_C_INCLUDES += external/stlport/stlport
#LOCAL_SHARED_LIBRARIES += libstlport
#endif
#
# NOTE: I think I have rtti, so no need to remove it.
#LOCAL_CFLAGS := -DGOOGLE_PROTOBUF_NO_RTTI

include $(BUILD_SHARED_LIBRARY)




