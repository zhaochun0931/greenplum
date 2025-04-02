# disable the firewall



rm -Rf /data/master/* /data/primary/* /data/mirror/*




# create gpadmin group and gpadmin user to manage the greenplum database
groupadd gpadmin
useradd gpadmin -r -m -g gpadmin
passwd gpadmin



# enable passwordless login for gpadmin user
su - gpadmin
ssh-keygen
ssh-copy-id localhost
ssh-copy-id hostname1
ssh-copy-id hostname2







# intall greenplum database to the default directory /usr/local/greenplum-db-7.4.0
# it will also create a soft link greenplum-db in /usr/local to /usr/local/greenplum-db-7.4.0
# install the dabatabase with root user
sudo -i
yum install -y greenplum-db-7.4.0-el8-x86_64.rpm






mkdir -p /data/master /data/primary /data/mirror
chown -R gpadmin:gpadmin /data
chown -R gpadmin:gpadmin /usr/local/greenplum*





# Required Environment Variables

GPHOME=/usr/local/greenplum-db-7.4.0

MASTER_DATA_DIRECTORY=/data/master/gpseg-1

LD_LIBRARY_PATH=/usr/local/greenplum-db-7.4.0/lib

PATH=/usr/local/greenplum-db-7.4.0/bin









#initialize Greenplum Database


su - gpadmin


# Creating the Initialization Host File and the Greenplum Database Configuration File
touch hostfile_gpinitsystem gpinitsystem_config





source /usr/local/greenplum-db-7.4.0/greenplum_path.sh

gpinitsystem -c gpinitsystem_config -h hostfile_gpinitsystem


# gpinitsystem -c gpinitsystem_config -h hostfile_gpinitsystem -s gp2 --mirror-mode=spread








# verify
su - gpadmin

source /usr/local/greenplum-db/greenplum_path.sh
export MASTER_DATA_DIRECTORY=/data/master/gpseg-1
gpstate

# or specify the data directory 
gpstate -d /data/master/gpseg-1


[gpadmin@gp1 ~]$ gpstate
20250213:14:09:16:028708 gpstate:gp1:gpadmin-[INFO]:-Starting gpstate with args:
20250213:14:09:16:028708 gpstate:gp1:gpadmin-[INFO]:-local Greenplum Version: 'postgres (Greenplum Database) 7.4.0 build commit:27de6dc6d00607a5630a41fd2c0ad489f40e2ad4'
20250213:14:09:16:028708 gpstate:gp1:gpadmin-[INFO]:-coordinator Greenplum Version: 'PostgreSQL 12.12 (Greenplum Database 7.4.0 build commit:27de6dc6d00607a5630a41fd2c0ad489f40e2ad4) on x86_64-pc-linux-gnu, compiled by gcc (GCC) 8.5.0 20210514 (Red Hat 8.5.0-22), 64-bit compiled on Jan 31 2025 03:17:23 Bhuvnesh C.'
20250213:14:09:16:028708 gpstate:gp1:gpadmin-[INFO]:-Obtaining Segment details from coordinator...
20250213:14:09:16:028708 gpstate:gp1:gpadmin-[INFO]:-Gathering data from segments...
20250213:14:09:17:028708 gpstate:gp1:gpadmin-[INFO]:-Greenplum instance status summary
20250213:14:09:17:028708 gpstate:gp1:gpadmin-[INFO]:-----------------------------------------------------
20250213:14:09:17:028708 gpstate:gp1:gpadmin-[INFO]:-   Coordinator instance                                      = Active
20250213:14:09:17:028708 gpstate:gp1:gpadmin-[INFO]:-   Coordinator standby                                       = No coordinator standby configured
20250213:14:09:17:028708 gpstate:gp1:gpadmin-[INFO]:-   Total segment instance count from metadata                = 4
20250213:14:09:17:028708 gpstate:gp1:gpadmin-[INFO]:-----------------------------------------------------
20250213:14:09:17:028708 gpstate:gp1:gpadmin-[INFO]:-   Primary Segment Status
20250213:14:09:17:028708 gpstate:gp1:gpadmin-[INFO]:-----------------------------------------------------
20250213:14:09:17:028708 gpstate:gp1:gpadmin-[INFO]:-   Total primary segments                                    = 2
20250213:14:09:17:028708 gpstate:gp1:gpadmin-[INFO]:-   Total primary segment valid (at coordinator)              = 2
20250213:14:09:17:028708 gpstate:gp1:gpadmin-[INFO]:-   Total primary segment failures (at coordinator)           = 0
20250213:14:09:17:028708 gpstate:gp1:gpadmin-[INFO]:-   Total number of postmaster.pid files missing              = 0
20250213:14:09:17:028708 gpstate:gp1:gpadmin-[INFO]:-   Total number of postmaster.pid files found                = 2
20250213:14:09:17:028708 gpstate:gp1:gpadmin-[INFO]:-   Total number of postmaster.pid PIDs missing               = 0
20250213:14:09:17:028708 gpstate:gp1:gpadmin-[INFO]:-   Total number of postmaster.pid PIDs found                 = 2
20250213:14:09:17:028708 gpstate:gp1:gpadmin-[INFO]:-   Total number of /tmp lock files missing                   = 0
20250213:14:09:17:028708 gpstate:gp1:gpadmin-[INFO]:-   Total number of /tmp lock files found                     = 2
20250213:14:09:17:028708 gpstate:gp1:gpadmin-[INFO]:-   Total number postmaster processes missing                 = 0
20250213:14:09:17:028708 gpstate:gp1:gpadmin-[INFO]:-   Total number postmaster processes found                   = 2
20250213:14:09:17:028708 gpstate:gp1:gpadmin-[INFO]:-----------------------------------------------------
20250213:14:09:17:028708 gpstate:gp1:gpadmin-[INFO]:-   Mirror Segment Status
20250213:14:09:17:028708 gpstate:gp1:gpadmin-[INFO]:-----------------------------------------------------
20250213:14:09:17:028708 gpstate:gp1:gpadmin-[INFO]:-   Total mirror segments                                     = 2
20250213:14:09:17:028708 gpstate:gp1:gpadmin-[INFO]:-   Total mirror segment valid (at coordinator)               = 2
20250213:14:09:17:028708 gpstate:gp1:gpadmin-[INFO]:-   Total mirror segment failures (at coordinator)            = 0
20250213:14:09:17:028708 gpstate:gp1:gpadmin-[INFO]:-   Total number of postmaster.pid files missing              = 0
20250213:14:09:17:028708 gpstate:gp1:gpadmin-[INFO]:-   Total number of postmaster.pid files found                = 2
20250213:14:09:17:028708 gpstate:gp1:gpadmin-[INFO]:-   Total number of postmaster.pid PIDs missing               = 0
20250213:14:09:17:028708 gpstate:gp1:gpadmin-[INFO]:-   Total number of postmaster.pid PIDs found                 = 2
20250213:14:09:17:028708 gpstate:gp1:gpadmin-[INFO]:-   Total number of /tmp lock files missing                   = 0
20250213:14:09:17:028708 gpstate:gp1:gpadmin-[INFO]:-   Total number of /tmp lock files found                     = 2
20250213:14:09:17:028708 gpstate:gp1:gpadmin-[INFO]:-   Total number postmaster processes missing                 = 0
20250213:14:09:17:028708 gpstate:gp1:gpadmin-[INFO]:-   Total number postmaster processes found                   = 2
20250213:14:09:17:028708 gpstate:gp1:gpadmin-[INFO]:-   Total number mirror segments acting as primary segments   = 0
20250213:14:09:17:028708 gpstate:gp1:gpadmin-[INFO]:-   Total number mirror segments acting as mirror segments    = 2
20250213:14:09:17:028708 gpstate:gp1:gpadmin-[INFO]:-----------------------------------------------------
[gpadmin@gp1 ~]$




# edit the ~/.bashrc and initialize some parameters


