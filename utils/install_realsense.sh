

echo 'deb http://realsense-hw-public.s3.amazonaws.com/Debian/apt-repo xenial main' | sudo tee /etc/apt/sources.list.d/realsense-public.list
sudo apt-key adv --keyserver keys.gnupg.net --recv-key 6F3EFCDE
sudo apt-get update
sudo apt-get install librealsense2-dkms
sudo apt-get install librealsense2-utils

#RULES
sudo apt-get install librealsense2-udev-rules
sudo rm /lib/udev/rules.d/60-librealsense2-udev-rules.rules
sudo cp ~/.99-realsense-libusb.rules /etc/udev/rules.d/99-realsense-libusb.rules && sudo udevadm control --reload-rules && udevadm trigger
realsense-viewer

#DEVELOP
#check https://www.intelrealsense.com/developers#firmware
sudo apt-get install librealsense2-dev
sudo apt-get install librealsense2-dbg
