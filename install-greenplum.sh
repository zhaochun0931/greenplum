# install the greenplum in Rocky linux

# intall greenplum database to the default directory /usr/local/greenplum-db-7.4.0
# it will also create a soft link greenplum-db in /usr/local to /usr/local/greenplum-db-7.4.0
yum install -y greenplum-db-7.4.0-el8-x86_64.rpm




# create gpadmin group and gpadmin user to manage the greenplum database
groupadd gpadmin
useradd gpadmin -r -m -g gpadmin
passwd gpadmin



# enable passwordless login for gpadmin user
su - gpadmin
ssh-keygen
ssh-copy-id localhost




# change permission
sudo -i
chown -R gpadmin:gpadmin /usr/local/greenplum*
mkdir -p /data/master /data/primary /data/mirror
chown -R gpadmin:gpadmin /data












#initialize Greenplum Database


su - gpadmin


# Creating the Initialization Host File
touch hostfile_gpinitsystem


# Creating the Greenplum Database Configuration File
touch gpinitsystem_config





source /usr/local/greenplum-db/greenplum_path.sh
gpinitsystem -c gpinitsystem_config -h hostfile_gpinitsystem




# edit the ~/.bashrc and initialize some parameters



[gpadmin@gemfire-gp ~]$ gpinitsystem -c gpinitsystem_config -h hostfile_gpinitsystem
20230816:06:10:16:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-Checking configuration parameters, please wait...
20230816:06:10:16:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-Reading Greenplum configuration file gpinitsystem_config
20230816:06:10:16:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-Locale has not been set in gpinitsystem_config, will set to default value
20230816:06:10:16:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-Locale set to en_US.utf8
20230816:06:10:16:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-No DATABASE_NAME set, will exit following template1 updates
20230816:06:10:16:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-MASTER_MAX_CONNECT not set, will set to default value 250
20230816:06:10:16:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-Detected a single host GPDB array build, reducing value of BATCH_DEFAULT from 60 to 4
20230816:06:10:16:041012 gpinitsystem:gemfire-gp:gpadmin-[WARN]:-Master open file limit is 1024 should be >= 65535
20230816:06:10:16:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-Checking configuration parameters, Completed
20230816:06:10:16:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-Commencing multi-home checks, please wait...
.
20230816:06:10:16:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-Configuring build for standard array
20230816:06:10:16:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-Commencing multi-home checks, Completed
20230816:06:10:16:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-Building primary segment instance array, please wait...
..
20230816:06:10:17:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-Building group mirror array type , please wait...
..
20230816:06:10:18:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-Checking Master host
20230816:06:10:18:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-Checking new segment hosts, please wait...
20230816:06:10:19:041012 gpinitsystem:gemfire-gp:gpadmin-[WARN]:-Host gemfire-gp open files limit is 1024 should be >= 65535
....
20230816:06:10:22:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-Checking new segment hosts, Completed
20230816:06:10:22:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-Greenplum Database Creation Parameters
20230816:06:10:22:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:---------------------------------------
20230816:06:10:22:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-Master Configuration
20230816:06:10:22:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:---------------------------------------
20230816:06:10:22:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-Master instance name       = Greenplum Data Platform
20230816:06:10:22:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-Master hostname            = gemfire-gp
20230816:06:10:22:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-Master port                = 5432
20230816:06:10:22:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-Master instance dir        = /data/master/gpseg-1
20230816:06:10:22:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-Master LOCALE              = en_US.utf8
20230816:06:10:22:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-Greenplum segment prefix   = gpseg
20230816:06:10:22:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-Master Database            =
20230816:06:10:22:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-Master connections         = 250
20230816:06:10:22:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-Master buffers             = 128000kB
20230816:06:10:22:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-Segment connections        = 750
20230816:06:10:22:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-Segment buffers            = 128000kB
20230816:06:10:22:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-Checkpoint segments        = 8
20230816:06:10:22:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-Encoding                   = UNICODE
20230816:06:10:22:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-Postgres param file        = Off
20230816:06:10:22:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-Initdb to be used          = /usr/local/greenplum-db-6.24.3/bin/initdb
20230816:06:10:22:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-GP_LIBRARY_PATH is         = /usr/local/greenplum-db-6.24.3/lib
20230816:06:10:22:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-HEAP_CHECKSUM is           = on
20230816:06:10:22:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-HBA_HOSTNAMES is           = 0
20230816:06:10:22:041012 gpinitsystem:gemfire-gp:gpadmin-[WARN]:-Ulimit check               = Warnings generated, see log file <<<<<
20230816:06:10:22:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-Array host connect type    = Single hostname per node
20230816:06:10:22:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-Master IP address [1]      = ::1
20230816:06:10:22:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-Master IP address [2]      = 10.0.0.7
20230816:06:10:22:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-Master IP address [3]      = fe80::222:48ff:fe28:827b
20230816:06:10:22:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-Standby Master             = Not Configured
20230816:06:10:22:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-Number of primary segments = 2
20230816:06:10:22:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-Total Database segments    = 2
20230816:06:10:22:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-Trusted shell              = ssh
20230816:06:10:22:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-Number segment hosts       = 1
20230816:06:10:22:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-Mirror port base           = 7000
20230816:06:10:22:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-Number of mirror segments  = 2
20230816:06:10:22:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-Mirroring config           = ON
20230816:06:10:22:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-Mirroring type             = Group
20230816:06:10:22:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:----------------------------------------
20230816:06:10:22:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-Greenplum Primary Segment Configuration
20230816:06:10:22:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:----------------------------------------
20230816:06:10:22:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-gemfire-gp 	6000 	gemfire-gp 	/data/primary/gpseg0 	2
20230816:06:10:22:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-gemfire-gp 	6001 	gemfire-gp 	/data/primary/gpseg1 	3
20230816:06:10:22:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:---------------------------------------
20230816:06:10:22:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-Greenplum Mirror Segment Configuration
20230816:06:10:22:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:---------------------------------------
20230816:06:10:22:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-gemfire-gp 	7000 	gemfire-gp 	/data/mirror/gpseg0 	4
20230816:06:10:22:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-gemfire-gp 	7001 	gemfire-gp 	/data/mirror/gpseg1 	5

