LOCAL_PATH:= $(call my-dir)/zeromq

include $(CLEAR_VARS)

local_src_files := \
    builds/android/uuid/compare.c \
    builds/android/uuid/gen_uuid.c \
    builds/android/uuid/isnull.c \
    builds/android/uuid/parse.c \
    builds/android/uuid/unpack.c \
    builds/android/uuid/clear.c \
    builds/android/uuid/copy.c \
    builds/android/uuid/pack.c \
    builds/android/uuid/unparse.c \
    builds/android/uuid/uuid_time.c \
	src/clock.cpp \
	src/command.cpp \
	src/connect_session.cpp \
	src/ctx.cpp \
	src/decoder.cpp \
	src/device.cpp \
	src/devpoll.cpp \
	src/dist.cpp \
	src/encoder.cpp \
	src/epoll.cpp \
	src/err.cpp \
	src/fq.cpp \
	src/io_object.cpp \
	src/io_thread.cpp \
	src/ip.cpp \
	src/kqueue.cpp \
	src/lb.cpp \
	src/mailbox.cpp \
	src/named_session.cpp \
	src/object.cpp \
	src/options.cpp \
	src/own.cpp \
	src/pair.cpp \
	src/pgm_receiver.cpp \
	src/pgm_sender.cpp \
	src/pgm_socket.cpp \
	src/pipe.cpp \
	src/poll.cpp \
	src/poller_base.cpp \
	src/pub.cpp \
	src/pull.cpp \
	src/push.cpp \
	src/reaper.cpp \
	src/rep.cpp \
	src/req.cpp \
	src/select.cpp \
	src/session.cpp \
	src/signaler.cpp \
	src/socket_base.cpp \
	src/sub.cpp \
	src/swap.cpp \
	src/tcp_connecter.cpp \
	src/tcp_listener.cpp \
	src/tcp_socket.cpp \
	src/thread.cpp \
	src/transient_session.cpp \
	src/trie.cpp \
	src/uuid.cpp \
	src/xpub.cpp \
	src/xrep.cpp \
	src/xreq.cpp \
	src/xsub.cpp \
	src/zmq.cpp \
	src/zmq_connecter.cpp \
	src/zmq_engine.cpp \
	src/zmq_init.cpp \
	src/zmq_listener.cpp

local_c_includes := \
    $(LOCAL_PATH)/src \
    $(LOCAL_PATH)/include \
    $(LOCAL_PATH)/builds/android \
    $(LOCAL_PATH)/builds/android/uuid \
    $(LOCAL_PATH)/../openssl-android/include


local_shared_libs := libcrypto

zmq_build_flags := -pthread

local_ld_libs := -lc -lm


#######################################

# target
include $(CLEAR_VARS)
LOCAL_SRC_FILES += $(local_src_files)
LOCAL_C_INCLUDES += $(local_c_includes)
LOCAL_CFLAGS += $(zmq_build_flags)
LOCAL_SHARED_LIBRARIES += $(local_shared_libs)
LOCAL_LDLIBS += $(local_ld_libs)
ifeq ($(TARGET_SIMULATOR),true)
    LOCAL_LDLIBS += -ldl
endif
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE:= libzeromq
include $(BUILD_SHARED_LIBRARY)

#######################################
# host shared library
ifeq ($(WITH_HOST_DALVIK),true)
    include $(CLEAR_VARS)
    LOCAL_SRC_FILES += $(local_src_files)
    LOCAL_C_INCLUDES += $(local_c_includes)
    LOCAL_CFLAGS += $(zmq_build_flags)
    LOCAL_SHARED_LIBRARIES += $(local_shared_libs)
    LOCAL_LDLIBS += $(local_ld_libs)
    LOCAL_MODULE_TAGS := optional
    LOCAL_MODULE:= libzeromq-host
    include $(BUILD_SHARED_LIBRARY)
endif

########################################
# host static library, which is used by some SDK tools.

#include $(CLEAR_VARS)
#LOCAL_SRC_FILES += $(local_src_files)
#LOCAL_C_INCLUDES += $(local_c_includes)
#LOCAL_CFLAGS += $(zmq_build_flags)
#LOCAL_STATIC_LIBRARIES += libcrypto_static libssl_static
#LOCAL_MODULE_TAGS := optional
#LOCAL_MODULE:= libzeromq_static
#include $(BUILD_STATIC_LIBRARY)




