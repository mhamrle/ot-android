APP_PROJECT_PATH := $(shell pwd)

APP_PLATFORM := android-9

APP_ABI := x86

NDK_TOOLCHAIN_VERSION=4.8

#Apparently only GNU version supports C++ exceptions
#APP_STL := stlport_static
APP_STL := gnustl_static

APP_MODULES = libotapi_static
#APP_MODULES = libcrypto_static libssl_static libotapi_static

APP_CFLAGS := --std=c++11
# turn on C++ exceptions and run-time-type-identification (dynamic_cast)
APP_CPPFLAGS += -fexceptions -frtti

APP_BUILD_SCRIPT := $(APP_PROJECT_PATH)/Android.mk


