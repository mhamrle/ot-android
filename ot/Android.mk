LOCAL_PATH:= $(call my-dir)


local_src_files := \
	otapi/OTAPI.cpp \
	otapi/OTClient.cpp \
	otapi/OTServerConnection.cpp \
	otapi/OpenTransactions.cpp \
	otapi/OTAPI_Basic.cpp \
	otapi/OTMadeEasy.cpp \
	otapi/OT_ME.cpp \
	otlib/OTASCIIArmor.cpp \
	otlib/OTAccount.cpp \
	otlib/OTAgreement.cpp \
	otlib/OTAssetContract.cpp \
	otlib/OTAsymmetricKey.cpp \
	otlib/OTBasket.cpp \
	otlib/OTBylaw.cpp \
	otlib/OTCachedKey.cpp \
	otlib/OTCheque.cpp \
	otlib/OTContract.cpp \
	otlib/OTCredential.cpp \
	otlib/OTCron.cpp \
	otlib/OTCronItem.cpp \
	otlib/OTCrypto.cpp \
	otlib/OTData.cpp \
	otlib/OTDataCheck.cpp \
	otlib/OTDigitalCash.cpp \
	otlib/OTEnvelope.cpp \
	otlib/OTIdentifier.cpp \
	otlib/OTInstrument.cpp \
	otlib/OTItem.cpp \
	otlib/OTKeyring.cpp \
	otlib/OTLedger.cpp \
	otlib/OTLog.cpp \
	otlib/OTMarket.cpp \
	otlib/OTMessage.cpp \
	otlib/OTMessageBuffer.cpp \
	otlib/OTMint.cpp \
	otlib/OTOffer.cpp \
	otlib/OTPassword.cpp \
	otlib/OTPaths.cpp \
	otlib/OTPayload.cpp \
	otlib/OTPayment.cpp \
	otlib/OTPaymentPlan.cpp \
	otlib/OTPseudonym.cpp \
	otlib/OTPurse.cpp \
	otlib/OTScript.cpp \
	otlib/OTScriptable.cpp \
	otlib/OTServerContract.cpp \
	otlib/OTSettings.cpp \
	otlib/OTSignature.cpp \
	otlib/OTSignedFile.cpp \
	otlib/OTSmartContract.cpp \
	otlib/OTStorage.cpp \
	otlib/OTString.cpp \
	otlib/OTStringXML.cpp \
	otlib/OTSymmetricKey.cpp \
	otlib/OTToken.cpp \
	otlib/OTTrackable.cpp \
	otlib/OTTrade.cpp \
	otlib/OTTransaction.cpp \
	otlib/OTTransactionType.cpp \
	otlib/OTWallet.cpp \
	otlib/bigint/BigInteger.cc \
	otlib/bigint/BigIntegerAlgorithms.cc \
	otlib/bigint/BigIntegerUtils.cc \
	otlib/bigint/BigUnsigned.cc \
	otlib/bigint/BigUnsignedInABase.cc \
	otlib/irrxml/irrXML.cpp \
	otlib/lucre/bankimp.cpp \
	otlib/otext/Timer.cpp \
	otlib/otext/anyoption.cpp \
	otlib/otext/tinythread.cpp \
	otlib/otprotob/Bitcoin.cc \
	otlib/otprotob/Generics.cc \
	otlib/otprotob/Markets.cc \
	otlib/otprotob/Moneychanger.cc \
	otlib/simpleini/ConvertUTF.cpp \
	otlib/otext/easyzlib.c \
	otlib/otext/mkcert.c \
	../swig/otapi/OTAPI-java.cxx


local_c_includes := \
	$(NDK_PROJECT_PATH) \
	$(NDK_PROJECT_PATH)/include \
	$(NDK_PROJECT_PATH)/include/bigint \
	$(NDK_PROJECT_PATH)/include/containers \
	$(NDK_PROJECT_PATH)/include/irrxml \
	$(NDK_PROJECT_PATH)/include/lucre \
	$(NDK_PROJECT_PATH)/include/otapi \
	$(NDK_PROJECT_PATH)/include/otlib \
	$(NDK_PROJECT_PATH)/include/ots \
	$(NDK_PROJECT_PATH)/include/simpleini \
	$(NDK_PROJECT_PATH)/swig/otapi


local_ld_libs := -lprotobuf -D_THREAD_SAFE -lzmq -lmsgpack -lssl -lcrypto


#######################################

# target
include $(CLEAR_VARS)
include $(LOCAL_PATH)/../android-config.mk
LOCAL_SRC_FILES += $(local_src_files)
LOCAL_C_INCLUDES += $(local_c_includes)
LOCAL_LDLIBS += $(local_ld_libs)
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
    include $(LOCAL_PATH)/../android-config.mk
    LOCAL_SRC_FILES += $(local_src_files)
    LOCAL_C_INCLUDES += $(local_c_includes)
    LOCAL_LDLIBS += $(local_ld_libs)
    LOCAL_MODULE_TAGS := optional
    LOCAL_MODULE:= libotapi
    include $(BUILD_SHARED_LIBRARY)
endif

########################################
# host static library, which is used by some SDK tools.

include $(CLEAR_VARS)
include $(LOCAL_PATH)/../android-config.mk
LOCAL_SRC_FILES += $(local_src_files)
LOCAL_C_INCLUDES += $(local_c_includes)
LOCAL_LDLIBS += $(local_ld_libs)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE:= libotapi_static
include $(BUILD_STATIC_LIBRARY)
