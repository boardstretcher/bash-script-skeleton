#!/usr/bin/env bash

# import custom functions
source functions.sh

# debugging on or off
DEBUG=on

# create a tmp file
TMPFILE=$(mktemp /tmp/myfile.XXXXX)

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

debug "debug info if DEBUG=on is set at beginning of script"

# show all output to console
set -o xtrace
