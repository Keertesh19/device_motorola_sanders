#!/sbin/sh

# 1802 - Brazil
# 1803 - Europe
# 1804 - India
# 1805 - Europe
# 1806 - USA

if [ $(getprop ro.boot.hardware.sku) == "XT1806" ]; then
    # XT1806 doesn't have NFC chip
    rm /vendor/etc/permissions/android.hardware.nfc.xml
    rm /vendor/etc/permissions/android.hardware.nfc.hce.xml
    rm /vendor/etc/permissions/android.hardware.nfc.hcef.xml
    rm /vendor/etc/permissions/com.android.nfc_extras.xml
    rm -r /system/system/app/NfcNci
fi

if [ $(getprop ro.boot.hardware.sku) != "XT1802" ]; then
    # Others variants doesn't have DTV support
    rm /vendor/etc/permissions/com.motorola.hardware.dtv.xml
    rm /vendor/etc/permissions/mot_dtv_permissions.xml
    rm /vendor/lib/libdtvtuner.so
    rm /vendor/lib64/libdtvtuner.so
    rm /vendor/lib/libdtvhal.so
    rm /vendor/lib64/libdtvhal.so
    rm -r /vendor/app/DTVPlayer
    rm -r /vendor/app/DTVService
fi

if [ $(getprop ro.boot.hardware.sku) == "XT1804" ]; then
    rm /vendor/etc/thermal-engine.conf
    mv /vendor/etc/thermal-engine-INDIA.conf /vendor/etc/thermal-engine.conf
else
    rm /vendor/etc/thermal-engine-INDIA.conf
fi
