#!/system/xbin/bash

echo "Calling modeswitch when a compatible usb modem is attached"
ether_disabled=$(getprop ro.disable.ethernet)
if [[ "${ether_disabled}" -eq 1 ]]
then
	for device in $(lsusb | cut -d " " -f 6 | tr \: _)
	do
		if test -f "/system/etc/usb_modeswitch.d/${device}"
		then
			VID=$(echo ${i} | cut -f1 -d_)
			PID=$(echo ${i} | cut -f2 -d_)
			usb_modeswitch -v ${VID} -p ${PID} -c /system/etc/usb_modeswitch.d/${device}
		fi
	done
fi
