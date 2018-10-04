sudo yum -y install nfs-utils nfs-utils-lib
sudo yum -y install portmap
/etc/init.d/portmap start
/etc/init.d/nfs start
chkconfig --level 35 portmap on
chkconfig --level 35 nfs on
sudo mkdir /software
sudo echo"/software *(ro,sync,no_root_squash)" > /etc/exports 
sleep 50000000000 && mount -t nfs 192.168.1.3:/scratch /mnt/scratch
sudo echo "192.168.1.3:/scratch /mnt  nfs defaults 0 0" >> /etc/fstab
