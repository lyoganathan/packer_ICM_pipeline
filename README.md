ICM_PIPELINE (VirtualBox)
=========================
Ubuntu 16.04 virtual machine loaded with neuroimaging software
--------------------------------------------------------------------------------
There are 4 branches:
- **master:** Using *ubuntu-server iso* and building a VirtualBox .ova using packer
- **using_desktop_iso:** Using *ubuntu-desktop iso* to build VirtualBox .ova using packer
- **ami_aws:** Using packer to build an AMI
- **docker:** Using packer to build a container with docker toolbox

# docker.io/lyoganathan/icmpipeline

Current Software:
- Freesurfer 6.0
- FSL 5.0
- ITK Snap
- mricron

## How to run Container ##

- Install Docker or Docker Toolbox. If on windows and not Windows 10 enterprise/professional, you will have to get Docker Toolbox, which works fine for me. I think the difference is docker toolbox requires virtualbox, wheres Docker uses Hyper-V.
- Download the container: if you do
```
docker run lyoganathan/icmpipeline:v2
```
it should download the container locally.

### Using Container on AWS ###


### Problems with Packer ###

File upload from packer dosen't work. aka can't upload freesurfer, itksnap etc... have to download...

### Copy files: ###
Instead of downloading freesurfer & itksnap, copy them from local and unzip them in dockerfile

WORKDIR /home/ubuntu
ADD ./programs /home/ubuntu

### How to build a VM with more diskpace: ###
Run in DockerToolbox

```
docker-machine rm default
docker-machine create -d virtualbox --virtualbox-disk-size "100000" default
```

# Running with graphics (X server on windows Host) #
docker run -it \
    -e DISPLAY=<IP.Address.For.VirtualBox.IPv4>:0
Also edit your X0.hosts file in Program Files\Xming\X0.hosts with admin privileges to include your docker toolbox ID. (Different from above!)

#### Removing Containers ####
docker rm $(docker ps -a -f status=exited -q)
#### Removing Images ####
