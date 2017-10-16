#Installing ICM_PIPELINE on VirtualBox

Download the .ova file:
[ICM_PIPELINE.ova](https://drive.google.com/file/d/0B8U1bxkyNu87RWtnUU8xeUVldm8/view?usp=sharing)

Install Instructions:
1. Download the .ova file
2. Download virtualbox and get it setup
3. Go to File -> Import Appliance
4. Select the ICM_PIPELINE.ova file
5. Can change CPU and memory
6. Start it up

Install Guest Additions & Shared Folders:
For some reason, this never goes smoothly...
1. Insert guest additions CD
2. apt-get install dkms build-essential linux-headers-generic
3. mount /dev/cdrom /media
4. If not automatically prompted, run sudo sh /media/cdrom/VBoxLinuxAdditions.run
5. Now for shared folders

Here's an SO post discussing some problems and usually one of them will fix your problem:

https://stackoverflow.com/questions/28328775/virtualbox-mount-vboxsf-mounting-failed-with-the-error-no-such-device
