<h2>bss (bash script skeleton)</h2>
<pre>
MIT License
a starting template to make everyday scripts in bash
</pre>
<br/><b>CONTENTS:</b><br/>
<pre>
LICENSE.md		: License that this work is licensed under
README.md		: this file
functions.sh	: commonly used functions for administration
wireframe.sh	: a shell of a bash script with useful stuff already available
usage.dat		: full usage information for the program
mini_usage.dat	: mini version of usage information
tests.sh       : source this file in the middle of the wireframe to test functions
</pre>
<br/><b>ABOUT:</b><br/>
<pre>
bash script skeleton v04.2
by				   : boardstretcher@gmail.com
language		   : US/English
os support		: Centos/Redhat/Arch
</pre>
<br/><b>PURPOSE:</b><br/>
<pre>
this is meant to be a skeleton of a bash script with all the error handling,
logging, environment seperation, and the rest, already in it. So we can worry
about creating scripts instead of re-creating the skeleton everytime. Its a 
great starting place.

there are also a collection of useful functions to use throughout the 
framework.

and additionally there are snippets of bash commands that i've compiled 
that can be a helpful starting place
</pre>
<br/><b>INTRO:</b><br/>
<pre>
edit your script copy as much as you can. it is only a template/framework
and meant to be starting point. you have to tailor it to your requirements.
</pre>
<br/><b>CONFIG STEPS:</b><br/>
<pre>
) copy wireframe.sh to the scriptname of your choosing
) comment 'only_run_as 0' if you'd like to run this script as non-root
) fill out the 'important global variables' REQUIRED section
) fill out the 'global variables' OPTIONAL section if you'd like
) modify the 'argument handling' section to fit your script idea
) modify the files usage.dat and mini_usage.dat to reflect help for your script.
) write some code in the CODE section, or feel free to copy and paste useful bits from snippets.dat
) run. test. debug. run. test. debug. [repeat until you've got it right]
</pre>
