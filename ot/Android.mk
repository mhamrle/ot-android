LOCAL_PATH:= $(call my-dir)



local_src_files := \
	Open-Transactions/src/otapi/OTAPI.cpp \
	Open-Transactions/src/otapi/OTClient.cpp \
	Open-Transactions/src/otapi/OTServerConnection.cpp \
	Open-Transactions/src/otapi/OpenTransactions.cpp \
	Open-Transactions/src/otapi/OTAPI_Basic.cpp \
	Open-Transactions/src/otapi/OTMadeEasy.cpp \
	Open-Transactions/src/otapi/OT_ME.cpp \
	Open-Transactions/src/otlib/OTASCIIArmor.cpp \
	Open-Transactions/src/otlib/OTAccount.cpp \
	Open-Transactions/src/otlib/OTAgreement.cpp \
	Open-Transactions/src/otlib/OTAssetContract.cpp \
	Open-Transactions/src/otlib/OTAsymmetricKey.cpp \
	Open-Transactions/src/otlib/OTBasket.cpp \
	Open-Transactions/src/otlib/OTBylaw.cpp \
	Open-Transactions/src/otlib/OTCachedKey.cpp \
	Open-Transactions/src/otlib/OTCheque.cpp \
	Open-Transactions/src/otlib/OTContract.cpp \
	Open-Transactions/src/otlib/OTCredential.cpp \
	Open-Transactions/src/otlib/OTCron.cpp \
	Open-Transactions/src/otlib/OTCronItem.cpp \
	Open-Transactions/src/otlib/OTCrypto.cpp \
	Open-Transactions/src/otlib/OTData.cpp \
	Open-Transactions/src/otlib/OTDataCheck.cpp \
	Open-Transactions/src/otlib/OTDigitalCash.cpp \
	Open-Transactions/src/otlib/OTEnvelope.cpp \
	Open-Transactions/src/otlib/OTIdentifier.cpp \
	Open-Transactions/src/otlib/OTInstrument.cpp \
	Open-Transactions/src/otlib/OTItem.cpp \
	Open-Transactions/src/otlib/OTKeyring.cpp \
	Open-Transactions/src/otlib/OTLedger.cpp \
	Open-Transactions/src/otlib/OTLog.cpp \
	Open-Transactions/src/otlib/OTMarket.cpp \
	Open-Transactions/src/otlib/OTMessage.cpp \
	Open-Transactions/src/otlib/OTMessageBuffer.cpp \
	Open-Transactions/src/otlib/OTMint.cpp \
	Open-Transactions/src/otlib/OTOffer.cpp \
	Open-Transactions/src/otlib/OTPassword.cpp \
	Open-Transactions/src/otlib/OTPaths.cpp \
	Open-Transactions/src/otlib/OTPayload.cpp \
	Open-Transactions/src/otlib/OTPayment.cpp \
	Open-Transactions/src/otlib/OTPaymentPlan.cpp \
	Open-Transactions/src/otlib/OTPseudonym.cpp \
	Open-Transactions/src/otlib/OTPurse.cpp \
	Open-Transactions/src/otlib/OTScript.cpp \
	Open-Transactions/src/otlib/OTScriptable.cpp \
	Open-Transactions/src/otlib/OTServerContract.cpp \
	Open-Transactions/src/otlib/OTSettings.cpp \
	Open-Transactions/src/otlib/OTSignature.cpp \
	Open-Transactions/src/otlib/OTSignedFile.cpp \
	Open-Transactions/src/otlib/OTSmartContract.cpp \
	Open-Transactions/src/otlib/OTStorage.cpp \
	Open-Transactions/src/otlib/OTString.cpp \
	Open-Transactions/src/otlib/OTStringXML.cpp \
	Open-Transactions/src/otlib/OTSymmetricKey.cpp \
	Open-Transactions/src/otlib/OTToken.cpp \
	Open-Transactions/src/otlib/OTTrackable.cpp \
	Open-Transactions/src/otlib/OTTrade.cpp \
	Open-Transactions/src/otlib/OTTransaction.cpp \
	Open-Transactions/src/otlib/OTTransactionType.cpp \
	Open-Transactions/src/otlib/OTWallet.cpp \
	Open-Transactions/src/otlib/bigint/BigInteger.cc \
	Open-Transactions/src/otlib/bigint/BigIntegerAlgorithms.cc \
	Open-Transactions/src/otlib/bigint/BigIntegerUtils.cc \
	Open-Transactions/src/otlib/bigint/BigUnsigned.cc \
	Open-Transactions/src/otlib/bigint/BigUnsignedInABase.cc \
	Open-Transactions/src/otlib/irrxml/irrXML.cpp \
	Open-Transactions/src/otlib/lucre/bankimp.cpp \
	Open-Transactions/src/otlib/otext/Timer.cpp \
	Open-Transactions/src/otlib/otext/anyoption.cpp \
	Open-Transactions/src/otlib/otext/tinythread.cpp \
	Open-Transactions/src/otlib/otprotob/Bitcoin-lite.pb.cc \
	Open-Transactions/src/otlib/otprotob/Generics-lite.pb.cc \
	Open-Transactions/src/otlib/otprotob/Markets-lite.pb.cc \
	Open-Transactions/src/otlib/otprotob/Moneychanger-lite.pb.cc \
	Open-Transactions/src/otlib/simpleini/ConvertUTF.cpp \
	Open-Transactions/src/otlib/otext/mkcert.cpp \
	Open-Transactions/swig/otapi/OTAPI-java.cxx