Continue with Greenplum creation Yy|Nn (default=N):
> Y
20230816:06:10:25:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-Building the Master instance database, please wait...
20230816:06:10:33:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-Starting the Master in admin mode
20230816:06:10:33:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-Commencing parallel build of primary segment instances
20230816:06:10:33:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-Spawning parallel processes    batch [1], please wait...
..
20230816:06:10:33:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-Waiting for parallel processes batch [1], please wait...
..................
20230816:06:10:52:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:------------------------------------------------
20230816:06:10:52:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-Parallel process exit status
20230816:06:10:52:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:------------------------------------------------
20230816:06:10:52:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-Total processes marked as completed           = 2
20230816:06:10:52:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-Total processes marked as killed              = 0
20230816:06:10:52:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-Total processes marked as failed              = 0
20230816:06:10:52:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:------------------------------------------------
20230816:06:10:52:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-Removing back out file
20230816:06:10:52:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-No errors generated from parallel processes
20230816:06:10:52:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-Restarting the Greenplum instance in production mode
20230816:06:10:52:045895 gpstop:gemfire-gp:gpadmin-[INFO]:-Starting gpstop with args: -a -l /home/gpadmin/gpAdminLogs -m -d /data/master/gpseg-1
20230816:06:10:52:045895 gpstop:gemfire-gp:gpadmin-[INFO]:-Gathering information and validating the environment...
20230816:06:10:52:045895 gpstop:gemfire-gp:gpadmin-[INFO]:-Obtaining Greenplum Master catalog information
20230816:06:10:52:045895 gpstop:gemfire-gp:gpadmin-[INFO]:-Obtaining Segment details from master...
20230816:06:10:52:045895 gpstop:gemfire-gp:gpadmin-[INFO]:-Greenplum Version: 'postgres (Greenplum Database) 6.24.3 build commit:25d3498a400ca5230e81abb94861f23389315213'
20230816:06:10:52:045895 gpstop:gemfire-gp:gpadmin-[INFO]:-Commencing Master instance shutdown with mode='smart'
20230816:06:10:52:045895 gpstop:gemfire-gp:gpadmin-[INFO]:-Master segment instance directory=/data/master/gpseg-1
20230816:06:10:53:045895 gpstop:gemfire-gp:gpadmin-[INFO]:-Stopping master segment and waiting for user connections to finish ...
server shutting down
20230816:06:10:54:045895 gpstop:gemfire-gp:gpadmin-[INFO]:-Attempting forceful termination of any leftover master process
20230816:06:10:54:045895 gpstop:gemfire-gp:gpadmin-[INFO]:-Terminating processes for segment /data/master/gpseg-1
20230816:06:10:55:046201 gpstart:gemfire-gp:gpadmin-[INFO]:-Starting gpstart with args: -a -l /home/gpadmin/gpAdminLogs -d /data/master/gpseg-1
20230816:06:10:55:046201 gpstart:gemfire-gp:gpadmin-[INFO]:-Gathering information and validating the environment...
20230816:06:10:55:046201 gpstart:gemfire-gp:gpadmin-[INFO]:-Greenplum Binary Version: 'postgres (Greenplum Database) 6.24.3 build commit:25d3498a400ca5230e81abb94861f23389315213'
20230816:06:10:55:046201 gpstart:gemfire-gp:gpadmin-[INFO]:-Greenplum Catalog Version: '301908232'
20230816:06:10:55:046201 gpstart:gemfire-gp:gpadmin-[INFO]:-Starting Master instance in admin mode
20230816:06:10:56:046201 gpstart:gemfire-gp:gpadmin-[INFO]:-Obtaining Greenplum Master catalog information
20230816:06:10:56:046201 gpstart:gemfire-gp:gpadmin-[INFO]:-Obtaining Segment details from master...
20230816:06:10:56:046201 gpstart:gemfire-gp:gpadmin-[INFO]:-Setting new master era
20230816:06:10:56:046201 gpstart:gemfire-gp:gpadmin-[INFO]:-Master Started...
20230816:06:10:56:046201 gpstart:gemfire-gp:gpadmin-[INFO]:-Shutting down master
20230816:06:10:58:046201 gpstart:gemfire-gp:gpadmin-[INFO]:-Commencing parallel segment instance startup, please wait...
20230816:06:10:59:046201 gpstart:gemfire-gp:gpadmin-[INFO]:-Process results...
20230816:06:10:59:046201 gpstart:gemfire-gp:gpadmin-[INFO]:-----------------------------------------------------
20230816:06:10:59:046201 gpstart:gemfire-gp:gpadmin-[INFO]:-   Successful segment starts                                            = 2
20230816:06:10:59:046201 gpstart:gemfire-gp:gpadmin-[INFO]:-   Failed segment starts                                                = 0
20230816:06:10:59:046201 gpstart:gemfire-gp:gpadmin-[INFO]:-   Skipped segment starts (segments are marked down in configuration)   = 0
20230816:06:10:59:046201 gpstart:gemfire-gp:gpadmin-[INFO]:-----------------------------------------------------
20230816:06:10:59:046201 gpstart:gemfire-gp:gpadmin-[INFO]:-Successfully started 2 of 2 segment instances
20230816:06:10:59:046201 gpstart:gemfire-gp:gpadmin-[INFO]:-----------------------------------------------------
20230816:06:10:59:046201 gpstart:gemfire-gp:gpadmin-[INFO]:-Starting Master instance gemfire-gp directory /data/master/gpseg-1
20230816:06:10:59:046201 gpstart:gemfire-gp:gpadmin-[INFO]:-Command pg_ctl reports Master gemfire-gp instance active
20230816:06:10:59:046201 gpstart:gemfire-gp:gpadmin-[INFO]:-Connecting to dbname='template1' connect_timeout=15
20230816:06:10:59:046201 gpstart:gemfire-gp:gpadmin-[INFO]:-No standby master configured.  skipping...
20230816:06:10:59:046201 gpstart:gemfire-gp:gpadmin-[INFO]:-Database successfully started
20230816:06:10:59:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-Completed restart of Greenplum instance in production mode
20230816:06:10:59:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-Commencing parallel build of mirror segment instances
20230816:06:10:59:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-Spawning parallel processes    batch [1], please wait...
..
20230816:06:10:59:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-Waiting for parallel processes batch [1], please wait...
.........
20230816:06:11:08:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:------------------------------------------------
20230816:06:11:08:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-Parallel process exit status
20230816:06:11:08:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:------------------------------------------------
20230816:06:11:08:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-Total processes marked as completed           = 2
20230816:06:11:09:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-Total processes marked as killed              = 0
20230816:06:11:09:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-Total processes marked as failed              = 0
20230816:06:11:09:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:------------------------------------------------
20230816:06:11:09:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-Scanning utility log file for any warning messages
20230816:06:11:09:041012 gpinitsystem:gemfire-gp:gpadmin-[WARN]:-*******************************************************
20230816:06:11:09:041012 gpinitsystem:gemfire-gp:gpadmin-[WARN]:-Scan of log file indicates that some warnings or errors
20230816:06:11:09:041012 gpinitsystem:gemfire-gp:gpadmin-[WARN]:-were generated during the array creation
20230816:06:11:09:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-Please review contents of log file
20230816:06:11:09:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-/home/gpadmin/gpAdminLogs/gpinitsystem_20230816.log
20230816:06:11:09:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-To determine level of criticality
20230816:06:11:09:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-These messages could be from a previous run of the utility
20230816:06:11:09:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-that was called today!
20230816:06:11:09:041012 gpinitsystem:gemfire-gp:gpadmin-[WARN]:-*******************************************************
20230816:06:11:09:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-Greenplum Database instance successfully created
20230816:06:11:09:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-------------------------------------------------------
20230816:06:11:09:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-To complete the environment configuration, please
20230816:06:11:09:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-update gpadmin .bashrc file with the following
20230816:06:11:09:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-1. Ensure that the greenplum_path.sh file is sourced
20230816:06:11:09:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-2. Add "export MASTER_DATA_DIRECTORY=/data/master/gpseg-1"
20230816:06:11:09:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-   to access the Greenplum scripts for this instance:
20230816:06:11:09:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-   or, use -d /data/master/gpseg-1 option for the Greenplum scripts
20230816:06:11:09:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-   Example gpstate -d /data/master/gpseg-1
20230816:06:11:09:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-Script log file = /home/gpadmin/gpAdminLogs/gpinitsystem_20230816.log
20230816:06:11:09:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-To remove instance, run gpdeletesystem utility
20230816:06:11:09:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-To initialize a Standby Master Segment for this Greenplum instance
20230816:06:11:09:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-Review options for gpinitstandby
20230816:06:11:09:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-------------------------------------------------------
20230816:06:11:09:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-The Master /data/master/gpseg-1/pg_hba.conf post gpinitsystem
20230816:06:11:09:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-has been configured to allow all hosts within this new
20230816:06:11:09:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-array to intercommunicate. Any hosts external to this
20230816:06:11:09:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-new array must be explicitly added to this file
20230816:06:11:09:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-Refer to the Greenplum Admin support guide which is
20230816:06:11:09:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-located in the /usr/local/greenplum-db-6.24.3/docs directory
20230816:06:11:09:041012 gpinitsystem:gemfire-gp:gpadmin-[INFO]:-------------------------------------------------------
[gpadmin@gemfire-gp ~]$
 


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
