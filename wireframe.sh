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
# text()
# only_run_in()

# import custom colors and functions
source colors.dat
source functions.sh

# Make sure only root/whoever can run this script
# currently only uid 0 (root) is allowed to run this script
only_run_as 0 

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

# trap ERR into failed function for handling
trap failed ERR
# trap EXIT and delete tmpfile, in case cleanup is not called
trap "/bin/rm -f ${TMPFILE}" EXIT 

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
