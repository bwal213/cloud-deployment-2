sudo yum -y install nfs-utils
sudo mkdir -p /mnt/software
sudo mkdir -p /mnt/scratch
sudo mount -t nfs 192.168.1.1:/mnt/software /mnt/software
sudo mount -t nfs 192.168.1.3:/mnt/scratch /mnt/scratch
sudo echo "192.168.1.1:/mnt/software /mnt  nfs defaults 0 0" | sudo tee -a /etc/fstab
sudo echo "192.168.1.3:/mnt/scratch /mnt  nfs defaults 0 0" | sudo tee -a /etc/fstab
