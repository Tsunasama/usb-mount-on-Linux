#!/bin/bash

quit(){
clear
echo "*********************************"
echo "*      Thanks for using         *"
echo "*********************************"
exit 0
}

mountUsb(){
clear
mkdir -p /mnt/usb
fdisk -l | grep dev/sda
echo -e "Please Enter the usb device above:\c"
read usbDevice
mount /dev/${usbDevice} /mnt/usb
}

unmountUsb(){
clear
umount /mnt/usb
}

display(){
clear
ls -l /mnt/usb
}

copyToUsb(){
clear
echo "Please Enter the fileName in the disk to usb:\c"
read FILE
echo "Now coping..."
cp $FILE /mnt/usb/$FILE
}

copyToDisk(){
clear
echo "Please Enter the fileName in the usb to disk:\c"
read FILE
echo "Now coping..."
cp /mnt/usb/$FILE
}
clear
while :
do
echo "----------------------------------"
echo "    welcome to use usb manager    "
echo "----------------------------------"
echo "     1-MOUNT USB                  "
echo "     2-UNMOUNT USB                "
echo "     3-DISPLAY USB INFO           "
echo "     4-COPY FILE IN DISK TO USB   "
echo "     5-COPY FILE IN USB TO DISK   "
echo "     0-EXIT                       "
echo "----------------------------------"
echo -e "Please enter your choice (0--5):\c"
read CHOICE
case $CHOICE in
1)mountUsb ;;
2)unmountUsb ;;
3)display ;;
4)copyToUsb ;;
5)copyToDisk ;;
0)quit ;;
*)echo "Invalid choice!Please choose 0 to 5 only"
clear ;;
esac
done