#
# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

#
# This is the product configuration for a generic CDMA sholes,
# not specialized for any geography.
#

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

## (1) First, the most specific values, i.e. the aspects that are specific to CDMA

PRODUCT_COPY_FILES += \
    device/moto/sholes/init.sholes.rc:root/init.sholes.rc \
    device/moto/sholes/uevent.sholes.rc:root/uevent.sholes.rc

#    device/mot/sholes/init.rc:root/init.rc \

## (2) Also get non-open-source CDMA-specific aspects if available
$(call inherit-product-if-exists, vendor/motorola/sholes/sholes-vendor.mk)

## (3)  Finally, the least specific parts, i.e. the non-CDMA-specific aspects
PRODUCT_PROPERTY_OVERRIDES += \
	ro.com.android.wifi-watchlist=GoogleGuest \
	ro.error.receiver.system.apps=com.google.android.feedback \
	ro.setupwizard.enterprise_mode=1 \
	ro.com.google.clientidbase=android-verizon \
	ro.com.google.locationfeatures=1 \
	ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
	ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
	ro.cdma.home.operator.numeric=310004 \
	ro.cdma.home.operator.alpha=Verizon \
	ro.cdma.homesystem=64,65,76,77,78,79,80,81,82,83 \
	ro.cdma.data_retry_config=default_randomization=2000,0,0,120000,180000,540000,960000 \
	ro.config.vc_call_vol_steps=7 \
	ro.telephony.call_ring.multiple=false \
	ro.telephony.call_ring.delay=3000 \
	ro.url.safetylegal=http://www.motorola.com/staticfiles/Support/legal/?model=A855 \
	ro.setupwizard.enable_bypass=1 \
	ro.media.dec.jpeg.memcap=20000000 \
    	keyguard.no_require_sim=true \
   	ro.com.android.dataroaming=true \
    	ro.com.android.dateformat=MM-dd-yyyy \
    	ro.config.ringtone=Ring_Synth_04.ogg \
    	ro.config.notification_sound=pixiedust.ogg \
        dalvik.vm.heapstartsize=5m \
        dalvik.vm.heapsize=48m
#        debug.sf.hw=1

#        ro.sf.hwrotation=90 \
#        debug.sf.ddms=1 \

DEVICE_PACKAGE_OVERLAYS += device/moto/sholes/overlay

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \


# media config xml file
PRODUCT_COPY_FILES += \
    device/moto/sholes/media_profiles.xml:system/etc/media_profiles.xml

