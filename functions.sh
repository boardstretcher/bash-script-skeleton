# debug info to be shown if DEBUG is set to 'on'
# usage: debug "text to output in case debug is on"
function failed() {
	local r=$?
	set +o errtrace
	set +o xtrace
	echo "An error occurred..."
	clean_exit
}

# run a cleanup before exiting
function clean_exit(){
	debug "Starting cleanup..."
	rm -f $TMPFILE
	debug "Finished cleanup"
	exit
}

function debug(){
	local msg="[debug] - $1"
	[ "$DEBUG" == "on" ] && echo $1
	[ "$DEBUG" == "on" ] && echo $msg > $LOGFILE
	return
 }

# post info to screen and log if INFO is set to on
# usage: info "text to output in case INFO is on"
function info(){
	local msg="[info] - $1"
	[ "$INFO" == "on" ] && echo $msg
	[ "$INFO" == "on" ] && echo $msg > $LOGFILE
	return
}

# run multiple commands on a number of hosts using ssh key
# usage: run_on_hosts(key, hostlist)
function run_on_hosts(){
	for HOST in "${HOSTS[@]}"
	do
		info "working on $HOST"
		info=`ssh -i "$KEY" "$HOST" "$COMMAND"`
	done
	return
}

# change field seperator
function change_ifs(){
	new_ifs=$1
	OLDIFS="${IFS}"
	IFS=$new_ifs
	return
}

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
