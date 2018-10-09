sudo yum -y install nfs-utils
sudo mkdir /mnt/software
sudo chmod -R 755 /mnt/software
sudo chown nfsnobody:nfsnobody /mnt/software
#sudo exportfs -p /var/software 192.168.1.*(rw,sync,no_root_squash)
sudo exportfs *:/mnt/software -o rw,sync,no_root_squash
sudo mkdir -p /mnt/scratch
#sudo exportfs -ra
#sleep 50000000000 && mount -t nfs 192.168.1.3:/var/scratch /mnt/scratch
sleep 30s && sudo mount -t nfs 192.168.1.3:/mnt/scratch /mnt/scratch
sudo echo "192.168.1.3:/mnt/scratch /mnt/scratch  nfs defaults 0 0" >> /etc/fstab
