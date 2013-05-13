# name		: bash administration framework v04.2 
# subname	: because everyone is naming everything a framework now

# *see LICENSE.md for gplv3 information concerning this framework

# ABOUT:
# file		: snippets.sh
# language	: US/English
# os support: SL6/RHEL6/CENTOS6/Arch

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

# bonus, as a oneliner

while read line; do echo -e "$line\n"; done < somefile

######################################
# snippet 6
# tar over ssh
tar czvf - /some/dir | ssh root@backup.server.com "cat > /backups/some/file.tar.gz"

######################################
# snippet 7
# collection of copy methods with progress
pv from_file to_file 
rsynv -varh --progress from_dir to_dir
dc3dd if=/dev/some_device of=image.dd progress=on 
dc3dd if=/some/file of=/some/other/file progress=on

