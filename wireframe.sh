#!/usr/bin/env bash

# bash administration framework v16
# by: steve zornes
# 

# import custom functions
source functions.sh

# debugging on or off
DEBUG=on

# informational output on or off
INFO=on

# create a tmp file
TMPFILE=$(mktemp /tmp/myfile.XXXXX)

# set log file
LOGFILE=/var/log/someapp.log

# fail and exit on first error
set -o errtrace

# trap ERR
trap failed ERR
failed() {
	local r=$?
	set +o errtrace
	set +o xtrace
	echo "An error occurred..."
	echo "Starting cleanup..."
	rm -f $TMPFILE
	echo "Finished cleanup"
	exit $r
}

# example debug output
debug "debug info if DEBUG=on is set at beginning of script"

# show all output to console
set -o xtrace
