#!/system/xbin/bash

echo "Calling modeswitch when a compatible usb modem is attached"

for i in $(lsusb | cut -d " " -f 6 | tr \: _)
do
	if test -f "/system/etc/usb_modeswitch/${i}"
	then
		usb_modeswitch -c /system/etc/usb_modeswitch/${i}
	fi
done
