#!/bin/bash
function mailSend() {
   echo "ipvsadm service is down" |  mail -s "ipvsadm service is down" ydadmin@localhost

}
num=`sudo ipvsadm --list -n | grep 117.121.19.104| wc -l`
[ $num -eq 0 ] && sudo service keepalived restart && mailSend && exit 1 || exit 0
