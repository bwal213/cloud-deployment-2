sudo yum -y install nfs-utils
sudo mkdir /mnt/scratch
sudo chmod -R 755 /mnt/scratch
sudo chown nfsnobody:nfsnobody /var/scratch
sudo exportfs -p /mnt/scratch 192.168.1.*(rw,sync,no_root_squash) 
sudo exportfs -ra
