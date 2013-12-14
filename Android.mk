LOCAL_PATH:= $(call my-dir)

# Clear variables here.
include $(CLEAR_VARS)

# Current module settings.
#LOCAL_MODULE := native

#LOCAL_SHARED_LIBRARIES := libotapi

#include $(BUILD_STATIC_LIBRARY)

# Include makefiles here. Its important that these 
# includes are done after the main module, explanation below.

# create a temp variable with the current path, because it 
# changes after each include.


ZPATH := $(LOCAL_PATH)

# NOTE: TEMPORARILY commenting this out so I don't have to wait for it to build
# while working on protobuf build.
#


include $(ZPATH)/ot/openssl-android/Android.mk

include $(ZPATH)/ot/protobuf.mk

include $(ZPATH)/ot/zeromq.mk

include $(ZPATH)/ot/Android.mk





