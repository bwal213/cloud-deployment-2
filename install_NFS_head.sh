sudo yum -y install nfs-utils
sudo mkdir /var/software
sudo chmod -R 755 /var/software
sudo chown nfsnobody:nfsnobody /var/software
sudo systemctl enable rpcbind
sudo systemctl enable nfs-server
sudo systemctl enable nfs-lock
sudo systemctl enable nfs-idmap
sudo systemctl start rpcbind
sudo systemctl start nfs-server
sudo systemctl start nfs-lock
sudo systemctl start nfs-idmap
#sudo exportfs -p /var/software 192.168.1.*(rw,sync,no_root_squash)
sudo exportfs *:/var/software -o rw,sync,no_root_squash
sudo exportfs -ra
sudo systemctl start firewalld.service
sudo firewall-cmd --permanent --zone=public --add-service=nfs
sudo firewall-cmd --permanent --zone=public --add-service=mountd
sudo firewall-cmd --permanent --zone=public --add-service=rpc-bind
sudo firewall-cmd --reload
#sleep 50000000000 && mount -t nfs 192.168.1.3:/var/scratch /mnt/scratch
sleep 50000000000 && sudo exportfs *:/var/software -o rw,sync,no_root_squash
sudo echo "192.168.1.3:/var/scratch /mnt  nfs defaults 0 0" >> /etc/fstab
