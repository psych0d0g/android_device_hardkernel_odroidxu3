#!/system/xbin/bash

echo "Calling modeswitch when a compatible usb modem is attached"

for i in $(lsusb | cut -d " " -f 6 | tr \: _)
do
	if test -f "/system/etc/usb_modeswitch.d/${i}"
	then
		VID=$(echo ${i} | cut -f1 -d:)
		PID=$(echo ${i} | cut -f2 -d:)
		usb_modeswitch -v ${VID} -p ${PID} -c /system/etc/usb_modeswitch.d/${i}
	fi
done
