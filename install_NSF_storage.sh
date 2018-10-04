sudo yum -y install nfs-utils nfs-utils-lib
sudo yum -y install portmap
/etc/init.d/portmap start
/etc/init.d/nfs start
chkconfig --level 35 portmap on
chkconfig --level 35 nfs on
sudo mkdir /scratch
sudo echo"/scratch *(rw,sync,no_root_squash)" > /etc/exports 
