#!/usr/bin/env bash

# nearly comment free wireframe script, once you are used to the format
# and builtin functions.

VARS=`set -o posix ; set`
ENV="dev"
MINARGS=0
DEBUG=off
INFO=on
TMPFILE=$(mktemp /tmp/myfile.XXXXX)
LOGFILE=/var/log/someapp.log
US_DATE=`date +%d%m%Y`
EU_DATE=`date +%Y%m%d`
NOW=`date +%H%M`
SYSADMIN_EMAIL="BOFH@localhost"
SYSADMIN_PAGER="13135551212@localhost.verizon.net"
REQUIRED_PROGS=(bash ssh)

source colors.dat
source functions.sh
only_run_as 1000
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
		d)  
		$ECHO "-d debugging is on" 
		;;
		v)  
		$ECHO "-v verbosity is on" 
		;;
		V)  
		$ECHO "-V version info" 
		;;
		\?) 
		$ECHO "unknown arg: -$OPTARG" 
		;;
	esac
done

# Code here

NEW_VARS="`set -o posix ; set`"
if [ $DEBUG == "on" ]; then $ECHO $NEW_VARS >> $LOGFILE; fi
check_env unset
cleanup
