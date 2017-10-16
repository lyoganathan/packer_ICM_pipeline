ICM_PIPELINE
=============
Ubuntu 16.04 virtual machine loaded with neuroimaging software

There are 2 branches, one is using packer to build a virtualbox VM and the other is to build an AMI for AWS
--------------------------------------------------------------------------------
Download link:
[ICM_PIPELINE.ova](https://drive.google.com/file/d/0B8U1bxkyNu87RWtnUU8xeUVldm8/view?usp=sharing)

Current Software:
- Freesurfer 6.0
- FSL 5.0
- MIPAV
- ITK Snap
- mricron

#### This readme is about building the VM (packer, ansible, vagrant, preseeding etc.) & current issues ####

1. For info about the ICM pipeline: Under Construction
2. For instructions on installing the VM: *Read INSTALL*

There are more READMEs in the subdirectories (vagrant, packer) that have more info about problems as well as cool usage

So, I used a windows machine to do all this, bad idea. after a lot of t(rial)error, managed to get it to work.

Problems still need fixing or looking into:
- Preseeding ubuntu-desktop?? Or starting with desktop ISO? Would be super useful because a lot of programs are GUI-based and their installation require this, currently fails when put into tasksel or pkgsel in preeseed, so using ansible
- Preseed fails at Select and install hardware? Same preseed can succeed and fail at this step. Maybe can't go online to download new packages?, But mirrors work and when i am disconnected from internet i get different error, so probs firewall?
- SO MANY ANSIBLE PROBLEMS !
  - using apt_repo for sourcing neurodebian fails
  - Installing ubuntu desktop without update_cache fails
  - Stops when some of FSLs installs don't work?? But if I boot up VM and run in terminal I will get output that some installs failed and it will still complete (yielding a working FSL). Conversly, ansible destroys the VM.

Packer allows creating of a virtual machine from an installation ISO (Ubuntu 16.04 server in this case), and can also build into several VM formats, such as AMI, which can then be deployed in an EC2 instance.

Although I won't elaborate too much on packer and ansible, this is just how my scripts work incase anyone wants to play around and make there own VMs, and also some problems I ran into & things I am improving.

A windows machine cannot be a control machine! You have to use ansible local (installs anisble on guest) from a windows host, and packer doesn't install ansible automatically on guest VM, so we have to preseed it or use shell scripts. I preseeded.

You can't preseed a ubuntu desktop image with d-i. You have to use something called ubiquity (I think). So you have to start with a server image, install linux-generic kernel (as opposed to linux-server kernel), and then install the ubuntu-desktop package. For some reason, when i use ubuntu-desktop in tasksel, the install completes, but no ubuntu-desktop is there. If I run taskel in that VM, I see no ubuntu-desktop. When i run it

```
d-i pkgsel/include ubuntu-desktop
```
I get a software install error and VM dosen't build succesfully. Solution? Provision it in later with ansible.
Okay so you can check out the preseed (check out preseed README for info on stuff like boot-command), read over packer documentation & ansible documentation.
Hopefully can find out how to run on a cluster for super fast neuroimaging analysis.


packer.json: packer config file
playbook.yml: ansible playbook file
clean.sh: Deletes installers and also sets up .bashrc and .bash_aliases
