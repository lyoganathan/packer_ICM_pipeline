#!/bin/bash

#bash aliases
echo "alias dcm2nii='/home/laagi/mricron_lx/dcm2nii'" > .bash_aliases
echo "alias mricron='/home/laagi/mricron_lx/mricron'" >> .bash_aliases
echo "alias mipav='/home/laagi/mipav/mipav'" >> .bash_aliases
echo "alias itksnap='/usr/local/itksnap-3.6.0-20170401-Linux-x86_64/bin/itksnap'" >> .bash_aliases

#freesrufer and fsl setup
echo "export FREESURFER_HOME=/usr/local/freesurfer" >> .bashrc
echo "source $FREESURFER_HOME/SetUpFreeSurfer.sh" >> .bashrc
echo "source /etc/fsl/5.0/fsl.sh" >> .bashrc

#Remove setup programs in /home/vagrant
rm /home/vagrant/*.gz