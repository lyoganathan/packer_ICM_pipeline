sudo apt-get install -y python3-pip
pip3 install --upgrade pip
sudo rm -rfv /var/lib/apt/lists/*
sudo apt-get update
while [ $? -ne 0 ]; do
  sudo apt-get update
done
sudo apt-get install -y python3-setuptools
sudo pip3 install ansible
