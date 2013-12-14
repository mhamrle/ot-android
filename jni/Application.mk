APP_PROJECT_PATH := $(shell pwd)

APP_PLATFORM := android-8

APP_ABI := x86

NDK_TOOLCHAIN_VERSION=4.8

#Apparently only GNU version supports C++ exceptions
#APP_STL := stlport_static

APP_STL := gnustl_shared

#APP_MODULES = native
APP_MODULES = libprotobuf libotapi

APP_CFLAGS := --std=c++11

# turn on C++ exceptions and run-time-type-identification (dynamic_cast)
APP_CPPFLAGS += -fexceptions -frtti

APP_BUILD_SCRIPT := $(APP_PROJECT_PATH)/ot/Android.mk

#APP_BUILD_SCRIPT := $(APP_PROJECT_PATH)/Android.mk
#APP_BUILD_SCRIPT := $(APP_PROJECT_PATH)/ot/protobuf.mk