local_c_includes := \
    $(LOCAL_PATH)/protobuf/src \
    $(LOCAL_PATH)/ChaiScript/include \
    $(LOCAL_PATH)/zeromq2-x/include \
    $(NDK_PROJECT_PATH)/../openssl-android/include \
	$(LOCAL_PATH)/Open-Transactions/include \
	$(LOCAL_PATH)/Open-Transactions/include/bigint \
	$(LOCAL_PATH)/Open-Transactions/include/containers \
	$(LOCAL_PATH)/Open-Transactions/include/irrxml \
	$(LOCAL_PATH)/Open-Transactions/include/lucre \
	$(LOCAL_PATH)/Open-Transactions/include/otapi \
	$(LOCAL_PATH)/Open-Transactions/include/otlib \
	$(LOCAL_PATH)/Open-Transactions/include/ots \
	$(LOCAL_PATH)/Open-Transactions/include/simpleini \
	$(LOCAL_PATH)/Open-Transactions/swig/otapi



local_shared_libs := libcrypto libssl libprotobuf


#local_ld_libs := -L$(NDK_PROJECT_PATH)/libs/
#local_ld_libs += -lprotobuf

#local_ld_libs := -L$(NDK_PROJECT_PATH)/../openssl-android/libs/
#local_ld_libs += -lcrypto -lssl


#warning: might need to put -pthread BEFORE exceptions and rtti (see Application.mk)

otapi_build_flags := -DOT_ZMQ_MODE -D_THREAD_SAFE -pthread


#local_ld_libs := -lzmq
#######################################

# target
include $(CLEAR_VARS)
# include $(LOCAL_PATH)/../android-config.mk
LOCAL_SRC_FILES += $(local_src_files)
LOCAL_C_INCLUDES += $(local_c_includes)
LOCAL_CFLAGS += $(otapi_build_flags)
LOCAL_SHARED_LIBRARIES += $(local_shared_libs)
#LOCAL_LDLIBS += $(local_ld_libs)
ifeq ($(TARGET_SIMULATOR),true)
    LOCAL_LDLIBS += -ldl
endif
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE:= libotapi
include $(BUILD_SHARED_LIBRARY)

#######################################
# host shared library
ifeq ($(WITH_HOST_DALVIK),true)
    include $(CLEAR_VARS)
#   include $(LOCAL_PATH)/../android-config.mk
    LOCAL_SRC_FILES += $(local_src_files)
    LOCAL_C_INCLUDES += $(local_c_includes)
    LOCAL_CFLAGS += $(otapi_build_flags)
    LOCAL_SHARED_LIBRARIES += $(local_shared_libs)
#   LOCAL_LDLIBS += $(local_ld_libs)
    LOCAL_MODULE_TAGS := optional
    LOCAL_MODULE:= libotapi-host
    include $(BUILD_SHARED_LIBRARY)
endif

########################################
# host static library, which is used by some SDK tools.

#include $(CLEAR_VARS)
#LOCAL_SRC_FILES += $(local_src_files)
#LOCAL_C_INCLUDES += $(local_c_includes)
#LOCAL_CFLAGS += $(otapi_build_flags)
#LOCAL_STATIC_LIBRARIES += libcrypto_static libssl_static
#LOCAL_MODULE_TAGS := optional
#LOCAL_MODULE:= libotapi_static
#include $(BUILD_STATIC_LIBRARY)


#$(call import-add-path,"/Users/au/Projects/openssl-android")
#$(call import-module,ssl)



# libprotobuf
include $(CLEAR_VARS)
LOCAL_MODULE := protobuf
include $(LOCAL_PATH)/protobuf.mk



$(call import-module,openssl-android)







