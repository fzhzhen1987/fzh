#!/bin/bash
getid=`xinput --list | grep "Synaptics TM3288-003" | awk  '{print $5}'| awk -F"=" '{print $2}'`

getstate(){
    echo $(xinput --list-props $getid | grep Enable | awk -F: '{print $2}')
}

on(){
    #synclient  TouchpadOff=0
    xinput set-prop $getid 'Device Enabled' 1
    echo -e "\e[0;36mtouchpad $getid on.\e[0m" # cyan
    exit
}

off(){
    #synclient TouchpadOff=1
    xinput set-prop $getid 'Device Enabled' 0
    echo -e "\e[0;36mtouchpad $getid off.\e[0m" # cyan
    exit
}

case $(getstate) in
	"0" ) on
	      ;;
	"1" ) off
	      ;;
esac
