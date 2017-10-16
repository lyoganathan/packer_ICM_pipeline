ICM_PIPELINE (AMI)
=========================
Ubuntu 16.04 virtual machine loaded with neuroimaging software
--------------------------------------------------------------------------------
There are 2 branches, one is using packer to build an AMI for AWS and the other is building a VirtualBox VM

#### AMI ID: ami-ba7fa8c0 ####
#### Region: US East North Virginia ####

Current Software:
- Freesurfer 6.0
- FSL 5.0
- ITK Snap
- mricron

#### This readme is about building the VM (packer, ansible, AWS stuff) & current issues ####

1. For info about the ICM pipeline: _Under Construction_
2. For instructions on getting the VM working on your AWS account: _Under Construction_


Issues:
- Have to manually update cryptography with pip?
- How to install mipav?

Packer allows creating of a virtual machine from an installation ISO (Ubuntu 16.04 server in this case), and can also build into several VM formats, such as AMI, which can then be deployed in an EC2 instance.

Although I won't elaborate too much on packer and ansible, this is just how my scripts work incase anyone wants to play around and make there own VMs, and also some problems I ran into & things I am improving.

A windows machine cannot be a control machine! You have to use ansible local (installs anisble on guest) from a windows host, and packer doesn't install ansible automatically on guest VM, so we have to preseed it or use shell scripts. I used shell scripts but i think preseeding might be better if I can get it to work.


packer.json: packer config file

playbook.yml: ansible playbook file

start.sh: Installs Ansible

clean.sh: Deletes installers and also sets up .bashrc and .bash_aliases
