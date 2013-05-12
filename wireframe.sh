#!/usr/bin/env bash

# bash administration framework v04.2

# ABOUT:
# file		: wireframe.sh
# language	: US/English
# os support: SL6/RHEL6/CENTOS6/Arch

# FUNCTIONS: (see functions.sh for usage)
# failed()
# cleanup()
# debug()
# info()
# change_ifs()
# check_regex()
# usage()
# mini_usage()
# alert()
# only_run_as()

# return true if file exists
function if_exist(){
	if [ -f "/some/file/exists" ]; then
	echo "the file exists"
	fi
}

# look for a regex in a string, if match return true
function check_regex(){
	local input=$1
	local regex=$2
	if [[ $input =~ $regex ]]; then
		# echo "found some regex"
		return true
	else
		# echo "did not find some regex"
		return false
	fi
}

# show script usage and exit
function usage(){
	source usage.dat
}

# show mini script usage and exit
function mini_usage(){
	source mini_usage.dat
}

# alert sysadmin with email
function alert(){
	local error_subject=$1
	local error_message=$2
	local email=$3
	local pager=$4
	local send=$(which mail) 
	[  -z "$email" ] && $send -s '$error_subject' "$SYSADMIN_EMAIL" < "$error_message";
	[  -z "$pager" ] && $send -s '$error_subject' "$SYSADMIN_PAGER" < "$error_message";
}

function only_run_as(){
	if [[ $EUID -ne $1 ]]; then
		echo "script must be run as uid $1" 1>&2
		exit
	fi
}


# import custom colors and functions
source colors.dat
source functions.sh

# Make sure only root/whoever can run this script
# currently only uid 0 (root) is allowed to run this script
only_run_as 0 

# trap ERR into failed function for handling
trap failed ERR

# REQUIRED: important global variables
ENV="test"							# environment (prod, dev, test)
MINARGS=0							# minimum number of cli arguments
DEBUG=on							# Debug output? (on/off)
INFO=on								# Informational output? (on/off)
TMPFILE=$(mktemp /tmp/myfile.XXXXX) # create a tmp file
LOGFILE=/var/log/someapp.log 		# name of log file to use

# SYSTEM: standards
US_DATE=`date +%d%m%Y`				# US formatted date
EU_DATE=`date +%Y%m%d`				# EU formatted date
NOW=`date +%H%M`					# The time at start of script

# OPTIONAL: configure contact information for alerts/output
SYSADMIN_EMAIL="BOFH@thecave.com"
SYSADMIN_PAGER="13135551212@verizon.txt.net"

# if environment is test or dev, then set bash output to on.
if [ $ENV != "prod" ]; then
	set -o errtrace 				# fail and exit on first error
	set -o xtrace					# show all output to console while writing script
fi

# modify usage.dat to suit the program 
# call usage or mini_usage to display a usage output and exit
# if args empty then display usage and exit
if [[ $# -lt $MINARGS ]]; then
	mini_usage
	cleanup
fi

# argument handling
while getopts ":abc" opt; do
	case $opt in
		a)  
		echo "-a is set" 
		;;
		b)  
		echo "-b is set" 
		;;
		c)  
		echo "-c is set" 
		;;
		\?) 
		echo "unknown arg: -$OPTARG" 
		;;
	esac
done

##################################


#
# additional scripting should go here
# see snippets.dat for small pieces of re-usable code for
# various admin functions. paste them here and change the variables
# to suit your needs.
#


##################################

# clear traces if dev/test were set
if [ $ENV != "prod" ]; then
	set +o errtrace
	set +o xtrace
fi

# call a clean exit
cleanup
