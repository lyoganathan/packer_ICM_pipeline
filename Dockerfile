#Start with ubuntu 16.04 desktop
FROM ubuntu:xenial

WORKDIR /home/ubuntu
ADD ./programs /home/ubuntu

#Download neurodebian
RUN rm -rfv /var/lib/apt/lists/*

RUN apt-get update; \
  while [ $? -ne 0 ]; do apt-get update; done \
  && apt-get install -y --no-install-recommends apt-utils \
  && apt-get install -y wget

RUN wget -O- http://neuro.debian.net/lists/xenial.au.full > /etc/apt/sources.list.d/neurodebian.sources.list; \
&& apt-key adv --fetch-keys http://keyserver.ubuntu.com/pks/lookup?op=get&fingerprint=on&search=0xA5D32F012649A5A9

#Install xorg
RUN rm -rfv /var/lib/apt/lists/*

RUN apt-get update; \
  while [ $? -ne 0 ]; do apt-get update; done \
  && apt-get install -y xorg; \
  while [ $? -ne 0 ]; do apt-get install -y xorg; done

#Install FSL
RUN apt-get install -y --allow-unauthenticated fsl-complete; \
  while [ $? -ne 0 ]; do apt-get install -y --allow-unauthenticated fsl-complete; done

#Install itksnap
RUN tar -C /usr/local -zxvf /home/ubuntu/itksnap-3.6.0-20170401-Linux-x86_64.tar.gz
#Install freesurfer
RUN tar -C /usr/local -xzvf /home/ubuntu/freesurfer-Linux-centos6_x86_64-stable-pub-v6.0.0.tar.gz

#Set-Up Aliases, cleanup
RUN echo "alias dcm2nii='/home/ubuntu/mricron_lx/dcm2nii'" > /root/.bash_aliases \
  && echo "alias mricron='/home/ubuntu/mricron_lx/mricron'" >> /root/.bash_aliases \
  && echo "alias mipav='/home/vagrant/mipav/mipav'" >> /root/.bash_aliases \
  && echo "alias itksnap='/usr/local/itksnap-3.6.0-20170401-Linux-x86_64/bin/itksnap'" >> /root/.bash_aliases \
  && echo "export FREESURFER_HOME=/usr/local/freesurfer" > /root/.bashrc \
  && echo "source \$FREESURFER_HOME/SetUpFreeSurfer.sh" >> /root/.bashrc \
  && echo "source /etc/fsl/5.0/fsl.sh" >> /root/.bashrc
  && rm /home/ubuntu/*.gz
