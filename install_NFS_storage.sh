sudo yum -y install nfs-utils
sudo mkdir /var/scratch
sudo chmod -R 755 /var/scratch
sudo chown nfsnobody:nfsnobody /var/scratch
sudo systemctl enable rpcbind
sudo systemctl enable nfs-server
sudo systemctl enable nfs-lock
sudo systemctl enable nfs-idmap
sudo systemctl start rpcbind
sudo systemctl start nfs-server
sudo systemctl start nfs-lock
sudo systemctl start nfs-idmap
sudo exportfs -p /var/scratch 192.168.1.*(rw,sync,no_root_squash) 
sudo exportfs -ra
sudo firewall-cmd --permanent --zone=public --add-service=nfs
sudo firewall-cmd --permanent --zone=public --add-service=mountd
sudo firewall-cmd --permanent --zone=public --add-service=rpc-bind
sudo firewall-cmd --reload
