https://github.com/IntelRealSense/librealsense
https://www.intelrealsense.com/developers#firmware

Installing the packages:

    Add Intel server to the list of repositories :
    echo 'deb http://realsense-hw-public.s3.amazonaws.com/Debian/apt-repo xenial main' | sudo tee /etc/apt/sources.list.d/realsense-public.list
    It is recommended to backup /etc/apt/sources.list.d/realsense-public.list file in case of an upgrade.
    Register the server’s public key :
    sudo apt-key adv --keyserver keys.gnupg.net --recv-key 6F3EFCDE
    Refresh the list of repositories and packages available :
    sudo apt-get update
    In order to run demos install:
    sudo apt-get install librealsense2-dkms
    sudo apt-get install librealsense2-utils
    The above two lines will deploy librealsense2 udev rules, kernel drivers, runtime library and executable demos and tools. Reconnect the Intel RealSense depth camera and run: realsense-viewer
    Developers shall install additional packages:
    sudo apt-get install librealsense2-dev
    sudo apt-get install librealsense2-dbg
    With dev package installed, you can compile an application with librealsense using g++ -std=c++11 filename.cpp -lrealsense2 or an IDE of your choice.
    Verify that the kernel is updated :
    modinfo uvcvideo | grep "version:" should include realsense string

Package Details:

The packages and their respective content are listed below:
Name	Content	Depends on
librealsense2-udev-rules	Manages the devices permissions configuration for	–
realsense-uvcvideo	DKMS package for Depth cameras-specific kernel extensions	librealsense2-udev-rules
librealsense2	RealSense™ SDK runtime (.so) and configuration files	librealsense2-udev-rules
librealsense2-utils	Demos and tools available as a part of RealSense™ SDK	librealsense2
librealsense2-dev	Header files and symbolic link for developers	librealsense2
librealsense2-dbg	Debug symbols for developers	librealsense2



RealSense UDEV-Rules file:
 /lib/udev/rules.d/60-librealsense2-udev-rules.rules
 is not up-to date!
UDEV-Rules permissions configuration
 for RealSense devices.`
Missing/outdated UDEV-Rules will cause 'Permissions Denied' errors
unless the application is running under 'sudo' (not recommended)
In case of Debians use:
sudo apt-get upgrade/install librealsense2-udev-rules
To manually install UDEV-Rules in terminal run:
$ sudo cp ~/.99-realsense-libusb.rules /etc/udev/rules.d/99-realsense-libusb.rules && sudo udevadm control --reload-rules && udevadm trigger



Multiple realsense udev-rules were found! :
1:/etc/udev/rules.d/99-realsense-libusb.rules
2: /lib/udev/rules.d/60-librealsense2-udev-rules.rules
Make sure to remove redundancies!
