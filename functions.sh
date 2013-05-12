function debug()
{
	 [ "$DEBUG" == "on" ] &&  echo $1 #$@
 }