#key layouts
PRODUCT_COPY_FILES += \
    device/moto/sholes/qtouch-touchscreen.idc:system/usr/idc/qtouch-touchscreen.idc \
    device/moto/sholes/qtouch-touchscreen.kl:system/usr/keylayout/qtouch-touchscreen.kl \
    device/moto/sholes/sholes-keypad.kl:system/usr/keylayout/sholes-keypad.kl \
    device/moto/sholes/AVRCP.kl:system/usr/keylayouts/AVRCP.kl \
    device/moto/sholes/cpcap-key.kl:system/usr/keylayout/cpcap-key.kl \
    device/moto/sholes/sholes-keypad.kcm:system/usr/keychars/sholes-keypad.kcm \
    device/moto/sholes/sholes-keypad.idc:system/usr/idc/sholes-keypad.idc \
    device/moto/sholes/cpcap-key.kcm:system/usr/keychars/cpcap-key.kcm \
    device/moto/sholes/vold.fstab:system/etc/vold.fstab \
    device/moto/sholes/prebuilt/etc/audio_policy.conf:system/etc/audio_policy.conf \
    device/moto/sholes/prebuilt/default.prop:system/default.prop \
    device/moto/sholes/prebuilt/etc/wifi/dnsmasq.conf:system/etc/wifi/dnsmasq.conf \
    device/moto/sholes/prebuilt/etc/wifi/tiwlan_ap.ini:/system/etc/wifi/tiwlan_ap.ini \
    device/moto/sholes/prebuilt/etc/wifi/tiwlan.ini:/system/etc/wifi/tiwlan.ini \
    device/moto/sholes/prebuilt/etc/wifi/wpa_supplicant.conf:/system/etc/wifi/wpa_supplicant.conf \
    device/moto/sholes/prebuilt/etc/init.d/10overclock:/system/etc/init.d/10overclock \
    device/moto/sholes/prebuilt/etc/init.d/01sysctl:/system/etc/init.d/01sysctl \
    device/moto/sholes/prebuilt/etc/init.d/05mountsd:/system/etc/init.d/05mountsd \
    device/moto/sholes/prebuilt/etc/init.d/07app2ext:/system/etc/init.d/07app2ext \
    device/moto/sholes/prebuilt/etc/init.d/08lib2ext:/system/etc/init.d/08lib2ext \
    device/moto/sholes/prebuilt/etc/init.d/60autoboot_or:/system/etc/init.d/60autoboot_or \
    device/moto/sholes/prebuilt/etc/location.cfg:/system/etc/location.cfg \
    device/moto/sholes/prebuilt/etc/powervr.ini:/system/etc/powervr.ini \
    device/moto/sholes/prebuilt/etc/gpsconfig.xml:/system/etc/gpsconfig.xml \
    device/moto/sholes/prebuilt/etc/excluded-input-devices.xml:/system/etc/excluded-input-devices.xml \
    device/moto/sholes/prebuilt/etc/rootfs/default.prop:/system/etc/rootfs/default.prop \
    device/moto/sholes/prebuilt/etc/rootfs/init.rc:/system/etc/rootfs/init.rc \
    device/moto/sholes/prebuilt/etc/rootfs/init.mapphone_umts.rc:/system/etc/rootfs/init.mapphone_umts.rc \
    device/moto/sholes/prebuilt/etc/rootfs/ueventd.rc:/system/etc/rootfs/ueventd.rc \
    device/moto/sholes/prebuilt/lib/libgki.so:/system/lib/libgki.so \
    device/moto/sholes/prebuilt/lib/modules/symsearch.ko:/system/lib/modules/symsearch.ko \
    device/moto/sholes/prebuilt/lib/modules/pvr-off.ko:/system/lib/modules/pvr-off.ko \
    device/moto/sholes/prebuilt/lib/modules/pvrsrvkm.ko:/system/lib/modules/pvrsrvkm.ko \
    device/moto/sholes/prebuilt/lib/modules/omaplfb.ko:/system/lib/modules/omaplfb.ko \
    device/moto/sholes/prebuilt/lib/modules/mot_usb.ko:/system/lib/modules/mot_usb.ko \
    device/moto/sholes/prebuilt/lib/modules/tiwlan_drv.ko:/system/lib/modules/tiwlan_drv.ko \
    device/moto/sholes/prebuilt/lib/modules/tiap_drv.ko:/system/lib/modules/tiap_drv.ko \
    device/moto/sholes/prebuilt/lib/modules/dsifix.ko:/system/lib/modules/dsifix.ko \
    device/moto/sholes/prebuilt/lib/modules/slow-work.ko:/system/lib/modules/slow-work.ko \
    device/moto/sholes/prebuilt/lib/modules/iptable_raw.ko:/system/lib/modules/iptable_raw.ko \
    device/moto/sholes/prebuilt/lib/modules/xt_multiport.ko:/system/lib/modules/xt_multiport.ko \
    device/moto/sholes/prebuilt/lib/modules/xt_tcpmss.ko:/system/lib/modules/xt_tcpmss.ko \
    device/moto/sholes/prebuilt/lib/modules/xt_TCPMSS.ko:/system/lib/modules/xt_TCPMSS.ko \
    device/moto/sholes/prebuilt/lib/modules/ip6_tables.ko:/system/lib/modules/ip6_tables.ko \
    device/moto/sholes/prebuilt/lib/modules/ip6t_LOG.ko:/system/lib/modules/ip6t_LOG.ko \
    device/moto/sholes/prebuilt/lib/modules/ip6t_REJECT.ko:/system/lib/modules/ip6t_REJECT.ko \
    device/moto/sholes/prebuilt/lib/modules/ip6table_filter.ko:/system/lib/modules/ip6table_filter.ko \
    device/moto/sholes/prebuilt/lib/modules/ip6table_raw.ko:/system/lib/modules/ip6table_raw.ko \
    device/moto/sholes/prebuilt/lib/modules/xt_quota2.ko:/system/lib/modules/xt_quota2.ko \
    device/moto/sholes/prebuilt/lib/modules/xt_owner2.ko:/system/lib/modules/xt_owner2.ko \
    device/moto/sholes/prebuilt/lib/modules/overclock.ko:/system/lib/modules/overclock.ko \
    device/moto/sholes/prebuilt/lib/modules/cpufreq_interactive.ko:/system/lib/modules/cpufreq_interactive.ko \
    device/moto/sholes/prebuilt/lib/modules/cpufreq_smartass.ko:/system/lib/modules/cpufreq_smartass.ko \
    device/moto/sholes/prebuilt/lib/modules/cpufreq_conservative.ko:/system/lib/modules/cpufreq_conservative.ko \
    device/moto/sholes/prebuilt/lib/modules/cpufreq_stats.ko:/system/lib/modules/cpufreq_stats.ko \
    device/moto/sholes/prebuilt/lib/modules/jbd2.ko:/system/lib/modules/jbd2.ko \
    device/moto/sholes/prebuilt/lib/modules/ext4.ko:/system/lib/modules/ext4.ko \
    device/moto/sholes/prebuilt/lib/modules/tun.ko:/system/lib/modules/tun.ko \
    device/moto/sholes/prebuilt/lib/modules/cifs.ko:/system/lib/modules/cifs.ko \
    device/moto/sholes/prebuilt/lib/modules/nls_utf8.ko:/system/lib/modules/nls_utf8.ko \
    device/moto/sholes/prebuilt/lib/modules/lockd.ko:/system/lib/modules/lockd.ko \
    device/moto/sholes/prebuilt/lib/modules/auth_rpcgss.ko:/system/lib/modules/auth_rpcgss.ko \
    device/moto/sholes/prebuilt/lib/modules/rpcsec_gss_krb5.ko:/system/lib/modules/rpcsec_gss_krb5.ko \
    device/moto/sholes/prebuilt/lib/modules/sunrpc.ko:/system/lib/modules/sunrpc.ko \
    device/moto/sholes/prebuilt/lib/modules/nfs.ko:/system/lib/modules/nfs.ko \
    device/moto/sholes/prebuilt/lib/modules/qtouch_num.ko:/system/lib/modules/qtouch_num.ko \
    device/moto/sholes/prebuilt/lib/modules/dsprecovery.ko:/system/lib/modules/dsprecovery.ko \
    
