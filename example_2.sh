#!/usr/bin/env bash

# wireframe copy - an example regular use case

# im just starting to write my parser script. so i want all the debugging and 
# output i can get. I dont need alerting though because its only a test script
# at the moment. it will require curl. and should only be run as root.

# but i currently have no help or switches to pass to the program. so ill
# leave those unchanged until later.

VARS=`set -o posix ; set`
ENV="test"								# environment (prod, dev, test)
MINARGS=0								# minimum number of cli arguments
DEBUG=on								# Debug output? (on/off)
INFO=on									# Informational output? (on/off)
TMPFILE=$(mktemp /tmp/myfile.XXXXX)		# create a tmp file
LOGFILE=/var/log/someapp.log 			# name of log file to use
US_DATE=`date +%d%m%Y`					# US formatted date
EU_DATE=`date +%Y%m%d`					# EU formatted date
NOW=`date +%H%M`						# The time at start of script
REQUIRED_PROGS=(curl)

source colors.dat
source functions.sh

only_run_as 0

[ -e $LOGFILE ] && debug "Logfile $LOGFILE exists" || debug "Logfile $LOGFILE does not exist, exiting.";
[ -w $LOGFILE ] && debug "Logfile $LOGFILE writeable" || debug "Logfile $LOGFILE no Writable, exiting.";

if [ $DEBUG == "on" ]; then $ECHO $VARS >> $LOGFILE; fi

check_reqs
trap failed ERR
trap "/bin/rm -f ${TMPFILE}" EXIT 
check_env set

if [[ $# -lt $MINARGS ]]; then mini_usage; cleanup; fi
while getopts ":dvV" opt; do
	case $opt in
		h)  
		$ECHO "HEY" 
		;;
		e)  
		$ECHO "HEY" 
		;;
		y)  
		$ECHO "HEY" 
		;;
		\?) 
		$ECHO "unknown arg: -$OPTARG" 
		;;
	esac
done

##################################

cd /root/
# PLAN:
# curl (look up command for curling https and ignoring certs)
# grep something from file
# if exists in file then site is good, if not then log to file that site
# is down, and what time . . .

##################################

NEW_VARS="`set -o posix ; set`"
if [ $DEBUG == "on" ]; then $ECHO $NEW_VARS >> $LOGFILE; fi
check_env unset
cleanup
