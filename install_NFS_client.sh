sudo yum -y install nfs-utils nfs-utils-lib
sudo yum -y install portmap
/etc/init.d/portmap start
/etc/init.d/nfs start
chkconfig --level 35 portmap on
chkconfig --level 35 nfs on
mount -t nfs 192.168.1.1:/software /mnt/software
mount -t nfs 192.168.1.3:/scratch /mnt/scratch
sudo echo "192.168.1.1:/software /mnt  nfs defaults 0 0" >> /etc/fstab
sudo echo "192.168.1.3:/scratch /mnt  nfs defaults 0 0" >> /etc/fstab
