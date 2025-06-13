HydraSDR RFOne
==============

A tiny, efficient and ultra evolutive software defined radio.

This repository contains host software (Linux/Windows) for HydraSDR RFOne, a project to
produce a low cost and extensible open source software radio platform.

HydraSDR: https://www.hydrasdr.com

### Warnings about libusb v1.0.24 on Windows & GNU/Linux (use newer version libusb 1.0.25 or latest version)
It is not recommended to use libusb v1.0.24 especially on Windows as there is tons of known issues it is why we are using libusb v1.0.23
See all major issues affecting libusb v1.0.24:
* https://github.com/libusb/libusb/issues/850 Regression in libusb 1.0.24 under Linux -- buggy devices with configuration 0 #850 
* https://github.com/libusb/libusb/issues/858 Regression in 1.0.24: libusb_handle_events_timeout_completed not waiting on timeout #858 
* https://github.com/libusb/libusb/issues/913 Regression in 1.0.24: libusb 1.0.24 uses a lot of cpu in libusb_bulk_transfer under Linux #913 
* https://github.com/libusb/libusb/issues/994 1.0.24 - windows_exit hangs when exiting on with WinUSB #994 
* https://github.com/libusb/libusb/issues/982 libusb_set_interface_alt_setting(...) crashes in 1.0.24 in Win10. #982
For more details see https://github.com/libusb/libusb/issues & https://github.com/libusb/libusb/issues/777

## How to build rfone_host software on Windows:

### Prerequisites for MSYS2/MinGW64:

* cmake-3.10 or more see http://www.cmake.org/cmake/resources/software.html
* libusb-1.0.23 see https://github.com/libusb/libusb/releases/download/v1.0.23/libusb-1.0.23.7z
* For Windows OS less than Vista Install Windows driver for HydraSDR hardware or use Zadig see http://sourceforge.net/projects/libwdi/files/zadig
  - If you want to use Zadig  select HydraSDR USB device and just install/replace it with WinUSB driver.

>**Note for Windows build:**
 You shall always execute hydrasdr_tools from Windows command shell and not from Cygwin or Mingw shell because on Cygwin/Mingw
 Ctrl C is not managed correctly and especially for hydrasdr_rx the Ctrl C(abort) will not stop correctly and will corrupt the file.

### For VisualStudio 2019 or later:

* `git clone https://github.com/hydrasdr/rfone_host.git rfone_host`
* Download https://github.com/libusb/libusb/releases/download/v1.0.23/libusb-1.0.23.7z
* Extract **libusb-1.0.23.7z** to rfone_host directory
  * You should have **rfone_host\libusb-1.0.23**
    * Inside this directory there is README.txt, libusb-1.0.def and some directories
* Download ftp://mirrors.kernel.org/sourceware/pthreads-win32/pthreads-w32-2-9-1-release.zip
* Extract **pthreads-w32-2-9-1-release.zip** to rfone_host directory
  * You should have **rfone_host\libpthread-2-9-1-win**
    * Inside this directory there is lot of README files and some directories (dll, include, lib)
* Launch rfone_host\libhydrasdr\vc\hydrasdr_2019.sln with VisualStudio 2019, choose **Release** and **Build Solution**

### For MSYS2/MinGW64:
Launch mingw64

`pacman -Syu`

`pacman -S cmake mingw-w64-x86_64-libusb`

`git clone https://github.com/hydrasdr/rfone_host.git rfone_host`

`cd rfone_host`

`mkdir build`

`cd build`

Normal version:

* 
`cmake ../ -G "MSYS Makefiles" -DLIBUSB_INCLUDE_DIR=/mingw64/include/libusb-1.0/`

Debug version:

* 
`cmake ../ -G "MSYS Makefiles" -DCMAKE_BUILD_TYPE=Debug -DLIBUSB_INCLUDE_DIR=/mingw64/include/libusb-1.0/`

`make`

`make install`


## How to build the rfone_host software on Linux:

### Prerequisites for Linux (Debian/Ubuntu/Raspbian):


`sudo apt-get install build-essential cmake libusb-1.0-0-dev pkg-config git`


### Build rfone_host software on Linux:

`git clone https://github.com/hydrasdr/rfone_host.git rfone_host`

`cd rfone_host`

`mkdir build`

`cd build`

`cmake ../ -DINSTALL_UDEV_RULES=ON`

`make`

`sudo make install`

`sudo ldconfig`

## Clean CMake temporary files/dirs:

`cd rfone_host/build`

`rm -rf *`

## How to build rfone_host software on FreeBSD.

### Get the prerequisites (from root)

`pkg install git cmake`

### Build

`git clone https:\\github.com\hydrasdr\rfone_host.git`

`cd rfone_host`

`mkdir build`

`cd build`

`cmake .. -DLIBUSB_LIBRARIES=/usr/lib/libusb.so`

`make`

(from root)
`make install`

### Add users to group plugdev

(from root)
`useradd -a -G plugdev <user>`

https://www.hydrasdr.com

This file is part of HydraSDR (based on HackRF project see https://greatscottgadgets.com/hackrf/).
