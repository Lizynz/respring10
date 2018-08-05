export ARCHS = armv7 armv7s arm64
DEBUG = 0
export TARGET = iphone:clang:9.3

export SYSROOT = $(THEOS)/sdks/iPhoneOS9.3.sdk

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = Respring10
Respring10_FILES = Switch.xm
Respring10_FRAMEWORKS = UIKit
Respring10_LIBRARIES = flipswitch substrate
Respring10_INSTALL_PATH = /Library/Switches

include $(THEOS_MAKE_PATH)/bundle.mk

