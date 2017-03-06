#!/bin/bash
#
echo "hello start" >> /opt/shellscripts/test.log
contact='ydadmin@localhost'
Usage() {
	echo "Usage:`basename $0` {master|backup|fault} VIP"
}
Notify() {
	subject="`hostname`'s state changed to $1"
	mailbody="`date "+%F %T"`:`hostname`'s state change to $1,$VIP floating."
	echo $mailbody | mail -s "$subject" $contact
}

[ $# -lt 2 ] && Usage && exit

VIP=$2
case $1 in
	MASTER)
		Notify master
		;;
	BACKUP)
		Notify backup
		;;
	FAULT)
		Notify fault
		;;
	*)
		Usage
		exit 1
		;;
esac
