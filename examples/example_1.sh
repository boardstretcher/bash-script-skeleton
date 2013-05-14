#!/usr/bin/env bash

# wireframe copy - an example minimum use case

# decided for this particular backup script, to not use logging or
# alerting, or debugging, and I dont need a tmpfile. Also there are no
# arguments. So, i just delete all that stuff I dont need.

VARS=`set -o posix ; set`
ENV="dev"
DEBUG=off
INFO=off
US_DATE=`date +%d%m%Y`
EU_DATE=`date +%Y%m%d`
NOW=`date +%H%M`
REQUIRED_PROGS=(tar)

source colors.dat
source functions.sh

check_reqs

trap failed ERR


##################################

#
# additional scripting should go here
# see snippets.dat for small pieces of re-usable code for
# various admin functions. paste them here and change the variables
# to suit your needs.
#

tar czvf /tmp/backup.tar.gz /root/.bash_history
cd /root/
echo "I backed this up at $NOW" > backup.nfo

##################################

cleanup
