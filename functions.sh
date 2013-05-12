# debug info to be shown if DEBUG is set to 'on'
function debug()
{

	local msg = "[debug] - " + $1
	[ "$DEBUG" == "on" ] &&  echo $1
	echo $msg > $LOGFILE
 }

# post info to log
function info()
{
	local msg = "[info] - " + $1
	[ "$INFO" == "on" ] && echo $msg
	echo $msg > $LOGFILE
}

