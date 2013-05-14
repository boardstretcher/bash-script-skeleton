# example debug output
debug "debug info if DEBUG=on is set at beginning of script"

# example info output
info "standard info if INFO=on is set at beginning of script"

# $ECHO variables
$ECHO "ENV = $ENV"
$ECHO "MINARGS = $MINARGS"
$ECHO "DEBUG = $DEBUG"
$ECHO "INFO = $INFO"
$ECHO "TMPFILE = $TMPFILE"
$ECHO "LOGFILE = $LOGFILE"
$ECHO "US_DATE = $US_DATE"
$ECHO "EU_DATE = $EU_DATE"
$ECHO "NOW = $NOW"
$ECHO "SYSADMIN_EMAIL = $SYSADMIN_EMAIL"
$ECHO "SYSADMIN_PAGER = $SYSADMIN_PAGER"

# run usages
mini_usage
usage

# fail on something
asdfasdf
