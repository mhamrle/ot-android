LOCAL_PATH:= $(call my-dir)

# Clear variables here.
include $(CLEAR_VARS)


# Include makefiles here. Its important that these 
# includes are done after the main module, explanation below.

# Create a temp variable with the current path, because it
# changes after each include.

ZPATH := $(LOCAL_PATH)

include $(ZPATH)/ot/openssl-android/Android.mk

include $(ZPATH)/ot/protobuf.mk

include $(ZPATH)/ot/zeromq.mk

include $(ZPATH)/ot/Android.mk





