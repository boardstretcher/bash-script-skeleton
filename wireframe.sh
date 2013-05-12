#!/usr/bin/env bash

# bash administration framework v04.2
# by: szboardstretcher

# import custom s
source s.sh

# trap ERR
trap failed ERR

# important global variables
SYSADMIN_EMAIL="BOFH@thecave.com"
SYSADMIN_PAGE="13135551212@verizon.txt.net"

ENV=prod							# environment (prod, dev, test)
DEBUG=on							# Debug output? (on/off)
INFO=on								# Informational output? (on/off)
TMPFILE=$(mktemp /tmp/myfile.XXXXX) # create a tmp file
LOGFILE=/var/log/someapp.log 		# name of log file to use
US_DATE=`date +%d%m%Y`				# US formatted date
EU_DATE=`date +%Y%m%d`				# EU formatted date
NOW=`date +%H%M`					# The time at start of script

# modify usage.dat to suit the program, call this 
# to display a usage output and exit
# usage
# mini_usage

# if arguments empty then display usage and exit
if [[ $# -eq 0 ]]; then
	mini_usage
fi

# argument handling
while getopts ":abc" opt; do
	case $opt in
		a)  echo "-a is set" ;;
		b)  echo "-b is set" ;;
		c)  echo "-c is set" ;;
		\?) echo "unknown arg: -$OPTARG" ;;
		;;
	esac
done

# set hosts to operate on, a key to authenticate with and commands
# to run against the hosts
HOSTS=( host1 192.168.0.1 hostname3.com )
SSHKEY=/root/.ssh/id_rsa
COMMAND=("ls -alh; cd /; ls -alh;")
run_on_hosts

# fail and exit on first error
set -o errtrace

# show all output to console while writing script
set -o xtrace

# example debug output
debug "debug info if DEBUG=on is set at beginning of script"
info "standard info if INFO=on is set at beginning of script"

##


#
# additional scripting should go here
#


##

# call a clean exit
set +o errtrace
set +o xtrace
cleanup
