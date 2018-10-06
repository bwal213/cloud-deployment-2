# cloud-deployment-2
The repository for CSC496 Assignment 2 Part 2


Suggested changes:
-check if "exportfs -ra" commands make a difference.
-check if/how to write to "/etc/export".
-check timing on when to setup clients. 
-timing for storage shouldnt matter, can be setup asap, this allows head to mount once ready.
-test to confirm auto setup and share of storage.
-pick how to install mpi / if storage needs to be re-mounted from itself, or the shared directory needs to be moved to "/mnt/source"
-last understanding is that mpi only installed on head, then accessed through "mnt/storage", the shared directory.
