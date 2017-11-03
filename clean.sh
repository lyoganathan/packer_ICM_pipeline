#!/bin/bash

#bash aliases
echo "alias dcm2nii='/home/ubuntu/mricron_lx/dcm2nii'" > .bash_aliases
echo "alias mricron='/home/ubuntu/mricron_lx/mricron'" >> .bash_aliases
echo "alias mipav='/home/ubuntu/ubuntu/mipav'" >> .bash_aliases
echo "alias itksnap='/usr/local/itksnap-3.6.0-20170401-Linux-x86_64/bin/itksnap'" >> .bash_aliases

#freesrufer and fsl setup
echo "export FREESURFER_HOME=/usr/local/freesurfer" >> .bashrc
echo "source \$FREESURFER_HOME/SetUpFreeSurfer.sh" >> .bashrc
echo "source /etc/fsl/5.0/fsl.sh" >> .bashrc

#FreeSurfer License
echo "yoganal@mcmaster.ca" > license.txt
echo "33146" >> license.txt
echo "*Cn3LAjPVSRAA" >> license.txt
echo "FSa6Z.qTzw6X6" >> license.txt
sudo su
mv licence.txt /usr/local/freesurfer/

#Remove setup programs in /home/vagrant
rm /home/ubuntu/*.gz
rm /home/ubuntu/*.zip
