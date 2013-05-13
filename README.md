<h2>baf (bash administrative framework)</h2>
<pre>
licensed under gplv3
a starting template to take care of everyday administration through bash
</pre>
<br/><b>CONTENTS:</b><br/>
<pre>
LICENSE.md		: the gplv3 that this framework is licensed under
README.md		: this file
functions.sh	: commonly used functions for administration
wireframe.sh	: a shell of a bash script with useful stuff already available
usage.dat		: full usage information for the program
mini_usage.dat	: mini version of usage information
tests.sh		: source this file in the middle of the wireframe to test functions
</pre>
<br/><b>ABOUT:</b><br/>
<pre>
bash administration framework v04.2
by				: boardstretcher@gmail.com
language		: US/English
os support		: SL6/RHEL6/CENTOS6/Arch
</pre>
<br/><b>INTRO:</b><br/>
<pre>
edit your script copy as much as you can. it is only a template/framework
and meant to be starting point. you have to tailor it to your requirements.
</pre>
<br/><b>CONFIG STEPS:</b><br/>
<pre>
4) copy wireframe.sh to the scriptname of your choosing
) comment 'only_run_as 0' if you'd like to run this script as non-root
) fill out the 'important global variables' REQUIRED section
) fill out the 'global variables' OPTIONAL section if you'd like
) modify the 'argument handling' section to fit your script idea
) modify the files usage.dat and mini_usage.dat to reflect help for
   your script.<br/>
) write some code in the CODE section, or feel free to copy and
   paste useful bits from snippets.dat
2) run. test. debug. run. test. debug. [repeat until you've got it right]
</pre>
