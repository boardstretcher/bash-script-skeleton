#!/usr/bin/env bash

# bash administration framework v04.2
# by: szboardstretcher

# import custom functions
source functions.sh

# trap ERR
trap failed ERR

# REQUIRED: important global variables
ENV="prod"							# environment (prod, dev, test)
DEBUG=on							# Debug output? (on/off)
INFO=on								# Informational output? (on/off)
TMPFILE=$(mktemp /tmp/myfile.XXXXX) # create a tmp file
LOGFILE=/var/log/someapp.log 		# name of log file to use
US_DATE=`date +%d%m%Y`				# US formatted date
EU_DATE=`date +%Y%m%d`				# EU formatted date
NOW=`date +%H%M`					# The time at start of script

# OPTIONAL: configure contact information for alerts/output
SYSADMIN_EMAIL="BOFH@thecave.com"
SYSADMIN_PAGER="13135551212@verizon.txt.net"

# OPTIONAL: set hosts to operate on, a key to authenticate with and 
# commands to run against the hosts
HOSTS=( host1 192.168.0.2 hostname3.com )
SSHKEY=/root/.ssh/id_rsa
COMMAND=("ls -alh; cd /; ls -alh;")

# if environment is test or dev, then set bash output to on.
if [ $ENV != "prod" ]; then
	set -o errtrace 	# fail and exit on first error
	set -o xtrace		# show all output to console while writing script
fi

# modify usage.dat to suit the program 
# call usage or mini_usage to display a usage output and exit
# if args empty then display usage and exit
if [[ $# -eq 1 ]]; then
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

##


#
# additional scripting should go here
#


##

# clear traces if dev/test were set
if [ $ENV != "prod" ]; then
	set +o errtrace
	set +o xtrace
fi

# call a clean exit
cleanup
