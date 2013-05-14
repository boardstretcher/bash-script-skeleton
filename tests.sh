# example debug output
debug "debug info test"

# example info output
info "standard info test"

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

# test string
ASDF="the quick brown fox jumped over the slimy hogs"

# run usages
mini_usage
usage

# check cleanup
cleanup

# check_regex() test
check_regex "brown" $ASDF

# fail on something and test failure()
# asdfasdf
