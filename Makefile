ARCHS := armv7 armv7s arm64 arm64e
TARGET := iphone:clang:11.2:8.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = NoFolderBadge
$(TWEAK_NAME)_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
