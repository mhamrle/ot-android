
# THIS FILE IS CURRENTLY UNUSED

#LOCAL_PATH:= $(call my-dir)

# Clear variables here.
#include $(CLEAR_VARS)

# Current module settings.
#LOCAL_MODULE := native

# setup some source files
##LOCAL_SRC_FILES := file1.c file2.c

# setup some includes
##LOCAL_C_INCLUDES := $(LOCAL_PATH)/libos/include

# setup the included libs for the main module
##LOCAL_STATIC_LIBRARIES := libcrypto_static libssl_static libotapi_static # note that order matters here

#LOCAL_SHARED_LIBRARIES := libotapi

#include $(BUILD_STATIC_LIBRARY)

# Include makefiles here. Its important that these 
# includes are done after the main module, explanation below.

# create a temp variable with the current path, because it 
# changes after each include
ZPATH := $(LOCAL_PATH)

##include $(ZPATH)/openssl-android/crypto/Android.mk
##include $(ZPATH)/openssl-android/ssl/Android.mk

include $(ZPATH)/ot/protobuf.mk
include $(ZPATH)/ot/Android.mk





