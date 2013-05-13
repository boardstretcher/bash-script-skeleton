# name		: bash administration framework v04.2 
# subname	: because everyone is naming everything a framework now

# *see LICENSE.md for gplv3 information concerning this framework

# ABOUT:
# file		: functions.sh
# language	: US/English
# os support: SL6/RHEL6/CENTOS6/Arch#

# function failed() 		# error handling with trap
#	usage: none really
#
function failed() {
	local r=$?
	set +o errtrace
	set +o xtrace
	echo "An error occurred..."
	cleanup
}

# function cleanup() 		# run a cleanup before exiting
#	usage: cleanup
#
function cleanup(){
	debug "Starting cleanup..."
	rm -f $TMPFILE
	debug "Finished cleanup"
	exit
}

# function get_os_locs() 	# get os-specific tool locations into variables
#	usage: get_os_locs
#
function get_os_locs(){
	RSYNC=$(which rsync)
	TAR=$(which tar)
	DD=$(which dd)
	# and so on...
}

# function debug() 			# echo debug information to screen and log if DEBUG is set to on
# 	usage: debug "the program broke"
#
function debug(){
	local msg="[debug] - $1"
	[ "$DEBUG" == "on" ] && echo $msg
	[ "$DEBUG" == "on" ] && echo $msg >> $LOGFILE
	return
 }

# function info() 			# post info to screen and log if INFO is set to on
# 	usage: info "text to output in case INFO is on"
#
function info(){
	local msg="[info] - $1"
	[ "$INFO" == "on" ] && echo $msg
	[ "$INFO" == "on" ] && echo $msg >> $LOGFILE
	return
}

# function change_ifs()		# change the default field seperator
# 	usage: change_ifs ":"
#
function change_ifs(){
	new_ifs=$1
	OLDIFS="${IFS}"
	IFS=$new_ifs
	return
}

# function check_regex()	# look for a regex in a string, if match return true
#	usage: if $(check_regex $some_var $some_regex_pattern) then; echo "true"
#
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

# function usage()			# show the usage.dat file
#	usage: usage
#
function usage(){
	source usage.dat
}

# function mini_usage()		# show the mini_usage.dat file
#	usage: mini_usage
#
function mini_usage(){
	source mini_usage.dat
}

# function alert()			# alert sysadmin email/pager with an email
#	usage: alert "the program broke" "really bad" yes yes
#
function alert(){
	local error_subject=$1
	local error_message=$2
	local email=$3
	local pager=$4
	local send=$(which mail) 
	[ "$email" == "yes" ] && $send -s '$error_subject' "$SYSADMIN_EMAIL" < "$error_message";
	[ "$pager" == "yes" ] && $send -s '$error_subject' "$SYSADMIN_PAGER" < "$error_message";
}

# function only_run_as()	# only allow script to continue if uid matches
#	usage: only_run_as 0
#
function only_run_as(){
	if [[ $EUID -ne $1 ]]; then
		echo "script must be run as uid $1" 1>&2
		exit
	fi
}

# function text()			# output text ERROR or OK with color (good for cli output)
#	usage: text error "there was some sort of error"
#	usage: text ok "everything was ok"
#
text() {
	local color=${1}
	shift
	local text="${@}"

	case ${color} in
		error  ) echo -en "["; tput setaf 1; echo -en "ERROR"; tput sgr0; echo "] ${text}";;
		ok     ) echo -en "["; tput setaf 2; echo -en "OK"; tput sgr0; echo "]    ${text}";;
	esac
	tput sgr0
}

# function only_run_in()	# check that script is run from /root/bin
#	usage: only_run_in "/home/user"
#
only_run_in(){
	local cwd=`pwd`
	if [ $cwd != "$1" ]; then
		echo "script must be run from $1 directory";
		exit
	fi
}

# function check_reqs()		# check that needed programs are installed
#	usage: none really (system)
#
function check_reqs(){
for x in "${REQUIRED_PROGS[@]}"
	do
		type "$x" >/dev/null 2>&1 || { echo "$x is required and is NOT installed. Please install $x and try again. Exiting."; exit; }
	done
}

# function check_env()		# set tracing if dev or test environment
#	usage: none really (system)
#
function check_env(){
if [ $ENV != "prod" ] && [ $1 == "set" ]; then
	set -o errtrace 				# fail and exit on first error
	set -o xtrace					# show all output to console while writing script
fi
if [ $ENV != "prod" ] && [ $1 == "unset" ]; then
	set +o errtrace
	set +o xtrace
fi
}

function if_check_ip() {
	# check if ip is alive, if so then true and do this
	echo
}

function wait_til_done(){
	# perhaps
	echo
	wait
}

function paralell_exec() {
	# fire off multiple bg jobs
	echo
	
}

function bg_exec() {
	# execute in background and move on
	echo
}

function set_verbosity(){
	# Set verbosity for script output
	echo
}

# never has so little been documented so well . . .
