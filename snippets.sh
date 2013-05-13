# name		: bash administration framework v04.2 
# subname	: because everyone is naming everything a framework now

# *see LICENSE.md for gplv3 information concerning this framework

# ABOUT:
# file		: snippets.sh
# language	: US/English
# os support: SL6/RHEL6/CENTOS6/Arch

 ###########################################################################
#																			#
# Some code snippets to get you started. copy and paste them into the code	#
# section of the copied wireframe.sh file, and modify as you see fit.		#
#																			#
 ###########################################################################

 #####################################
# snippet 1
# quick easy way to make a temp file and remove it upon exit
TMP=$(mktemp)
trap "/bin/rm ${TMP}" EXIT

 #####################################
# snippet 2
# check for cpu usage of SOME_PROCESS_NAME, and if usage is higher than
# MAX_CPU then mail out an alert to SYSADMIN_EMAIL
TMP=$(mktemp)
SOME_PROCESS_NAME='httpd'
MAX_CPU=95
SYSADMIN_EMAIL='BOFG@grog.com' # this variable is set in wireframe.sh remember...
trap "/bin/rm ${TMP}" EXIT
ps --no-headers -eo %cpu,comm | grep $SOME_PROCESS_NAME > $TMP
while read line
	do
	read cpu comm <<<$(echo $line)
		if [[ ${cpu/%.*} > ${MAX_CPU} ]]; then
                #echo "some_process is using more than 95%"
                #echo "send a message to admins or whatever"
                echo -e "help" | mail -s "alert cpu over 95%" $SYSADMIN_EMAIL -- -f yourscript@yourhouse.com
        else
                #echo "$SOME_PROCESS_NAME is ok"
        fi
	done < ${TMP}

 ######################################
# snippet 3
# make mysql queries against single/multiple mysql instance(s)
# password will be needed against mysql, possibly username as well
HOSTS=(host1 host2 10.10.10.3 hostname4.com)

for HOST in "${HOSTS[@]}"
do
	# dump a database
    echo "working on $HOST"
    ssh "$HOST" "mysqldump some_db > /tmp/some_db.sql"

	# insert data into a table
	ssh "$HOST" "mysql -e \"INSERT INTO myprogram.user (id, username, password) VALUES (42, 'BOFH', MD5('myPASSwoRD');\""
done

 ######################################
# snippet 4
# perform actions on a single/multiple number of hosts(s)?
# use an ssh key
HOSTS=(host1 host2 10.10.10.3 hostname4.com)
KEY=/root/.ssh/id_rsa

for HOST in "${HOSTS[@]}"
do
    echo "working on $HOST"
    ssh -i "$KEY" "$HOST" "cd /tmp; rm -rf *.temporary; ls -alh"
done

 ######################################
# snippet 5
# read line by line from a file
while read line; 
do echo -e "$line\n"; 
done < somefile

 ######################################
# snippet 6
# tar over ssh
tar czvf - /some/dir | ssh root@backup.server.com "cat > /backups/some/file.tar.gz"

 ######################################
# snippet 7
# collection of copy methods with progress
pv from_file to_file 
rsync -varh --progress from_dir to_dir 		# no compression
rsync -varhz --progress from_dir to_dir 	# with compression
dc3dd if=/dev/some_device of=ddimage.dat progress=on 
dc3dd if=/some/file of=/some/other/file progress=on

 ######################################
# snippet 8
# check dns server response time
time for ((a=1; a <= 1000; a++)); do dig @4.2.2.3 www.google.com; done

 ######################################
# snippet 9
# Create db and import db into it (multiple db's)
for i in *.sql; do
	mysql -e "create database $(basename $i .sql)"; 
	pv $i | mysql $(basename $i .sql); 
done

 ######################################
# snippet 10
# simple speed tests between servers using ssh/pv
yes | pv | ssh $host "cat > /dev/null"    
echo /dev/zero | pv | ssh $host "cat > /dev/null"

 ######################################
# snippet 11
# find files of $username and add sizes together
find . -name *.dat -user "root" -exec du -b {} \; | awk '{size+=$1} END{print size}' 

