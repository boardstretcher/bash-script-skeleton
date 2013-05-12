baf (bash administrative framework) 
===
licensed under gplv3<br/><br/>
# a starting template to take care of everyday administration through bash<br/>
# <br/>
# <b>CONTENTS:</b><br/>
# <br/>
# LICENSE.md		- the gplv3 that this framework is licensed under<br/>
# README.md		- this file<br/>
# functions.sh	- commonly used functions for administration<br/>
# wireframe.sh	- a shell of a bash script with useful stuff already available<br/>
# usage.dat		- full usage information for the program<br/>
# mini_usage.dat	- mini version of usage information<br/>
# tests.sh		- source this file in the middle of the wireframe to test functions<br/>
<br/>
# <b>ABOUT:</b><br/>
# bash administration framework v04.2<br/>
# by		: boardstretcher@gmail.com<br/>
# language	: US/English<br/>
# os support: SL6/RHEL6/CENTOS6/Arch<br/>
#<br/>
# <b>INTRO:</b><br/>
# edit your script copy as much as you can. it is only a template/framework<br/>
# and meant to be starting point. you have to tailor it to your requirements.<br/>
#<br/>
# <b>CONFIG STEPS:</b><br/>
# 0) copy wireframe.sh to the scriptname of your choosing<br/>
# 1) comment 'only_run_as 0' if you'd like to run this script as non-root<br/>
# 2) fill out the 'important global variables' REQUIRED section<br/>
# 3) fill out the 'global variables' OPTIONAL section if you'd like<br/>
# 4) modify the 'argument handling' section to fit your script idea<br/>
# 5) modify the files usage.dat and mini_usage.dat to reflect help for<br/>
#    your script.<br/>
# 6) write some code in the CODE section, or feel free to copy and <br/>
#    paste useful bits from snippets.dat<br/>
# 7) run. test. debug. run. test. debug. <repeat until you've got it right><br/>
