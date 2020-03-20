#放置位置:/usr/lib/systemd/system-sleep/touchpad-fix.sh
#chmod +x /usr/lib/systemd/system-sleep/touchpad-fix.sh

#if [ "$1" = "post" ] && exec rmmod i2c_hid; modprobe i2c_hid
if [ "$1" = "post" ] && exec rmmod rmi_smbus; modprobe rmi_smbus 