# ICS sound
PRODUCT_PACKAGES += \
hcitool hciattach hcidump \
libaudioutils  audio.a2dp.default audio_policy.sholes \
libaudiohw_legacy audio.primary.omap3

PRODUCT_PACKAGES += \
    e2fsck \
    librs_jni \
    tiwlan.ini \
    dspexec \
    libbridge \
    wlan_cu \
    libtiOsLib \
    wlan_loader \
    libCustomWifi \
    wpa_supplicant.conf \
    dhcpcd.conf \
    iwmulticall \
    hostap \
    hostapd.conf \
    libhostapdcli \
    tiap_loader \
    tiap_cu \
    libOMX.TI.AAC.decode \
    libOMX.TI.AAC.encode \
    libOMX.TI.AMR.decode \
    libOMX.TI.AMR.encode \
    libOMX.TI.WBAMR.decode \
    libOMX.TI.WBAMR.encode \
    libLCML \
    libOMX_Core \
    libOMX.TI.Video.Decoder \
    libOMX.TI.Video.encoder \
    libOMX.TI.JPEG.Encoder \
    sensors.sholes \
    lights.sholes \
    camera.sholes \
    Usb \
    Torch \
    usbd \
    HwaSettings \
    make_ext4fs \
    fs_mgr

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# sholes uses high-density artwork where available
PRODUCT_LOCALES += hdpi

PRODUCT_COPY_FILES += \
    device/moto/sholes/vold.fstab:system/etc/vold.fstab\
    device/moto/sholes/apns-conf.xml:system/etc/apns-conf.xml

# copy all kernel modules under the "modules" directory to system/lib/modules
PRODUCT_COPY_FILES += $(shell \
    find device/moto/sholes/modules -name '*.ko' \
    | sed -r 's/^\/?(.*\/)([^/ ]+)$$/\1\2:system\/lib\/modules\/\2/' \
    | tr '\n' ' ')

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/moto/sholes/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

# copy kernel
PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product-if-exists, vendor/motorola/sholes/sholes-vendor.mk)

# media profiles and capabilities spec
# $(call inherit-product, device/moto/sholes/media_a1026.mk)


# Put en_US first in the list, so make it default.
PRODUCT_LOCALES := en_US hdpi

# Get some sounds
$(call inherit-product-if-exists, frameworks/base/data/sounds/OriginalAudio.mk)

# Get the TTS language packs
#$(call inherit-product-if-exists, external/svox/pico/lang/all_pico_languages.mk)

# Get everything else from the parent package
$(call inherit-product-if-exists, build/target/product/generic_no_telephony.mk)

PRODUCT_DEFAULT_LANGUAGE := en_US

PRODUCT_NAME := generic_sholes
PRODUCT_DEVICE := sholes
