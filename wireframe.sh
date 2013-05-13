#!/usr/bin/env bash

# see README.md for a quick step guide to using the framework

# name		: bash administration framework v04.2 
# subname	: because everyone is naming everything a framework now

# *see LICENSE.md for gplv3 information concerning this framework

# ABOUT:
# file		: wireframe.sh
# language	: US/English
# os support: SL6/RHEL6/CENTOS6/Arch

# FUNCTIONS: (see functions.sh for usage)
# failed(), cleanup(), debug(), info(), change_ifs(), check_regex()
# usage(), mini_usage(), alert(), only_run_as(), text(), only_run_in()

# grab system vars and store them in VAR_BEFORE
VARS=`set -o posix ; set`

# import custom colors and functions
source colors.dat
source functions.sh

# Make sure only root/whoever can run this script
# currently only uid 0 (root) is allowed to run this script
only_run_as 1000

# REQUIRED: important global variables
ENV="dev"							# environment (prod, dev, test)
MINARGS=0							# minimum number of cli arguments
DEBUG=off							# Debug output? (on/off)
INFO=off							# Informational output? (on/off)
TMPFILE=$(mktemp /tmp/myfile.XXXXX) # create a tmp file
LOGFILE=/var/log/someapp.log 		# name of log file to use

# SYSTEM: time and dates to construct filenames
US_DATE=`date +%d%m%Y`				# US formatted date
EU_DATE=`date +%Y%m%d`				# EU formatted date
NOW=`date +%H%M`					# The time at start of script

# OPTIONAL: configure contact info for alerts, and required programs
SYSADMIN_EMAIL="BOFH@localhost"
SYSADMIN_PAGER="13135551212@localhost.verizon.net"
REQUIRED_PROGS=(bash ssh)

# echo shell vars to log file for debugging
if [ $DEBUG == "on" ]; then echo $VARS >> $LOGFILE; fi

# check for required program(s)
check_reqs

# trap ERR into failed function for handling
trap failed ERR

# trap EXIT and delete tmpfile, in case cleanup is not called
trap "/bin/rm -f ${TMPFILE}" EXIT 

# if environment is test or dev, then set bash tracing output to on.
check_env set

# modify usage.dat to suit the program 
# call usage or mini_usage to display a usage output and exit
# if args empty then display usage and exit
if [[ $# -lt $MINARGS ]]; then mini_usage; cleanup; fi

# argument handling - standard examples
while getopts ":dvV" opt; do
	case $opt in
		d)  
		echo "-d debugging is on" 
		;;
		v)  
		echo "-v verbosity is on" 
		;;
		V)  
		echo "-V version info" 
		;;
		\?) 
		echo "unknown arg: -$OPTARG" 
		;;
	esac
done

##################################

# test the framework by uncommenting the next line:
# source tests.sh

#
# additional scripting should go here
# see snippets.dat for small pieces of re-usable code for
# various admin functions. paste them here and change the variables
# to suit your needs.
#


##################################

# echo all current vars to log file for debugging
NEW_VARS="`set -o posix ; set`"
if [ $DEBUG == "on" ]; then echo $NEW_VARS >> $LOGFILE; fi

# clear bash traces if dev/test was set
check_env unset

# call a clean exit
cleanup
