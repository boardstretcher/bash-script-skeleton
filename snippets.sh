exit; end; # you dont want to accidentally run this file.

# USING: 
# uncomment the OPTIONAL COMMAND MAPPINGS section in functions.sh if youd like 
# to use these snippets.

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
#SYSADMIN_EMAIL='blargh'### this variable is set in wireframe.sh in the global var section
trap "/bin/rm ${TMP}" EXIT
$PS --no-headers -eo %cpu,comm | $GREP $SOME_PROCESS_NAME > $TMP

while read line
	do
	read cpu comm <<<$($ECHO $line)
		if [[ ${cpu/%.*} > ${MAX_CPU} ]]; then
                #$ECHO "some_process is using more than 95%"
                #$ECHO "send a message to admins or whatever"
                $ECHO -e "help" | $MAIL -s "alert cpu over 95%" $SYSADMIN_EMAIL -- -f yourscript@yourhouse.com
        else
                #$ECHO "$SOME_PROCESS_NAME is ok"
        fi
	done < ${TMP}

 ######################################
# snippet 3
# make $MYSQL queries against single/multiple $MYSQL instance(s)
# password will be needed against $MYSQL, possibly username as well
HOSTS=(host1 host2 10.10.10.3 hostname4.com)

for HOST in "${HOSTS[@]}"
do
	# dump a database
    $ECHO "working on $HOST"
    $SSH "$HOST" "$MYSQLdump some_db > /tmp/some_db.sql"

	# insert data into a table
	$SSH "$HOST" "$MYSQL -e \"INSERT INTO myprogram.user (id, username, password) VALUES (42, 'BOFH', MD5('myPASSwoRD');\""
done

 ######################################
# snippet 4
# perform actions on a single/multiple number of hosts(s)?
# use an $SSH key
HOSTS=(host1 host2 10.10.10.3 hostname4.com)
KEY=/root/.$SSH/id_rsa

for HOST in "${HOSTS[@]}"
do
    $ECHO "working on $HOST"
    $SSH -i "$KEY" "$HOST" "cd /tmp; rm -rf *.temporary; ls -alh"
done

 ######################################
# snippet 5
# read line by line from a file
while read LINE; 
do $ECHO -e "$LINE\n"; 
done < somefile

 ######################################
# snippet 6
# $TAR over $SSH
$TAR czvf - /some/dir | $SSH root@backup.server.com "cat > /backups/some/file.$TAR.gz"

 ######################################
# snippet 7
# collection of copy methods with progress
$PV from_file to_file 
$RSYNC -varh --progress from_dir to_dir 		# no compression
$RSYNC -varhz --progress from_dir to_dir 	# with compression
$DC3DD if=/dev/some_device of=ddimage.dat progress=on 
$DC3DD if=/some/file of=/some/other/file progress=on

 ######################################
# snippet 8
# check dns server response time
$TIME for ((a=1; a <= 1000; a++)); do $DIG @4.2.2.3 www.google.com; done

 ######################################
# snippet 9
# Create db and import db into it (multiple db's)
for i in *.sql; do
	$MYSQL -e "create database $(basename $i .sql)"; 
	$PV $i | $MYSQL $(basename $i .sql); 
done

 ######################################
# snippet 10
# simple speed tests between servers using $SSH/$PV
$YES | $PV | $SSH $host "cat > /dev/null"    
$ECHO /dev/zero | $PV | $SSH $host "cat > /dev/null"

 ######################################
# snippet 11
# find *.dat files of username and add sizes together
$FIND . -name *.dat -user "root" -exec du -b {} \; | awk '{size+=$1} END{print size}' 
