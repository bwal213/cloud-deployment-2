sudo yum -y install nfs-utils nfs-utils-lib
sudo yum -y install portmap
/etc/init.d/portmap start
/etc/init.d/nfs start
chkconfig --level 35 portmap on
chkconfig --level 35 nfs on
sudo mkdir /software
sudo echo"/software *(ro,sync,no_root_squash)" > /etc/exports 
