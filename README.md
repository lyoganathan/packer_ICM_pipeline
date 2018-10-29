ICM_PIPELINE (Docker)
=========================
Ubuntu 16.04 container with MIPAV and modules to do ICM analysis
--------------------------------------------------------------------------------
There are 4 branches:
- **master:** Using *ubuntu-server iso* and building a VirtualBox .ova using packer
- **using_desktop_iso:** Using *ubuntu-desktop iso* to build VirtualBox .ova using packer
- **ami_aws:** Using packer to build an AMI
- **docker:** Using dockerfile to build a container with docker toolbox

## docker.io/lyoganathan/icm:mipav

Current Software:
- MIPAV, JIST, CBS tools, TOADS CRUISE & JIST CRUISE
- The dockerfile is for installing other things as well like freesurfer, fsl & itksnap - ended up removing them from container and just keeping MIPAV

## How to run Container ##

- Install Docker or Docker Toolbox. If on windows and not Windows 10 enterprise/professional, you will have to get Docker Toolbox, which works fine for me. I think the difference is docker toolbox requires virtualbox, wheres Docker uses Hyper-V.
- Download the container: if you do
```
docker run lyoganathan/icm:mipav
```
it should download the container locally.

### Copy files: ###
Instead of downloading freesurfer & itksnap, copy them from local and unzip them in dockerfile. MIPAV files are also copied.

### How to build a VM with more diskpace: ###
Run in DockerToolbox

```
docker-machine rm default
docker-machine create -d virtualbox --virtualbox-disk-size "100000" default
```

## Running with graphics (X server on windows Host) ##
```
docker run -it -e DISPLAY=<IP.Address.For.VirtualBox.IPv4>:0 <Container Name>
```
Also edit your X0.hosts file in Program Files\Xming\X0.hosts with admin privileges to include your docker toolbox ID. (Different from above!). Check with

```
docker-machine ip
```
#### Removing Containers ####
docker rm $(docker ps -a -f status=exited -q)
#### Removing Images ####
docker rmi image

## Using this container with Singularity ##
Work in progress...

## How this Container was Created ##
MIPAV install was done manually, that is add the programs to image using the dockerfile, run the installation in docker, commit that changes. It will be another layer. To save as one image, export as tar and reimport.

In the dockerfile there is a line

```
ADD ./programs /home/ubuntu
```
This copies the MIPAV programs to the container. These programs are:
- CBSTools-release-3.09-160708.jar [Download Page, under, CBSTools 3.0.9](https://www.nitrc.org/frs/?group_id=606)
- JIST-2014Dec12-03-34PM.jar [Download Page, under JIST 3.2+ ](https://www.nitrc.org/frs/?group_id=228)
- JIST-BASE-2014Dec12-03-33PM [Download Page, under JIST 3.2+](https://www.nitrc.org/frs/?group_id=228)
- JIST-CRUISE-2014Dec12-03-37PM [Download Page, under JIST 3.2+](https://www.nitrc.org/frs/?group_id=228)
- TOADS-CRUISE_2012_Mar_23_R3c [Download Page](https://www.nitrc.org/frs/?group_id=271)
- installMIPAV.bin [Download Page, version 7.1.0 from archived releases](https://mipav.cit.nih.gov/download.php)

docker build -t icm
start Xming, make sure your docker-machine ip is in the X0.hosts of Xming. If you have something like MobaXterm installed, that should work too. Make sure you know your virtualbox IP:

docker run -it -e DISPLAY=192.168.99.1:0 icm

Install MIPAV

docker ps -l

docker commit
