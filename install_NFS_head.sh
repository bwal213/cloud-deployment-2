sudo yum -y install nfs-utils
sudo mkdir /mnt/software
sudo chmod -R 755 /mnt/software
sudo chown nfsnobody:nfsnobody /mnt/software
sudo echo '/mnt/software *(ro,sync,no_root_squash)' | sudo tee /etc/exports
sudo mkdir -p /mnt/scratch
sudo exportfs -ra
sleep 180s && sudo mount -t nfs 192.168.1.3:/mnt/scratch /mnt/scratch
sudo echo "192.168.1.3:/mnt/scratch /mnt/scratch  nfs defaults 0 0" | sudo tee -a /etc/fstab
