sudo rm -rfv /var/lib/apt/lists/*
sudo apt-get update
sudo apt-get install -y python3-pip
pip3 install --upgrade pip
sudo apt-get install -y python3-setuptools
sudo pip3 install ansible
pip3 install --upgrade cryptography
