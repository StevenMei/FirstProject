#!/bin/bash
#ScriptName: start.sh
#Date: 2014-12-26
#Author: liuxueming
#Description: used to start tomcat application based on killing PID.

#set variables
APPNAME='mb.snail.com-82'
TPID=`ps aux | grep "$APPNAME" | grep -v 'grep' | awk '{print $2}'`
selection=$1
#JAVA_HOME variables for sudo,if not use sudo,can cancel with #
JAVA_HOME=/usr/java/default


#export path and java variables for sudo,if not use sudo,can cancel with # 
export JAVA_HOME
export JRE_HOME=$JAVA_HOME/jre
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar:$JRE_HOME/lib/rt.jar
export PATH=$PATH:$JAVA_HOME/bin:$JRE_HOME/bin

#import system function library
. /etc/rc.d/init.d/functions

function startup () {
    if [ -z $TPID ];then
#        echo -en "$APPNAME application is not starting,...you can input Y/y to start:"
	echo -e "\033[43;31m$APPNAME application is not starting,...it will start...:\033[0m"
#	read selection
	case $selection in
	    Y|y)
		./startup.sh
		;;
	    *)
	    ;;
	esac
    else
#	echo -en "$APPNAME application had starting....,you can input Y/y to stop and then start:"
	echo -e "\033[43;31m$APPNAME application had starting...,it will be to stop and then start:\033[0m"
#	read selection
	case $selection in
	    Y|y)
	        kill -9 "$TPID"
		sleep 1
		if [ -z `ps aux | grep "$APPNAME" | grep -v 'grep' | awk '{print $2}'` ];then
		    ./startup.sh
		else
		    ps aux | grep "$APPNAME" | grep -v 'grep' | awk '{print $2}' | xargs kill -9
		    [ $? -eq 0 ] && ./startup.sh
		fi
		;;
	    *)
		;;
	esac
    fi

}

#main execute
startup
